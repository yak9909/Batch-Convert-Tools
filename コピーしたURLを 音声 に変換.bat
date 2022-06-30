@echo off
setlocal

for /f "usebackq delims=" %%a in (`powershell get-clipboard`) do set url=%%a

echo %url% をダウンロードします…

:While01
echo 保存するファイルの形式を指定してください
echo 1: wav
echo 2: mp3
echo 3: m4a

set mxchoice=3
set /p filetype="ファイル形式: "
if %filetype% leq %mxchoice% (
    if %filetype% leq 0 (goto IndexError)
    if %filetype% == 1 (set filetype=wav)
    if %filetype% == 2 (set filetype=mp3)
    if %filetype% == 3 (set filetype=m4a)
    goto EndWhile01
)
goto IndexError

:IndexError
echo ファイル形式は1から3までを指定して下さい
goto While01

:EndWhile01
yt-dlp -x --audio-format %filetype% %url%