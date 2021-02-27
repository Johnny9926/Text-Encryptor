@echo off
title Text Encryptor
setlocal enableDelayedExpansion


:ENCRYPTOR
cls
set /p code1=1st encrypt key: 
set /p code2=2nd encrypt key: 
set /p code3=3rd encrypt key: 

set /p text=Text to encrypt: 

set chars=0123456789abcdefghijklmnopqrstuvwxyz

for /l %%N in (10 1 36) do (

for /f %%C in ("!chars:~%%N,1!") do (

set /a MATH=%%N*%code1%+%code2%*%code3%

for /f %%F in ("!MATH!") do (

set "text=!text:%%C=-%%F!"

)
)
)

cls
echo Encrypted text: !text!
pause
goto ASK



:: Ask to create a decryptor
:ASK
cls
echo Do you want to create a decryptor? (Y/N)
echo =====================================================
echo Note that without the decryptor, you won't be able to
echo decrypt your encrypted text
echo After decrypt the text, even if success or not, the
echo decryptor will kill itself
echo =====================================================
set /p ans=Your answer: 
if ans==Y goto DECRYPTOR
if ans==y goto DECRYPTOR
if ans==N goto ASK2
if ans==n goto ASK2



:ASK2
cls
set /p aus=Are you sure? (Y/N): 
if ans==Y goto SAVE-TEXT
if ans==y goto SAVE-TEXT
if ans==N goto ASK
if ans==n goto ASK








:SAVE-TEXT
cls
echo We will create a file named "Encrypted text.txt" on your desktop and exit the program....
echo @echo off > 1.bat
echo title Text Decryptor >> 1.bat
echo setlocal enableDelayedExpansion >> 1.bat
echo cls >> 1.bat
echo set /p text=Encrypted text to decrypt:  >> 1.bat
echo set chars=0123456789abcdefghijklmnopqrstuvwxyz >> 1.bat
echo for /l %%N in (10 1 36) do ( >> 1.bat
echo for /f %%C in ("!chars:~%%N,1!") do ( >> 1.bat
echo set /a MATH=%%N*%code1%+%code2%*%code3% >> 1.bat
echo for /f %%F in ("!MATH!") do ( >> 1.bat
echo set "text=!text:-%%F=%%C!" >> 1.bat
echo ) >> 1.bat
echo ) >> 1.bat
echo ) >> 1.bat
echo cls >> 1.bat
echo echo Decrypted text: !text! >> 1.bat
echo pause >> 1.bat

ping localhost -n 6 >nul







