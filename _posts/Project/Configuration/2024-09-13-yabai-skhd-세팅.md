---
layout: post
title: "[DevEnv] yabai skhd 세팅"
date: 2024-09-13
category: Project
tags: DevEnv 
---
## Yabai 세팅 (.yabairc)

```
# Layout & Mouse Modifier

yabai -m config layout bsp
yabai -m config mouse_modifier cmd

# Padding

yabai -m config top_padding    45
yabai -m config bottom_padding 20
yabai -m config left_padding   10
yabai -m config right_padding  10
yabai -m config window_gap     20

# Focused Window Opacity

yabai -m config window_opacity on
yabai -m config active_window_opacity 1.0
yabai -m config normal_window_opacity 0.8

# Excluding apps

yabai -m rule --add app="Finder" manage=off
yabai -m rule --add app="System Settings" manage=off

# sketchybar Events

yabai -m signal --add event=window_created action="sketchybar -m --trigger window_change &> /dev/null"
yabai -m signal --add event=window_destroyed action="sketchybar -m --trigger window_change &> /dev/null"
```
기본적인 padding 설정만 해놓았다. Window opacity 설정은 해놓으니 집중 더 잘 되고 좋았다. 

## skhd 세팅 (.skhdrc)

```

# focus window
alt - h : yabai -m space --focus prev
alt - j : yabai -m window --focus prev
alt - k : yabai -m window --focus next
alt - l : yabai -m space --focus next

# swap managed window
shift + alt - h : yabai -m window --swap west
shift + alt - j : yabai -m window --swap south
shift + alt - k : yabai -m window --swap north
shift + alt - l : yabai -m window --swap east
```

일단 다급하게 데스크탑 변경 커맨드만 추가했다. 사실 쓰는 앱이 많지 않다보니 이렇게만 설정해줘도 큰 불편함 없이 지낼 수 있었다. `opt + j,k`로 사용 중인 앱을 변경하고, `opt + h,l`로 데스크탑을 변경한다. 

