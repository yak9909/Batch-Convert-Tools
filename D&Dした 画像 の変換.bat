@echo off

echo �ϊ���̉摜�̌`����I��ł�������
echo 1: png
echo 2: jpg
echo 3: bmp
echo 4: webp

:While01
set /p conv_type="�t�@�C���`��: "
if %conv_type% leq 4 (
    if %conv_type% leq 0 (goto IndexError01)
    if %conv_type% == 1 (set conv_type=png)
    if %conv_type% == 2 (set conv_type=jpg)
    if %conv_type% == 3 (set conv_type=bmp)
    if %conv_type% == 4 (set conv_type=webp)
    goto EndWhile01
)
goto IndexError01

:IndexError01
echo �t�@�C���`����1����4�܂ł��w�肵�ĉ�����
goto While01

:EndWhile01
cd %~dp0
@echo on
magick convert "%1" "%~nx1 (converted).%conv_type%"