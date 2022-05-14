@echo off
setlocal

for /f "usebackq delims=" %%a in (`powershell get-clipboard`) do set url=%%a

echo メディア情報 %url% を取得します…

for /f "usebackq delims=" %%a in (`yt-dlp -e "%url%"`) do set title=%%a

echo メディアタイトル... %title%

for /f "usebackq delims=" %%a in (`yt-dlp --print "%%(uploader)s - %title% [%%(id)s]" %url%`) do set filename=%%a
for %%a in (^\ ^/ ^: ^* ^? ^" ^< ^> ^|) do call set filename=%%filename:%%a=%%

echo メディア情報の取得が完了しました
echo;

:While01
echo 解像度を指定してください
echo 1: 480p
echo 2: 720p
echo 3: 1080p

set mxchoice=3
set /p res="解像度: "
if %res% leq %mxchoice% (
    if %res% leq 0 (goto IndexError)
    if %res% == 1 (set res=480)
    if %res% == 2 (set res=720)
    if %res% == 3 (set res=1080)
    goto EndWhile01
)
goto IndexError

:EndWhile01
echo 時間を指定しますか？
echo 1: はい
echo 2: いいえ

set mxchoice=2
set /p time="1か2を選択してください: "
if %time% leq %mxchoice% (
    if %time% leq 0 (goto IndexError)
    if %time% == 1 (goto SetTime)
    if %time% == 2 (goto EndWhile02)
    goto EndWhile01
)
goto IndexError

:SetTime
echo 時:分:秒 のように指定してください
set /p start="開始時間: "

echo 時:分:秒 のように指定してください
set /p kirinuki="終了時間: "

for /f "usebackq delims=" %%c in (`yt-dlp -g "%url%" -f "[height<=%res%][fps<=60]"`) do set time_url=%%c
ffmpeg -ss %start% -to %kirinuki% -i "%time_url%" -c copy "(trimmed) %filename%.mp4"
exit

:IndexError
echo 解像度は1から%mxchoice%までを指定して下さい
goto While01

:EndWhile02
@echo on
yt-dlp %url% -f "[height<=%res%][fps<=60]" -o "%filename%.mp4" --no-mtime