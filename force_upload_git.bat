@echo off
:: Hỗ trợ hiển thị tiếng Việt trong cửa sổ cmd
chcp 65001 > nul 

echo ===================================================
echo   TOOL UPLOAD GIT TU DONG - EP GHI DE (FORCE PUSH)
echo ===================================================
echo.

:: Di chuyển con trỏ làm việc về đúng thư mục chứa file .bat
cd /d "%~dp0"

:: Yêu cầu nhập nội dung commit
set /p COMMIT_MSG="Nhap noi dung commit (Vi du: Update code): "

:: Nếu để trống không gõ gì và Enter, sẽ lấy tên mặc định là thời gian hiện tại
if "%COMMIT_MSG%"=="" set COMMIT_MSG=Auto commit %date% %time%

echo.
echo [1/3] Dang them tat ca file vao Git...
git add -A

echo.
echo [2/3] Dang tao commit...
git commit -m "%COMMIT_MSG%"

echo.
echo [3/3] Dang ep day len Git (Force Push len nhanh main)...
git push origin main --force

echo.
echo ===================================================
echo   HOAN THANH UPLOAD!
echo ===================================================
pause