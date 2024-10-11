---
layout: post
title: "[Linux] Shell Script란?"
date: 2024-08-15
category: Study
tags: Linux 
---
# Shell Script란?

- 터미널에서 실행되는 명령어를 하나의 파일로 묶은 것
- 유닉스 계열 운영체제에서 Shell을 이용해 작성된 스크립트
- 작업 자동화, 시스템 관리, 배치 작업에 사용

# Shell Script를 사용하는 이유

- 반복적인 작업을 자동화하고, 복잡한 명령어를 간단하게 관리할 수 있다.
- 크론(cron)과 함께 사용해 정기적인 작업을 예약할 수 있다.

## 사용 예시

- **백업 스크립트** : 정기적으로 특정 디렉토리의 파일을 다른 위치로 압축 + 복사하는 스크립트
- **시스템 모니터링** : 서버의 상태를 주기적으로 확인하고 로그에 기록하는 스크립트
- **배포 스크립트** : 소프트웨어를 자동으로 빌드하고 배포하는 스크립트

# 사용법

1. **스크립트 작성** : 텍스트 편집기를 이용해 파일 작성 (`vim` , `nano`, 등)

```bash
	#!/bin/bash #shell 선택 가능
	echo "Hello, world!"
```

2. **실행 권한 부여** : `chmod` 명령어를 이용해 스크립트 파일에 실행 권한을 부여한다.
```bash
	chmod +x script.sh
```

3. **스크립트 실행** : 쉘에서 스크립트 파일을 실행한다.
```bash
	./script.sh
```



```
cat << EOF > 1.txt
```
는 뭘 뜻할까

```
echo "Hello      World"       # This is a comment, too!  
echo "Hello World"  
echo "Hello * World"  
echo Hello * World
echo Hello      World
echo "Hello" World
echo Hello "     " World
echo "Hello "*" World"  
echo `hello` world
echo 'hello' world
```

- 숫자 비교 연산자와 문자 비교 연산자가 다르다!
- 조건을 연결할 때는 다른 `[]`를 이용해야 

- 대상 디렉토리를 입력으로 받음
- 대상 디렉토리의 하위 디렉토리에서 빈 디렉토리 찾기 
- 빈 디렉토리에 `.gitkeep` 빈 파일을 생성하기
- 하위 디렉에 다른 하위 디렉이 있는 경우를 고려
- 먼저 입력 값부터 확인하자 : 입력 값은 하나, 디렉토리여야 함.
- 재귀를 써야 할 듯? <- 잘 배웠네...
- `function: `

```bash
#!/bin/sh

check_directory()
{
	for i in "$1"/*; do
		if [ -d "$i" ]; then
			if [ -z "$(ls "$i")" ]; then
				touch "$i"/.gitkeep
			else
				check_directory "$i"
			fi
		fi
	done
}

if [ $# -ne 1 ] || [ ! -d $1 ]; then
	echo "Usage: ./chapter1.sh <directory>"
	exit 1
fi

path=$1

if [ -z "$(ls "$path")" ]; then
	touch "$path"/.gitkeep
else
	check_directory "$path"
fi
```

- `find $1 -empty -type d -exec touch {}\.gitkeep \;` 을 써도 된다
