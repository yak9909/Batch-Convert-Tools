@echo off

echo ���k���x�����w�肵�Ă�������
echo 1: ���� (�f�������������)
echo 2: �܂��܂� (�f�����܂��܂������)
echo 3: ���Ȃ� (�f�������Ȃ藐���)
echo 4: �������ā`�`�`�I�� (�f��������܂���ɂȂ�)

:While01
set /p level="�𑜓x: "
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
echo �𑜓x��1����4�܂ł��w�肵�ĉ�����
goto While01

:EndWhile01
cd %~dp0
@echo on
ffmpeg -i %1 -vcodec libx264 -crf %level% "%~nx1 (compressed).mp4"