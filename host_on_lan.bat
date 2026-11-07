@echo off
title AI RemoveBG Studio - Hosting on Local Network (LAN)
echo ====================================================================
echo        AI RemoveBG Studio - Hosting on Local Network (Wi-Fi/LAN)
echo   បើកដំណើរការ Hosting ចែករំលែកប្រើប្រាស់ក្នុងបណ្តាញ Wi-Fi / Network
echo ====================================================================
echo.

:: Get Local IPv4 Address
for /f "tokens=4" %%a in ('route print^|findstr 0.0.0.0.*0.0.0.0') do (
    set LOCAL_IP=%%a
    goto :found_ip
)
:found_ip

echo [+] Server IP: %LOCAL_IP%
echo [+] Local Access:   http://localhost:5000
echo [+] Network Access: http://%LOCAL_IP%:5000
echo.
echo --------------------------------------------------------------------
echo   អ្នកអាចប្រើទូរស័ព្ទ (Phone) ឬកុំព្យូទ័រផ្សេងទៀតក្នុង Wi-Fi តែមួយ
echo   បើក Browser ហើយចូលទៅកាន់អាសយដ្ឋាន៖
echo.
echo        http://%LOCAL_IP%:5000
echo --------------------------------------------------------------------
echo.
echo Starting Server on 0.0.0.0:5000 ...
python app.py --host 0.0.0.0 --port 5000 --no-browser
pause

