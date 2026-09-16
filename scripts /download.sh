#!/bin/bash
set -e  # 任何命令失败则立即退出

# 使用北京时间，避免 UTC 边界问题
TZ='Asia/Shanghai'
YEAR=$(TZ=$TZ date +'%Y')
MONTH=$(TZ=$TZ date +'%m')
DATE8=$(TZ=$TZ date +'%Y%m%d')

# 构造目标 URL
URL="https://static.v2rayshare.net/${YEAR}/${MONTH}/${DATE8}.yaml"

# 输出文件路径（仓库根目录）
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
