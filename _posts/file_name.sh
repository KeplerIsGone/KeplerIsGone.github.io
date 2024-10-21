#!/bin/bash

# 루트 디렉터리 설정
ROOT_DIR="./" # 필요한 경우 루트 디렉터리 경로로 변경하세요.

# 각 .md 파일을 순회
find "$ROOT_DIR" -type f -name "*.md" | while read -r FILE; do
    # 파일 이름에서 확장자(.md)를 제외한 파일 제목
    FILE_NAME=$(basename "$FILE" .md)

    # 파일에서 front matter의 date 필드 추출
    DATE=$(grep '^date:' "$FILE" | head -n 1 | cut -d' ' -f2)

    # date 필드가 존재하는지 확인
    if [ -z "$DATE" ]; then
        echo "Error: No date found in $FILE"
        continue
    fi

    # 새로운 파일 이름 설정: <date>-<원래제목>.md
    NEW_FILE="$(dirname "$FILE")/$DATE-$FILE_NAME.md"

    # 파일 이름 변경
    mv "$FILE" "$NEW_FILE"

    echo "Renamed: $FILE -> $NEW_FILE"
done
