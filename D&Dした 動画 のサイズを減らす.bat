@echo off

echo ˆ³kƒŒƒxƒ‹‚ğw’è‚µ‚Ä‚­‚¾‚³‚¢
echo 1: ­‚µ (‰f‘œ‚ª­‚µ—‚ê‚é)
echo 2: ‚Ü‚Ÿ‚Ü‚Ÿ (‰f‘œ‚ª‚Ü‚Ÿ‚Ü‚Ÿ—‚ê‚é)
echo 3: ‚©‚È‚è (‰f‘œ‚ª‚©‚È‚è—‚ê‚é)
echo 4: ‚¦‚®‚¢‚Ä```I‚— (‰f‘œ‚ª—‚ê‚Ü‚­‚è‚É‚È‚é)

:While01
set /p level="‰ğ‘œ“x: "
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
echo ‰ğ‘œ“x‚Í1‚©‚ç4‚Ü‚Å‚ğw’è‚µ‚Ä‰º‚³‚¢
goto While01

:EndWhile01
cd %~dp0
@echo on
ffmpeg -i %1 -vcodec libx264 -crf %level% "%~nx1 (compressed).mp4"