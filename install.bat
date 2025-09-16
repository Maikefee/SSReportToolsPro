@echo off
REM SSReportTools Windows 安装脚本

echo SSReportTools 安装脚本
echo ======================

REM 检查Python
echo 检查Python环境...
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ✗ 未找到 Python
    echo 请先安装 Python 3
    pause
    exit /b 1
)
echo ✓ 找到 Python: 
python --version

REM 检查pip
echo 检查pip...
pip --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ✗ 未找到 pip
    echo 请先安装 pip
    pause
    exit /b 1
)
echo ✓ 找到 pip: 
pip --version

REM 安装依赖
echo 安装依赖包...
pip install -r requirements.txt

if %errorlevel% neq 0 (
    echo ✗ 依赖包安装失败
    pause
    exit /b 1
)
echo ✓ 依赖包安装成功

REM 测试应用程序
echo 测试应用程序...
python test_app.py

if %errorlevel% neq 0 (
    echo ✗ 应用程序测试失败
    echo 请检查错误信息并重试
    pause
    exit /b 1
)

echo.
echo ✓ 安装完成！
echo.
echo 启动应用程序:
echo   python run.py
echo.
echo 注意事项:
echo 1. 确保 config/ 目录下的配置文件格式正确
echo 2. 生成的报告需要 Microsoft Word 或兼容软件打开
echo 3. 建议定期备份模板和配置文件
echo.
pause
