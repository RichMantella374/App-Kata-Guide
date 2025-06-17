// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/theme_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final _client = Supabase.instance.client;
  List<Map<String, dynamic>> _events = [];
  bool _loading = true;
  bool _isAdmin = false;

  @override
  void initState() {
    super.initState();
    _loadEvents();
    _checkIfAdmin();
  }

  Future<void> _checkIfAdmin() async {
    final userId = _client.auth.currentUser?.id;
    if (userId == null) return;

    final response =
        await _client
            .from('profiles')
            .select('is_admin')
            .eq('id', userId)
            .limit(1)
            .maybeSingle();

    if (response != null && response['is_admin'] == true) {
      setState(() {
        _isAdmin = true;
      });
    }
  }

  Future<void> _loadEvents() async {
    final response = await _client.from('events').select().order('date');
    setState(() {
      _events = List<Map<String, dynamic>>.from(response);
      _loading = false;
    });
  }

  Future<void> _showEventDialog({Map<String, dynamic>? existingEvent}) async {
    final titleController = TextEditingController(
      text: existingEvent?['title'] ?? '',
    );
    final descController = TextEditingController(
      text: existingEvent?['description'] ?? '',
    );
    DateTime? selectedDate =
        existingEvent != null
            ? DateTime.tryParse(existingEvent['date'])?.toLocal()
            : null;

    await showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text(
              existingEvent != null ? 'Editar Evento' : 'Nuevo Evento',
            ),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(labelText: 'Título'),
                  ),
                  TextField(
                    controller: descController,
                    decoration: const InputDecoration(labelText: 'Descripción'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.date_range),
                    label: const Text("Seleccionar Fecha"),
                    onPressed: () async {
                      final now = DateTime.now();
                      final date = await showDatePicker(
                        context: context,
                        initialDate: selectedDate ?? now,
                        firstDate: DateTime(now.year - 1),
                        lastDate: DateTime(now.year + 2),
                      );
                      if (date != null) {
                        setState(() => selectedDate = date);
                      }
                    },
                  ),
                  if (selectedDate != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text('Fecha: ${selectedDate!.toLocal()}'),
                    ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () async {
                  if (titleController.text.isEmpty || selectedDate == null) {
                    return;
                  }

                  final eventData = {
                    'title': titleController.text,
                    'description': descController.text,
                    'date': selectedDate!.toIso8601String().split('T').first,
                  };

                  if (existingEvent != null) {
                    final response =
                        await _client
                            .from('events')
                            .update(eventData)
                            .eq('id', existingEvent['id'])
                            .select(); // ← Importante para obtener datos

                    print(
                      "Update response: $response",
                    ); // ← Verás un mapa del evento actualizado
                  } else {
                    final response =
                        await _client.from('events').insert({
                          ...eventData,
                          'created_by': _client.auth.currentUser!.id,
                        }).select();

                    print(
                      "Insert response: $response",
                    ); // ← Verás el nuevo evento
                  }

                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                  _loadEvents();
                },

                child: const Text('Guardar'),
              ),
            ],
          ),
    );
  }

  Future<void> _deleteEvent(String id) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text('Eliminar evento'),
            content: const Text(
              '¿Estás seguro de que deseas eliminar este evento?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Eliminar'),
              ),
            ],
          ),
    );

    if (confirmed == true) {
      await _client.from('events').delete().eq('id', id);
      _loadEvents();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Consumer<ThemeProvider>(
          builder: (context, themeProvider, _) {
            final isDarkMode = themeProvider.appThemeMode == AppThemeMode.dark;
            return Image.network(
              isDarkMode
                  ? 'https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cintas//fondo%202.jpg'
                  : 'https://kwyvfrezracwueimcsiz.supabase.co/storage/v1/object/public/cintas//fondo.jpeg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            );
          },
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text("Calendario de Eventos"),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body:
              _loading
                  ? const Center(child: CircularProgressIndicator())
                  : _events.isEmpty
                  ? const Center(child: Text('No hay eventos disponibles'))
                  : ListView.builder(
                    itemCount: _events.length,
                    itemBuilder: (context, index) {
                      final e = _events[index];
                      final date =
                          DateTime.tryParse(e['date'] ?? '')?.toLocal();
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e['title'],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(e['description'] ?? ''),
                              const SizedBox(height: 8),
                              Text(
                                date != null
                                    ? "Fecha: ${date.day}/${date.month}/${date.year}"
                                    : "Sin fecha",
                                style: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 12,
                                ),
                              ),
                              if (_isAdmin)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.blue,
                                      ),
                                      onPressed:
                                          () => _showEventDialog(
                                            existingEvent: e,
                                          ),
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      onPressed: () => _deleteEvent(e['id']),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          floatingActionButton:
              _isAdmin
                  ? Padding(
                    padding: const EdgeInsets.only(
                      bottom: 60,
                    ), // Ajusta el valor si quieres más/menos separación
                    child: FloatingActionButton(
                      onPressed: () => _showEventDialog(),
                      tooltip: 'Agregar evento',
                      child: const Icon(Icons.add),
                    ),
                  )
                  : null,
        ),
      ],
    );
  }
}
