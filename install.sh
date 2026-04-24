#!/bin/bash

echo ""
echo "OCR Project Manager — インストーラー"
echo "======================================"
echo ""

# 1. Python3確認
if ! command -v python3 &> /dev/null; then
    echo "❌ Python3が見つかりません。"
    echo "   https://www.python.org からインストールしてください。"
    exit 1
fi
echo "✅ Python3: $(python3 --version)"

# 2. Homebrewの確認
if ! command -v brew &> /dev/null; then
    echo "❌ Homebrewが見つかりません。"
    echo "   以下をターミナルで実行してインストールしてください："
    echo '   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
    exit 1
fi
echo "✅ Homebrew: OK"

# 3. poppler確認・インストール
if ! command -v pdftoppm &> /dev/null; then
    echo "📦 popplerをインストール中..."
    brew install poppler
else
    echo "✅ poppler: OK"
fi

# 4. pip install
echo "📦 Pythonライブラリをインストール中..."
pip3 install flask Pillow pdf2image

# 5. 実行権限付与
chmod +x "$(dirname "$0")/OCR_Project_Manager.command"

# 6. Desktopにシンボリックリンク
ln -sf "$(dirname "$0")/OCR_Project_Manager.command" ~/Desktop/OCR\ Project\ Manager.command
echo "✅ デスクトップにショートカットを作成しました"

# 7. NDLOCR-Lite案内
echo ""
echo "======================================"
echo "✅ インストール完了"
echo "======================================"
echo ""
echo "次のステップ：NDLOCR-Lite のインストール"
echo "このターミナルで以下をコピペして実行してください："
echo ""
echo "  git clone https://github.com/ndl-lab/ndlocr-lite ~/ndlocr-lite"
echo "  pip3 install -r ~/ndlocr-lite/requirements.txt"
echo ""
echo "完了後、デスクトップの「OCR Project Manager」から起動できます。"
echo ""
