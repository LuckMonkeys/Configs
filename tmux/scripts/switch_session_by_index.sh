#!/bin/bash
# 根据会话名称前缀切换会话
# 用法: switch_session_by_index.sh <index>
# 会话命名格式: 1-project, 2-notes, 3-work 等

index="$1"

if [[ -z "$index" || ! "$index" =~ ^[0-9]+$ ]]; then
  exit 0
fi

# 获取匹配索引前缀的会话 (例如 "1-" 匹配 index 1)
target=$(tmux list-sessions -F '#{session_id} #{session_name}' 2>/dev/null | awk -v idx="$index" '$2 ~ "^"idx"-" {print $1; exit}')

if [[ -n "$target" ]]; then
  tmux switch-client -t "$target"
  tmux refresh-client -S
fi
