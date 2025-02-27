---
layout: post
title: "[CPP] C++ pointer, reference"
date: 2024-08-15
category: Study
tag: CPP
---
# Summary


# Contents

## pointer

포인터(*pointer*)는 *어떤 변수를 저장하고 있는 주소*를 저장하는 변수로, 모든 타입의 변수를 저장해둘 수 있다. 
1. `&`를 변수 앞에 붙이면 해당 변수의 주소를 가리키게 된다.
2. 배열의 이름이 배열을 가리키는 주소를 저장

```cpp
int arr[10];
int *p = arr;

int num = 10;
p = &num;
```

포인터는 해당 변수의 주소를 저장하므로, 포인터에 접근하여 변수의 값을 바꾸면 해당 변수의 값이 영구적으로 바뀐다. 

주의사항은 다음과 같다.
1. 포인터는 단독으로 선언할 수 없다. 선언되는 동시에 다른 주소가 할당되어야 한다.
2. 포인터와 int 연산 결과는 변수 타입의 byte값이 기본 단위이다. 예를 들어, int* 타입에서 `++`연산을 시행하면 메모리에서 4byte 옆으로 이동한다.

```cpp

```

## reference

C++에서는 C와 다르게 포인터 말고도 reference를 이용해서 변수에 접근할 수 있다. 포인터와 유사한 역할을 하지만, 주소 자체를 저장하는 포인터와 달리 레퍼런스는 원래 변수와 완전히 같게 사용할 수 있다는 점이 다르다. 

```cpp
int a = 3;
int& another_a = a;

a = 5;
std::cout << another_a << "\n"; // 5
```

위처럼 원래 변수를 수정하면 레퍼런스로 참조한 변수가 달라지는 것을 볼 수 있다. 예시에는 없지만, 레퍼런스 참조로 변수를 초기화해도 원래 변수의 값이 달라지는 것을 볼 수 있다.

레퍼런스는 주로 거대한 구조체를 다룰 때 사용한다. 해당 구조체를 받아 복사해서 리턴하는 것보다 주소를 인자로 받은 후 수정, 마지막에 구조체의 주소를 리턴하는 것이 편하고 빠르기 때문이다.
### 주의할 점

1. `const`의 레퍼런스 참조는 안된다.
	1. 하지만 레퍼런스 자체를 `const`로 선언하는 것은 가능하다.
2. 레퍼런스의 레퍼런스, 레퍼런스의 배열, 레퍼런스의 포인터는 존재할 수 없다. 컴파일러가 잡아내서 안된다 한다.
	1. 배열의 레퍼런스는 가능
3. 지역 변수의 레퍼런스는 사용하지 않도록 한다. 참조가 사라지면 곤란해진다.
### Dangling reference

레퍼런스는 있지만 원래 참조하던 것이 없어진 레퍼런스를 댕글링 레퍼런스라고 한다. 

```cpp
int& function() {
  int a = 2;
  return a;
}

int main() {
  int b = function();
  b = 3;
  return 0;
}
```

위의 경우에는 `function()`에서 a라는 변수를 레퍼런스로 반환해야 하지만, `main()` 함수에서 a라는 레퍼런스를 b로 받아야됐지만, `function()`이 끝나는 지점에서 a는 사라지기 때문에 오류가 발생하게 된다.
1. function()이 실행, `int&`에 a가 저장되어 b에 전달되려 함
2. function()이 종료, `int&`에 저장된 a는 메모리에서 삭제
3. b에는 전달될 것이 없어 오류가 발생
따라서 아래와 같이 인자를 레퍼런스로 받아 해당 값을 조정한 뒤 레퍼런스를 반환해야 한다.

# Reference

