if (Test-Path "C:/lolo/app_kata/build/windows/x64") {
  Start-Sleep -Seconds 5
  Remove-Item -Recurse -Force "C:/lolo/app_kata/build/windows/x64"
}
