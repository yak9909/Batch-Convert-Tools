@echo off

echo 音声ファイルの形式を選んでください
echo 1: .mp3
echo 2: .wav

:While01
set /p extension="ファイル形式: "
if %extension% leq 2 (
    if %extension% leq 0 (goto IndexError01)
    if %extension% == 1 (set extension=mp3)
    if %extension% == 2 (set extension=wav)
    goto EndWhile01
)
goto IndexError01

:IndexError01
echo ファイル形式は1から2までを指定して下さい
goto While01

:EndWhile01
cd %~dp0
@echo on

ffmpeg -i %1 "%~nx1 (converted).%extension%"