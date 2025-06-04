@echo off
setlocal enabledelayedexpansion

:: 设置变量
set PYTHON_URL=https://www.python.org/ftp/python/3.11.5/python-3.11.5-embed-amd64.zip
set PIP_URL=https://bootstrap.pypa.io/get-pip.py
set HF_ENDPOINT=https://hf-mirror.com
set PIP_MIRROR=https://mirrors.aliyun.com/pypi/simple

:: 检查并安装Python
if not exist ./python-3.11.5-embed-amd64\python.exe (
    powershell -Command "& {Invoke-WebRequest -Uri !PYTHON_URL! -OutFile python.zip}"
    powershell -Command "& {Expand-Archive -Path python.zip -DestinationPath ./python-3.11.5-embed-amd64 -Force}"
    del python.zip
    (
	echo	python311.zip
        echo import site
        echo Lib
        echo Lib\site-packages
        echo .
        echo ..
        echo ../python_script
        echo ../python_script/display_ui_Storage
    ) > ./python-3.11.5-embed-amd64\python311._pth
)

:: 切换到python目录
cd ./python-3.11.5-embed-amd64

:: 检查并安装pip
if not exist Scripts\pip.exe (
    powershell -Command "& {Invoke-WebRequest -Uri !PIP_URL! -OutFile get-pip.py}"
    python get-pip.py
)

:: 配置环境变量
path Scripts

:: 安装指定的Python包到Lib\site-packages目录
python -m pip install --upgrade setuptools -i !PIP_MIRROR!
python -m pip install --upgrade pip -i !PIP_MIRROR!

:: 安装指定版本的包
python -m pip install et_xmlfile==2.0.0 -t .\Lib\site-packages -i !PIP_MIRROR!
python -m pip install numpy==2.2.0 -t .\Lib\site-packages -i !PIP_MIRROR!
python -m pip install openpyxl==3.1.5 -t .\Lib\site-packages -i !PIP_MIRROR!
python -m pip install python-dateutil==2.9.0.post0 -t .\Lib\site-packages -i !PIP_MIRROR!
python -m pip install pytz==2024.2 -t .\Lib\site-packages -i !PIP_MIRROR!
python -m pip install six==1.17.0 -t .\Lib\site-packages -i !PIP_MIRROR!
python -m pip install tzdata==2024.2 -t .\Lib\site-packages -i !PIP_MIRROR!

:: 安装最新版本的包
python -m pip install networkx -t .\Lib\site-packages -i !PIP_MIRROR!
python -m pip install pandas==2.2.3 -t .\Lib\site-packages -i !PIP_MIRROR!
python -m pip install PyMuPDF==1.25.1 -t .\Lib\site-packages -i !PIP_MIRROR!
python -m pip install pyqt6==6.6.0 pyqt6-qt6==6.6.0 pyqt6_sip==13.8.0 -t .\Lib\site-packages -i !PIP_MIRROR!
python -m pip install requests -t .\Lib\site-packages -i !PIP_MIRROR!
python -m pip install markdown -t .\Lib\site-packages -i !PIP_MIRROR!
python -m pip install flask -t .\Lib\site-packages -i !PIP_MIRROR!
python -m pip install cryptography -t .\Lib\site-packages -i !PIP_MIRROR!
python -m pip install wmi -t .\Lib\site-packages -i !PIP_MIRROR!
python -m pip install tqdm -t .\Lib\site-packages -i !PIP_MIRROR!

:: 切换到原始的目录
cd ..

echo download_python Environment has been successfully

(
    echo {
    echo     "R_bin": "set the bin path of the R package for the software to function properly",
    echo     "Current_language": "English",
    echo     "current_name": "",
    echo     "temperature": 0.63,
    echo     "system": "You are an expert in ecological data analysis, assisting users in analyzing the results of image plotting. You reply to my questions in Chinese. As a built-in assistant of a software, your output environment supports Markdown format, but table output is only supported in HTML format. Remember not to output tables in Markdown format.",
    echo     "max_token": "5000",
    echo     "stream": true,
    echo     "entries": [],
    echo     "Vip_active_code": "",
    echo     "if_auto_sent_message": false
    echo }
) > ".\config.json"

:: 暂停
pause