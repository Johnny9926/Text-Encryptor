@ECHO OFF
REM BFCPEOPTIONSTART
REM Advanced BAT to EXE Converter www.BatToExeConverter.com
REM BFCPEEXE=C:\Users\legen\Desktop\My App\Text Encryptor.exe
REM BFCPEICON=D:\Download\Advanced BAT to EXE Converter v4.11\ab2econv411\icons\icon5.ico
REM BFCPEICONINDEX=-1
REM BFCPEEMBEDDISPLAY=0
REM BFCPEEMBEDDELETE=1
REM BFCPEADMINEXE=0
REM BFCPEINVISEXE=0
REM BFCPEVERINCLUDE=1
REM BFCPEVERVERSION=2.0.2.4
REM BFCPEVERPRODUCT=Text Encryptor and Decryptor
REM BFCPEVERDESC=This program will encrypt your text
REM BFCPEVERCOMPANY=
REM BFCPEVERCOPYRIGHT=
REM BFCPEEMBED=C:\Users\legen\Desktop\Data.txt
REM BFCPEOPTIONEND
@ECHO ON
@echo off
title Text Encryptor
setlocal enableDelayedExpansion

:INTRO
echo Wellcome to Text Encryptor
ping localhost -n 3 >nul
echo.
echo This program will encrypt any of your text message and
echo decrypt it with a special key (called a decryptor) that
echo is only generated after encrypt the text, and is disposable.
echo after decrypting, the decryptor, even if successfully decrypt
echo the text or not, it will delete itself.
echo.
pause
cls
echo Another thing to know is the capital letter will become
echo un-capital
echo.
pause
cls
echo That's it.
echo.
pause
goto ENCRYPTOR



:ENCRYPTOR
cls
echo Please enter a number:
echo.
set /p code1=1st encrypt code: 
set /p code2=2nd encrypt code: 
set /p code3=3rd encrypt code: 

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
echo Text encrypted 
ping localhost -n 3 >nul
goto ASK



:: Ask to create a decryptor
:ASK
cls
echo Do you want to create a decryptor? (Y/N)
echo.
echo =====================================================
echo Note that without the decryptor, you won't be able to
echo decrypt your encrypted text
echo After decrypt the text, even if success or not, the
echo decryptor will kill itself
echo =====================================================
echo.
set /p ans=Your answer: 
if %ans%==Y goto DECRYPTOR
if %ans%==y goto DECRYPTOR
if %ans%==n goto ASK2



:: Ask for sure after denied creating a decryptor
:ASK2
cls
set /p aus=Are you sure? (Y/N): 
if %aus%==Y goto SAVE-TEXT
if %aus%==y goto SAVE-TEXT
if %aus%==N goto ASK
if %aus%==n goto ASK
echo Invalid choice
ping localhost -n 3 >nul
goto ASK2



:: Start creating decryptor
:DECRYPTOR
cls

echo Creating a decryptor on your desktop....
ping localhost -n 6 >nul

echo @echo off > C:\Users\%USERNAME%\Desktop\Decryptor.bat
echo title Text Decryptor >> C:\Users\%USERNAME%\Desktop\Decryptor.bat
echo setlocal enableDelayedExpansion >> C:\Users\%USERNAME%\Desktop\Decryptor.bat
echo :CODE >> C:\Users\%USERNAME%\Desktop\Decryptor.bat
echo set code1=%code1% >> C:\Users\%USERNAME%\Desktop\Decryptor.bat
echo set code2=%code2% >> C:\Users\%USERNAME%\Desktop\Decryptor.bat
echo set code3=%code3% >> C:\Users\%USERNAME%\Desktop\Decryptor.bat
type %MYFILES%\Data.txt >> C:\Users\%USERNAME%\Desktop\Decryptor.bat


cls
echo Succesfully created decryptor
ping localhost -n 3 >nul
goto SAVE-TEXT



:: Save encrypted text
:SAVE-TEXT
cls
echo We will create a file named "Encrypted text.txt" on your desktop to save the encrypted text and exit the program....
ping localhost -n 6 >nul
echo !text! > "C:\Users\%USERNAME%\Desktop\Encrypted text.txt"