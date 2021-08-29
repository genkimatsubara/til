#!/bin/bash

# ヘルプの表示
usage() {
  cat<<-END
    Usage: $0 [file_name]
    Searches for full-width spaces in the specified file and converts them to half-width spaces.
  END
}

# コマンドライン引数が0個の場合
if [ "$#" -eq 0 ]; then
  usage
  exit 1
fi

# 指定されたファイルから全角スペースを探す
full_width_space=$(cat "$1" | LANG=C grep -n -v '^[[:cntrl:][:print:]]*$')

# 全角スペースがない場合
if [ "$?" != 0 ]; then
  echo "全角の空白は見つかりませんでした"
  exit 1
fi

# 全角スペースを半角スペースに変換して上書き
echo $full_width_space | sed -i "" -e "s/　/ /g" "$1"