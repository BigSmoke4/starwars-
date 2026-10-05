@echo off
cd /d "%~dp0"
echo Starting local server at http://localhost:8137 - keep this window open.
start "" http://localhost:8137
where py >nul 2>nul && (py -m http.server 8137 & goto :eof)
where python >nul 2>nul && (python -m http.server 8137 & goto :eof)
where npx >nul 2>nul && (npx --yes serve -l 8137 & goto :eof)
echo Could not find Python or Node.js. Install Python from python.org (tick "Add to PATH"), then run this again.
pause
