#!/bin/bash

echo ""
echo "OCR Project Manager — インストーラー"
echo "======================================"
echo ""

# 0. macOSバージョン確認
OS_VER=$(sw_vers -productVersion)
OS_MAJOR=$(echo "$OS_VER" | cut -d. -f1)
OS_MINOR=$(echo "$OS_VER" | cut -d. -f2)
if [[ "$OS_MAJOR" -lt 11 && "$OS_MINOR" -lt 15 ]]; then
    echo "❌ macOS 10.15以降が必要です（現在: $OS_VER）"
    echo "   お使いのmacOSはサポート対象外です。"
    read -p "Enterで閉じる..."
    exit 1
fi
echo "✅ macOS: $OS_VER"

# 1. Homebrewの確認
if ! command -v brew &> /dev/null; then
    echo "⚠ Homebrewが見つかりません。"
    echo "  PythonやpopplerのインストールにHomebrewが必要です。"
    echo ""
    read -p "Homebrewをインストールしますか？ [y/N]: " answer
    if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
        echo "📦 Homebrewをインストール中..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        echo "⚠ Homebrewをスキップします。一部機能が使えない場合があります。"
    fi
else
    echo "✅ Homebrew: OK"
fi

# 2. Python3確認
if ! command -v python3 &> /dev/null; then
    echo "⚠ Python3が見つかりません。"
    echo ""
    read -p "Python3をインストールしますか？ [y/N]: " answer
    if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
        echo "📦 Python3をインストール中..."
        brew install python3
    else
        echo "❌ Python3がないと起動できません。"
        exit 1
    fi
fi
echo "✅ Python3: $(python3 --version)"

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
