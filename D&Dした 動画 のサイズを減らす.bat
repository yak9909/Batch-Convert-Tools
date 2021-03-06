@echo off

echo 圧縮レベルを指定してください
echo 1: 少し (映像が少し乱れる)
echo 2: まぁまぁ (映像がまぁまぁ乱れる)
echo 3: かなり (映像がかなり乱れる)
echo 4: えぐいて〜〜〜！ｗ (映像が乱れまくりになる)

:While01
set /p level="解像度: "
if %level% leq 4 (
    if %level% leq 0 (goto IndexError01)
    if %level% == 1 (set level=24)
    if %level% == 2 (set level=32)
    if %level% == 3 (set level=40)
    if %level% == 4 (set level=90)
    goto EndWhile01
)
goto IndexError01

:IndexError01
echo 解像度は1から4までを指定して下さい
goto While01

:EndWhile01
cd %~dp0
@echo on
ffmpeg -i %1 -vcodec libx264 -crf %level% "%~nx1 (compressed).mp4"