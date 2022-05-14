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

echo メディアの保存を開始します…

yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" -o "%filename%.mp4" %url%