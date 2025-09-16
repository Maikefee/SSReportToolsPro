#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
SSReportTools 启动脚本

Author: MaiKeFee
GitHub: https://github.com/Maikefee/
Email: maketoemail@gmail.com
WeChat: rggboom
"""

import sys
import os
from pathlib import Path

# 添加当前目录到Python路径
current_dir = Path(__file__).parent
sys.path.insert(0, str(current_dir))

def show_startup_info():
    """显示启动信息"""
    print("=" * 60)
    print("SSReportTools - 渗透测试报告生成工具 v1.2.0")
    print("=" * 60)
    print()
    print("作者信息:")
    print("  👨‍💻 作者: MaiKeFee")
    print("  🔗 GitHub: https://github.com/Maikefee/")
    print("  📧 邮箱: maketoemail@gmail.com")
    print("  💬 微信: rggboom")
    print()
    print("个人格言:")
    print("  💡 只有精通计算机理论的人，才具有研究能力。")
    print()
    print("功能特性:")
    print("  🔒 专业漏洞库 (30+ 漏洞类型)")
    print("  📊 OWASP Top 10 2021 支持")
    print("  🛠️  完整漏洞管理 (增删改查)")
    print("  📝 智能报告生成")
    print("  🌐 跨平台支持")
    print()
    print("正在启动应用程序...")
    print("=" * 60)

try:
    # 显示启动信息
    show_startup_info()
    
    from main import main
    main()
except ImportError as e:
    print(f"导入错误: {e}")
    print("请确保已安装所需依赖:")
    print("pip install -r requirements.txt")
    sys.exit(1)
except Exception as e:
    print(f"运行错误: {e}")
    sys.exit(1)
