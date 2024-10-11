---
layout: post
title: "[Linux] Shell Script 기본 문법"
date: 2024-08-15
category: Study
tags: Linux 
---
reference : https://www.shellscript.sh/first.html

# A First Script

```
#!/bin/sh
# This is a comment!
echo "Hello      World"       # This is a comment, too!
echo "Hello World"
echo "Hello * World"
echo Hello * World
echo Hello      World
echo "Hello" World
echo Hello "     " World
echo "Hello "*" World"
echo `hello` world
echo 'hello' world
```

위 코드는 실행결과가 모두 같아보이지만 살짝씩 다르다.
shellscript에서 각 연산자나 문자, 변수를 어떻게 처리하는지 알 수 있는 좋은 코드라고 생각한다.

---

# Variables

shellscript에서 변수를 선언하는 방법은 `VAR=value`이다. `VAR = value`는 안 된다!

변수의 사용은 변수명 뒤에 `$`를 붙여 이루어진다.

변수의 타입은 string, integer, real number 등등 대부분을 담을 수 있다. C처럼 타입을 일일히 정의할 필요는 없다.

`read` 로 입력을 받아 변수에 넣을 수 있다.

```
#!/bin/sh
echo What is your name?
read MY_NAME
echo "Hello $MY_NAME - hope you're well."
```

변수의 스코프는 해당 shellscript 내부에 한정된다. 스크립트를 불러올 때 실행되는 `#!bin/sh` 가 새롭게 만들어지기 때문이다.
따라서 우리의 interactive shell에서 할당된 변수를 이용하기 위해서는 `export` 명령어를 이용하면 된다.

```
$ export MYVAR
$ ./myvar2.sh
MYVAR is: hello
MYVAR is: hi there
```

다만 먼저 `MYVAR`에 값을 할당해주어야 한다.

`source` 명령어를 사용하듯이 "." 을 사용하면 스크립트 내부의 변수를 밖에서 이용하도록 할 수 있다.

```
$ MYVAR=hello
$ echo $MYVAR
hello
$ . ./myvar2.sh
MYVAR is: hello
MYVAR is: hi there
$ echo $MYVAR
hi there
```

문자열 내부에서 변수는 `${VAR_NAME}`으로 사용할 수 있다.

---

# Escape Characters

- 문자열 내부에서 escape 문자는 그대로 취급. 명령어 사이에 들어가는 escape는 띄어쓰기와 동일.
- 문자열 내부에서 " 는 가장 가까운 것과 붙음. ("hello   "World""는 "hello   "와 World, "")

---

# Loops

## For Loops

```
#!/bin/sh
for i in 1 2 3 4 5
do
  echo "Looping ... number $i"
done
```

와 같은 형태를 지닌다.
변수 `i`에 띄어쓰기로 구분된 뒷 친구들이 차례대로 들어간다. 사용은 `$i`로 할 수 있다.

## While Loops

```
#!/bin/sh
INPUT_STRING=hello
while [ "$INPUT_STRING" != "bye" ]
do
  echo "Please type something in (bye to quit)"
  read INPUT_STRING
  echo "You typed: $INPUT_STRING"
done
```

`[]` 안에 조건을 넣고, `do`와 `done` 사이에 명령어를 넣으면 된다.

## Test

```
if  [ something ]; then
 echo "Something"
 elif [ something_else ]; then
   echo "Something else"
 else
   echo "None of the above"
fi
```

- [] 안에 조건을 넣는 것은 같다. 다만 각각의 요소 사이에 띄어쓰기가 있어야 한다.
  - 이는 `[`가 일종의 명령어로 동작하기 때문!
- `; then`를 꼭 넣어주어야 한다.
- 마무리는 `fi` 로
- 숫자 비교 : `-gt`, `-ge`, `-lt`, `-le`, `-eq`, `-ne`
- 문자열 비교 : `==`, `!=`
- 파일이면 참 : `-e`
- 디렉토리면 참 : `-d`

---

# Case

```
#!/bin/sh

echo "Please talk to me ..."
while :
do
  read INPUT_STRING
  case $INPUT_STRING in
	hello)
		echo "Hello yourself!"
		;;
	bye)
		echo "See you again!"
		break
		;;
	*)
		echo "Sorry, I don't understand"
		;;
  esac
done
echo 
echo "That's all folks!"
```

- 한 변수의 값을 확인해야할 경우, 여러 개의 if문을 작성하기보다는 case문을 작성하는 것이 낫다.
- `case $VAR in \ value) ... ;; esac`의 형식으로 작성한다.
- `*)`는 default 값을 의미한다.
