@echo off

echo �����t�@�C���̌`����I��ł�������
echo 1: .mp3
echo 2: .wav

:While01
set /p extension="�t�@�C���`��: "
if %extension% leq 2 (
    if %extension% leq 0 (goto IndexError01)
    if %extension% == 1 (set extension=mp3)
    if %extension% == 2 (set extension=wav)
    goto EndWhile01
)
goto IndexError01

:IndexError01
echo �t�@�C���`����1����2�܂ł��w�肵�ĉ�����
goto While01

:EndWhile01
cd %~dp0
@echo on

ffmpeg -i %1 "%~nx1 (converted).%extension%"