---
layout: post
title: "[CPP] C++ namespace"
date: 2024-08-15
category: Study
tag: CPP
---
# Summary

C++의 namespace에 대해서 알아봅시다.

# Contents

## namespace

이름 공간(*namespace*)은 C++에서 각종 개체의 **소속된 공간**을 알려주는 역할을 합니다. 같은 이름의 `print()` 함수더라도 소속된 곳이 다르다면 C++에서는 다른 함수로 취급합니다. *scope resolution operator* :: 를 사용해 해당 namespace에 존재하는 함수를 사용할 수 있습니다.

```cpp
namespace header1 {
	void foo();
	int bar();
}

namespace header2 {
	void foo();
	int bar();
}
```

위에서는 두 개의 이름이 같은 함수 `foo(), bar()`는 같은 이름의 함수이지만, 다른 namespace에 정의되어있기 때문에 다른 함수로 취급됩니다. 따라서 아래의 두 개는 다른 함수로 취급됩니다.

```cpp
header1::foo();
header2::foo();
```

namespace 내부의 함수는 다음과 같은 조건에 의해 실행됩니다.
1. namespace 내부에서 namespace를 붙이지 않고 함수를 실행하면 자동으로 namespace 내부의 함수가 실행됩니다.
2. `using namespace` 를 이용하면 namespace를 붙이지 않고 함수르 ㄹ시행할 수 있습니다. 이름이 같은 다른 함수를 시행하려면 namespace를 붙여야 합니다.

이름이 없는 namespace는 자동으로 해당 파일 내부에서만 접근할 수 있습니다.

```cpp
namespace {
	int foo() {}
}
```

## std

C++에서 기본적으로 쓰이는 네임스페이스인 **std**는 *standard library*의 준말로, 말그대로 C++의 표준 라이브러리입니다. 원래는 `std::`를 붙이지 않고 기본 기능을 가진 함수들을 사용할 수 있었으나, 사용자가 같은 이름의 함수를 만들었을 경우 문제가 생길 수 있기 때문에 이를 모두 std라는 이름에 넣고 사용하도록 했습니다. std에 포함된 표준 헤더는 다음과 같습니다.

1. **array** : 고정 크기 배열인 *std::array* 템플릿을 제공합니다.
2. **bitset** : 비트 배열 클래스를 제공
3. **deque** : 덱 템플릿을 제공
4. **forward_list** : [[Linked List 연결 리스트|단일 연결 리스트]] 템플릿을 제공
5. **list** : [[Linked List 연결 리스트|이중 연결 리스트]]를 제공
6. **map** : 연관 배열(map), 멀티맵(multimap)을 제공
7. **queue** : 단일 큐 + 우선순위 큐를 제공
8. **set** : 정렬된 연관 컨테이너를 제공
9. **stack** : 스택 제공
10. **unordered_map** : 정렬되지 않은 map을 따로 제공
11. **vector** : 동적 배열인 [[C++ Vector 벡터|벡터]]를 제공
12. **algorithm** : 다양한 알고리즘 함수 제공
13. **chrono** : 시간 요소들을 제공
14. **functional** : 표준 알고리즘들과 함께 사용되는 목적으로 설계된 여러 함수 객체를 제공
15. **iterator** : 반복자들과 함께 사용되는 클래스 제공
16. **memory** : 메모리 관리를 위한 기능들을 제공
17. **stdexcept** : 예외 클래스를 제공
18. **tuple** : 튜플 제공
19. **utility** : pair, 연산자 오버로딩 제공
20. **locale** : 로케일 기능 제공
21. **codecvt** : 다양한 문자 인코딩을 위한 코드 전환 제공
22. **string** : 문자열 클래스 제공
23. **regex** : 정규 표현식 제공
24. **fstream** : 파일 기반 입출력 기능 제공
25. **iomanip** : 출력 포맷 조작 기능을 제공
26. **ios** : iostream 동작의 기본을 제공
27. **iosfwd** : 여러 입출력 관련 클래스 템플릿들의 선행 선언을 제공
28. **iostream** : C++ 입출력 기본
29. **istream** : 입력을 위한 지원 클래스
30. **ostream** : 출력을 위한 지원 클래스
31. **sstream** : 문자열 조작을 위한 지원 클래스
32. **streambuf** : 외부 파일이나 문자열을 읽고 쓰는 기능 지원
33. **exception** : 예외 처리 타입과 함수들 제공
34. **limits** : 기본 수치 타입들의 속성을 만드는데 사용되는 클래스 제공
35. **new** : 연산자 new와 delete 제공
36. **typeinfo** : 런타임 타입 정보와 함께 동작하기 위한 기능 제공
37. **thread** : 스레드와 동작하기 위한 클래스와 네임스페이스 제공
38. **mutex** : 상호 배제 메커니즘 제공
39. **condition_variable** : 스레드를 막기 위해 사용되는 동기화 제공
40. **future** : 한 스레드의 ㅏㅎㅁ수에서의 결과를 검색하기 위해 사용될 수 있는 구성 요소들을 제공
41. **complex** : 복소수를 제공
42. **random** : 랜덤 숫자들을 생성하기 위한 기능
43. **valarray** : 5개의 클래스 템플릿, 2개의 클래스, 다양한 배열 제공
44. **numeric** : 일반화된 수치 연산들

그 외에도 표준 C 라이브러리가 이름을 바꾼채로 (.h -> c{name}) 포함되어 있다.
# Reference

https://www.learncpp.com/cpp-tutorial/naming-collisions-and-an-introduction-to-namespaces/
