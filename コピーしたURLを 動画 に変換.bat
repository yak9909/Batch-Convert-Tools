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

echo ���f�B�A�̕ۑ����J�n���܂��c

yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" -o "%filename%.mp4" %url%