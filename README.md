## iOS 커리어 스타터 캠프 saleyMinsup조

### 묵찌빠 프로젝트 저장소

## 목차

1. [제목](#1.)
2. [소개](#2.)
3. [팀원](#3.)
4. [타임라인](#4.)
5. [클래스 다이어그램](#5.)
6. [실행 화면(기능 설명)](#6.)
7. [트러블 슈팅](#7.)
8. [참고 링크](#8.)
9. [팀 회고](#9.)

<a id="1."></a>
## 1. 제목
#### 🛎️ MW's 묵찌빠게임 ✊🏻✌🏻🖐🏻 🛎️
<br>

<a id="2."></a>
## 2. 소개 
    플레이어(이하 사용자)에게 가위(1), 바위(2), 보(3)를 숫자로 입력받아 가위바위보를 하고
    이기게되면 사용자 턴으로, 진다면 컴퓨터 턴으로 묵찌빠를 진행한다.
    사용자 턴일 때 컴퓨터와 같은 모양을 고르면 이기고,
    컴퓨터 턴일 때 역시 같은 모양을 고르면 지는 게임 
<br>

<a id="3."></a>
## 3. 팀원
| [Minsup 🦊](https://github.com/agilestarskim) | [Whales 🐋](https://github.com/WhalesJin) |
| :--------: | :--------: |
| <Img src = "https://avatars.githubusercontent.com/u/79740398?v=4" width="150"/>| <Img src = "https://i.imgur.com/wnhhCv9.jpg" width="150"/>|
<br>

<a id="4."></a>
## 4. 타임라인
**2023.05.02**
- 게임 실행 반복문 생성
- 가위바위보 비교함수 생성 및 수정
- 튜플을 이용한 함수 수정
- 옵셔널 바인딩, 조건문 병합

**2023.05.03**
- 리뷰어의 피드백에 따른 코드 리팩토링 및 파일 분리
- 열거형 타입 생성, 게임 반복문 여러 함수로 기능 분리

**2023.05.04**
- 묵찌빠 클래스 생성 (가위바위보 클래스 참고)
- 가위바위보 클래스에서 상속받도록 묵찌빠 클래스 수정

**2023.05.05**
- 가위바위보와 묵찌빠 클래스의 공통특성을 묶어 새로운 부모클래스 생성
- GameResult와 Turn의 타입을 연관값으로 연결
<br>

<a id="5."></a>
## 5. 클래스 다이어그램
![](https://i.imgur.com/eaQGsox.jpg)

<br>

<a id="6."></a>
## 6. 실행 화면(기능 설명)
- 메뉴 번호를 입력받아서 0이면 게임종료, 1, 2, 3이 아니면 잘못된 입력

| 0 입력 시 | 잘못된 입력 시 | 
| :--------: | :--------: |
| <Img src = "https://i.imgur.com/vybF9eh.gif" width="300"/> | <Img src = "https://i.imgur.com/eXD8kSE.gif" width="300"/>|

- 게임이 시작되었을 때, 가위(1), 바위(2), 보(3) 

| 비겼을 시 | 사용자 승리 시 | 컴퓨터 승리 시 | 
| :--------: | :--------: | :--------: |
| <Img src = "https://i.imgur.com/FtrErxa.gif" width="300"/> | <Img src = "https://i.imgur.com/DVHZ8Gj.gif" width="300"/> | <Img src = "https://i.imgur.com/Xdv5ONv.gif" width="300"/>|
<br>

<a id="7."></a>
## 7. 트러블 슈팅
### 🔥 게임종료 시점 고민
- `while true` 반복문 안에 `switch`문으로 게임을 시작한다.
- `0` 입력시 게임종료이므로 반복문을 닫아야하는데 `case` 안에서 `break` 입력 시
`switch`문만 빠져나오고 반복문이 멈춰지지않는다.
    <details>
    <summary>해결</summary>

    어제 같이 공부한 `while loop 이름` 활용했다.
    -> `while`에 이름을 붙이고 `break 이름`하면 `switch`문에서 `while`문을 `break`할 수 있다.
    ![](https://i.imgur.com/cxEh70H.png)
    ![](https://i.imgur.com/NSOajqq.png)
    </details>

### 🔥 `가위(1)`가 `보(3)`를 이기는 조건
- 처음에는 그냥 크기 비교로 조건을 짰다가 `가위vs보`에서 잘못된 결과가 나오는 것을 알고 고민했다.
    <details>
    <summary>코드</summary>

    ```swift
    func check(input: String?, computer: String) {
        if let input2 = input, input2 == computer {
            print("비겼습니다!")
        } else if let input2 = input, input2 > computer {
            print("이겼습니다!")
        } else {
            print("졌습니다!")
        }
    }
    ```
    </details>

- 상세한 `if` 구문으로 수정을 했다.
    <details>
    <summary>코드</summary>

    ```swift
    func showResult(input: HandShape, computer: HandShape) {
    if input == .rock {
        if computer == .rock {
            print("비겼습니다!")
        } else if computer == .scissors {
            print("이겼습니다!")
        } else {
            print("졌습니다!")
        }
    } else if input == .scissors {
        …
    ```
    </details>

- `튜플`로 수정을 했다.
    <details>
    <summary>코드</summary>

    ```swift
    func isOver(with computer: String, by user: String) -> Bool {
        switch (user, computer) {
        case ("1", "1"), ("2", "2"), ("3", "3"):
            print("비겼습니다!")
            return false
        case ("1", "3"), ("3", "2"), ("2", "1"):
            print("이겼습니다!")
            return true
        default:
            print("졌습니다!")
            return true
        }
    }
    ```
    </details>
    
### 🔥 클래스의 상속관계
- 과정
    - 묵찌빠 클래스를 만들고 진행하던 중 가위바위보 클래스와 굉장히 유사한 형태로 진행되고, 프로퍼티나 메서드들이 겹치는 것을 발견하여 클래스의 상속 개념을 떠올렸다.
    - 가위바위보가 선행되고 묵찌빠가 이를 따르기 때문에 가위바위보를 부모클래스로 묵찌빠가 상속받도록 진행하였다.
    - 묵찌빠 클래스를 구현하던 중 프로퍼티와 메서드들이 쪼끔쪼끔씩 바뀌게 되면서 계속 재정의(override)를 해줘야 했고, 가위바위보의 함수를 가져다 쓰는 과정에서 알 수 없는 부작용들이 연달아 발생하였다.
- 해결
    - 정말 겹치는 부분들만 묶어다가(추상화) 새로운 부모 클래스 `HandShapeGamePreparation`을 만들어 가위바위보와 묵찌빠 모두 `HandShapeGamePreparation`을 상속 받는 형제 클래스 관계로 만들었다. 

### 🔥 가위바위보와 묵찌빠 중 어디에서 뭘 부를 것인가? (순서와 객체지향)

- 코드에는 정답이 없기 때문에 어떤 클래스가 종속될 것인가에 대해 많은 논의를 했다.
    <details close>
    <summary>Minsup</summary>
    가위바위보 클래스의 결과에 따라 묵찌빠 인스턴스를 생성 후 실행하는 방식으로 가위바위보가 묵찌빠를 가지고 있는 형태였고, 그 방식의 장점은 묵찌빠 클래스가 가위바위보의의 결과를 전혀 참조하지 않아도 된다는 장점이 있다.
    </details>
    <details close>
    <summary>Whales</summary>
    묵찌빠 클래스가 가위바위보 클래스를 호출 후 그 결과에 따라 묵찌빠를 실행하는 방식으로 묵찌빠가 가위바위보의 결과값을 가지고 있는 형태였고, 그 방식의 장점은 현실 세계의 관점을 그대로 구현할 수 있다는 장점이 있다.
    </details>
    <details close>
    <summary>해결방법</summary>
    묵찌빠 클래스가 가위바위보를 가지고 있다는 것이 적절하다고 판단되어 클래스 구조를 다시 설계했다.
    </details>
    
### 🔥 연관되어있는 두 가지 타입을 어떻게?

- 처음 묵찌빠 코드를 시작할 때 `GameResult` 타입과 `Turn` 타입으로 분리해서 코드를 진행했다. 
    ```swift
    enum GameResult {
        case end, again
    }
    enum Turn: String {
        case user = "사용자", computer = "컴퓨터"
    }
    ```
- 하다보니 묵찌빠에서 가위바위보의 게임결과를 리턴할 때 GameResult와 Turn의 비슷한 점이 보여 GameResult와 Turn을 합쳤다. 
    ```swift
    enum GameResult: String {
        case end, again, userWin = "사용자", computerWin = "컴퓨터" 
    }
    ```
- 하지만 Turn과 GameResult의 다른 의미가 전달되지 않는 것 같아 고민을 하다가 GameResult의 연관값에 Turn 타입을 넣어 전달하는 방법으로 해결하였다. 
    ```swift
    enum GameResult: Equatable {
        case end, again, next(Turn)
    }

    enum Turn: String {
        case user = "사용자", computer = "컴퓨터", none
    }
    ```
<br>

<a id="8."></a> 
## 8. 참고 링크
- [공식문서 - Nested Types](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/nestedtypes/)
- [블로그 - 프로토콜](https://velog.io/@ellyheetov/Protocol-Oriented-Programming)
- [블로그 - 연관값 추출](https://alisoftware.github.io/swift/pattern-matching/2016/05/16/pattern-matching-4/)
<br>

<a id="9."></a>
## 9. 팀 회고
### 👏🏻 우리팀이 잘한 점
- 미션을 완성하는데 초점을 맞추기보단 공부에 먼저 집중했습니다.
- 같이 공부하며 배운 것들을 미션에 적극적으로 활용하며 연습했습니다.
- 많은 논의를 통해 커뮤니케이션 연습에 도움이 되었습니다.
- 시간 약속을 잘 지켜 스케쥴에 맞춰 공부와 미션을 함께 했습니다.
- 서로 양보하고 배려하며 기분좋게 팀프로젝트를 진행하였습니다.

### 👊🏻 우리팀 개선할 점
- 침착한 대화를 통한 자세한 설명과 이해의 시간이 더 있었다면 원활한 소통에 도움이 되었을 것 같습니다.

### 💜 서로에게 좋았던 점 피드백
- Dear. Minsup 🦊
    - 공식문서 같이 읽어 주시면서 설명해주셨습니다.
    항상 쉬운 예시와 친절한 설명으로 공부에 엄청 큰 도움을 주셨습니다.
    - 팀프로젝트를 하며 많이 배려해주셨습니다.
    - 모르는 부분이 있으면 같이 찾아보며 이해를 도와주셨습니다.
    - 코드에 대한 열정으로 같이 으쌰으쌰 할 수 있어 좋았습니다.
    - 배워보지 못한 부분에 대한 지식을 많이 가지고 계시고 그런 코드들을 설명해주셔서 정말 좋았습니다.
    - 저와는 다르게 코드를 갈아엎는다는 것에 대한 두려움이 없어 여러 가지 시도를 해볼 수 있어서 좋았습니다!!
    
- Dear. Whales 🐋
    - 제가 놓친 부분들을 알려주어 코딩에 도움이 되었습니다.
    - 객체지향에 대해 익숙하여 새로운 설계 방법을 이끌어주었습니다.
    - 활발하시고 붙임성이 좋아서 편하게 의사소통할 수 있어서 좋았습니다.
    - 제가 궁금한 것들을 귀찮아하지 않고 같이 찾아보고 의논하는 자세가 저의 의지를 복돋아 주었습니다.
