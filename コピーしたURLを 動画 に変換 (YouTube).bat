@echo off
setlocal

for /f "usebackq delims=" %%a in (`powershell get-clipboard`) do set url=%%a

echo ���f�B�A��� %url% ���擾���܂��c

for /f "usebackq delims=" %%a in (`yt-dlp -e "%url%"`) do set title=%%a

echo ���f�B�A�^�C�g��... %title%

for /f "usebackq delims=" %%a in (`yt-dlp --print "%%(uploader)s - %title% [%%(id)s]" %url%`) do set filename=%%a
for %%a in (^\ ^/ ^: ^* ^? ^" ^< ^> ^|) do call set filename=%%filename:%%a=%%

echo ���f�B�A���̎擾���������܂���
echo;

:While01
echo �𑜓x���w�肵�Ă�������
echo 1: 480p
echo 2: 720p
echo 3: 1080p

set mxchoice=3
set /p res="�𑜓x: "
if %res% leq %mxchoice% (
    if %res% leq 0 (goto IndexError)
    if %res% == 1 (set res=480)
    if %res% == 2 (set res=720)
    if %res% == 3 (set res=1080)
    goto EndWhile01
)
goto IndexError

:EndWhile01
echo ���Ԃ��w�肵�܂����H
echo 1: �͂�
echo 2: ������

set mxchoice=2
set /p time="1��2��I�����Ă�������: "
if %time% leq %mxchoice% (
    if %time% leq 0 (goto IndexError)
    if %time% == 1 (goto SetTime)
    if %time% == 2 (goto EndWhile02)
    goto EndWhile01
)
goto IndexError

:SetTime
echo ��:��:�b �̂悤�Ɏw�肵�Ă�������
set /p start="�J�n����: "

echo ��:��:�b �̂悤�Ɏw�肵�Ă�������
set /p kirinuki="�I������: "

for /f "usebackq delims=" %%c in (`yt-dlp -g "%url%" -f "[height<=%res%][fps<=60]"`) do set time_url=%%c
ffmpeg -ss %start% -to %kirinuki% -i "%time_url%" -c copy "(trimmed) %filename%.mp4"
exit

:IndexError
echo �𑜓x��1����%mxchoice%�܂ł��w�肵�ĉ�����
goto While01

:EndWhile02
@echo on
yt-dlp %url% -f "[height<=%res%][fps<=60]" -o "%filename%.mp4" --no-mtime