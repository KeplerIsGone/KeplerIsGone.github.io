---
layout: post
title: "[Vim] Astronvim 사용하기"
date: 2024-08-15
category: Study
tags: Vim
---

vim을 사용하기 위한 조건 떠올리기

시간이 없으니 완제품 쓰기 vs nvim 커스텀 하기
### 텍스트 에디터로써

- obsidian에 있는 기능을 생각해보자
- md 미리보여주기 기능
- LaTex 빨리 쓰기 기능
- 태그... 
- 폴더 옆에 보여줘 (astrovim 기본 기능)

### IDE로써

- VSCode 쓸거임 ㅋㅋ
- 아니다 도전?


![](https://i.imgur.com/VDYo8L2.png)

[AstroNvim 공식 Documentation](https://docs.astronvim.com/)에 따르면 위와 같은 기능이 기본으로 내장되어 있다고 한다. 하나하나 살펴보자.

- [**AstroCommunity**](https://github.com/AstroNvim/astrocommunity) : 커뮤니티 플러그인을 관리
- [**Heirline**](https://github.com/rebelot/heirline.nvim) : Nvim 환경에 VScode스러운 상태바를 추가한다.
	- 하지만 lua로 직접 스크립트를 작성해야 한다는 게 단점
- [**lazy.nvim**](https://github.com/folke/lazy.nvim) : UI를 통해 Neovim의 플러그인을 관리한다.
	- 자동으로 하위 플러그인을 설치하거나 update를 해주기 때문에 몹시 편하다.
- [**Neo-tree**](https://github.com/nvim-neo-tree/neo-tree.nvim) : sidebar에 파일 디렉토리를 보여준다. 클릭도 가능하다!
- [**Cmp**](https://github.com/hrsh7th/nvim-cmp) : 코드 자동 생성 기능을 담당한다. 없으면 곤란하다.
- [**Gitsigns**](https://github.com/lewis6991/gitsigns.nvim) : Git 기능을 neovim에서 쓸 수 있게 한다.
- [**Toggleterm**](https://github.com/akinsho/toggleterm.nvim) : 간단하게 neovim에서 터미널을 열 수 있게 한다.
- [**Telescope**](https://github.com/nvim-telescope/telescope.nvim) : 파일을 빠르게 검색하고 연다.
- [**Treesitter**](https://github.com/nvim-treesitter/nvim-treesitter) : Syntax Highlighter이다.
- [**none-ls**](https://github.com/nvimtools/none-ls.nvim) : 자동 formatting과 linter를 담당한다. linter는 시간을 단축하는 가장 좋은 도구이다.
- [**Native LSP**](https://github.com/neovim/nvim-lspconfig) : Language server protocol을 관리한다.
	- Language server protocol (LSP)는 IDE나 Code editor에 적용되어 code completion, Go to Definition과 같은 기능을 제공한다. 
