@echo off
setlocal

for /f "usebackq delims=" %%a in (`powershell get-clipboard`) do set url=%%a

echo %url% ���_�E�����[�h���܂��c

:While01
echo �ۑ�����t�@�C���̌`�����w�肵�Ă�������
echo 1: wav
echo 2: mp3
echo 3: m4a

set mxchoice=3
set /p filetype="�t�@�C���`��: "
if %filetype% leq %mxchoice% (
    if %filetype% leq 0 (goto IndexError)
    if %filetype% == 1 (set filetype=wav)
    if %filetype% == 2 (set filetype=mp3)
    if %filetype% == 3 (set filetype=m4a)
    goto EndWhile01
)
goto IndexError

:IndexError
echo �t�@�C���`����1����3�܂ł��w�肵�ĉ�����
goto While01

:EndWhile01
yt-dlp -x --audio-format %filetype% %url%