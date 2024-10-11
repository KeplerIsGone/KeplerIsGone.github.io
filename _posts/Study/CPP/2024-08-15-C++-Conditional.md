---
layout: post
title: "[CPP] C++ Conditional"
date: 2024-08-15
category: Study
tag: CPP
---
# Summary

조건문은 특정 조건에서만 명령어를 시행하는 문이다.

# Contents

## if / else if / else

```cpp
if (condition1){
	statement1
} else if (condition2){
	statement2
} else {
	statement3
}
```
## switch 문

switch 문은 특정 변수의 값에 따라 명령어를 시행하는 문이다. 특정 변수는 `int`, `char`형만 사용할 수 있다.  내부에서는 `case`, `default` 키워드가 사용된다. 해당하는 조건의 case문으로 '이동'하는 방식이므로, 끝에는 break문을 붙여야한다. 이를 이용해 조건을 병합할 수 있다.

```cpp
int a;

switch (a) {
	case 1:
		statement1;
		break;
	case 2:
	case 3:
		statement2; // 조건 합치기
	case 4:
		statement3;
	default:
		statement4;
}
```

# Reference

