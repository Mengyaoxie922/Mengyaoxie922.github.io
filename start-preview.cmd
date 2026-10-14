@echo off
setlocal
cd /d "%~dp0"
chcp 65001 >nul
if exist "%~dp0_local\ruby\bin\ruby.exe" set "PATH=%~dp0_local\ruby\bin;%PATH%"
where ruby >nul 2>nul
if errorlevel 1 (
  echo Ruby was not found. See the local preview instructions in README.md.
  pause
  exit /b 1
)
set "RUBYOPT=-Eutf-8"
set "BUNDLE_PATH=%~dp0_local\gems"
set "BUNDLE_USER_HOME=%~dp0_local\bundle"
call bundle check
if errorlevel 1 (
  call bundle install
  if errorlevel 1 (
    pause
    exit /b 1
  )
)
echo Local preview: http://localhost:4000
echo Press Ctrl+C to stop the preview.
call bundle exec jekyll serve --config _config.yml,_config.dev.yml --livereload
if errorlevel 1 pause
endlocal
