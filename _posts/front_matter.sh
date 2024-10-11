#!/bin/bash

# 루트 디렉터리 설정
ROOT_DIR="./" # 필요한 경우 루트 디렉터리 경로로 변경하세요.

# 각 .md 파일을 순회
find "$ROOT_DIR" -type f -name "*.md" | while read -r FILE; do
    # 파일이 위치한 디렉토리 이름을 가져옴
    DIR_NAME=${PWD##*/}

    # 파일 제목은 파일명에서 확장자를 제외한 부분
    FILE_NAME=$(basename "$FILE" .md)

    # 제목에서 '-'를 제외
    TITLE=$(echo "$FILE_NAME" | tr '-' ' ')

    # 파일의 생성 날짜 가져오기 (macOS에서 stat 명령어 사용)
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS의 경우 생성 날짜 가져오기 (Unix 타임스탬프를 사람이 읽을 수 있는 날짜 형식으로 변환)
        BIRTH_TIME=$(stat -f "%B" "$FILE")
        DATE=$(date -r "$BIRTH_TIME" "+%Y-%m-%d")
    else
        # Linux의 경우 (파일 시스템이 생성 날짜를 지원하지 않으면 수정 날짜 사용)
        DATE=$(stat --format='%w' "$FILE")
        if [ "$DATE" = "-" ]; then
            DATE=$(stat --format='%y' "$FILE" | cut -d' ' -f1)
        fi
    fi

    # Front matter 작성
    FRONT_MATTER="---
layout: post
title: [Algorithm] $TITLE
date: $DATE
category: Study
tags: Algorithm
---"

    # 기존 파일의 맨 앞에 front matter 추가 (임시 파일을 사용하지 않고 직접 수정)
    # 임시 파일 없이 sed를 사용해 파일의 맨 앞에 front matter를 추가
    (
        echo "$FRONT_MATTER"
        cat "$FILE"
    ) >"$FILE.tmp" && mv "$FILE.tmp" "$FILE"

    echo "Processed: $FILE"
done
