#!/bin/bash
set -e  # 任何命令失败则立即退出

# 获取当前日期（使用 UTC 时间；如需北京时间可加 TZ=Asia/Shanghai）
YEAR=$(date +'%Y')
MONTH=$(date +'%m')
DATE8=$(date +'%Y%m%d')

# 构造目标 URL
URL="https://static.v2rayshare.net/${YEAR}/${MONTH}/${DATE8}.yaml"

# 输出文件路径（项目根目录）
OUTPUT_FILE="./freenode.yaml"

echo "Downloading from: $URL"

# -L 跟随重定向，-f 使 HTTP 错误（如 404）时返回非零退出码
curl -L -f "$URL" -o "$OUTPUT_FILE"

# 检查下载是否成功（文件是否存在且非空）
if [ -s "$OUTPUT_FILE" ]; then
    echo "✅ Successfully saved to $OUTPUT_FILE"
else
    echo "❌ Download failed: file is empty or does not exist"
    exit 1
fi
