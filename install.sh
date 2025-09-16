#!/bin/bash
# SSReportTools 安装脚本

echo "SSReportTools 安装脚本"
echo "======================"

# 检查Python版本
echo "检查Python环境..."
if command -v python3 &> /dev/null; then
    PYTHON_CMD="python3"
    PIP_CMD="pip3"
    echo "✓ 找到 Python 3: $(python3 --version)"
elif command -v python &> /dev/null; then
    python_version=$(python -c "import sys; print(sys.version_info[0])" 2>/dev/null)
    if [ "$python_version" = "3" ]; then
        PYTHON_CMD="python"
        PIP_CMD="pip"
        echo "✓ 找到 Python 3: $(python --version)"
    else
        echo "✗ 需要 Python 3，但找到的是 Python 2"
        echo "请安装 Python 3 或使用 python3 命令"
        exit 1
    fi
else
    echo "✗ 未找到 Python"
    echo "请先安装 Python 3"
    exit 1
fi

# 检查pip
echo "检查pip..."
if ! command -v $PIP_CMD &> /dev/null; then
    echo "✗ 未找到 pip"
    echo "请先安装 pip"
    exit 1
fi
echo "✓ 找到 pip: $($PIP_CMD --version)"

# 安装依赖
echo "安装依赖包..."
$PIP_CMD install -r requirements.txt

if [ $? -eq 0 ]; then
    echo "✓ 依赖包安装成功"
else
    echo "✗ 依赖包安装失败"
    exit 1
fi

# 测试应用程序
echo "测试应用程序..."
$PYTHON_CMD test_app.py

if [ $? -eq 0 ]; then
    echo ""
    echo "✓ 安装完成！"
    echo ""
    echo "启动应用程序:"
    echo "  ./start.sh"
    echo "  或"
    echo "  $PYTHON_CMD run.py"
    echo ""
    echo "注意事项:"
    echo "1. 确保 config/ 目录下的配置文件格式正确"
    echo "2. 生成的报告需要 Microsoft Word 或兼容软件打开"
    echo "3. 建议定期备份模板和配置文件"
else
    echo "✗ 应用程序测试失败"
    echo "请检查错误信息并重试"
    exit 1
fi
