#!/usr/bin/env bash
set -euo pipefail

min_width=${TMUX_RIGHT_MIN_WIDTH:-90}
width=$(tmux display-message -p '#{client_width}' 2>/dev/null || true)
if [[ -z "${width:-}" || "$width" == "0" ]]; then
  width=$(tmux display-message -p '#{window_width}' 2>/dev/null || true)
fi
if [[ -z "${width:-}" || "$width" == "0" ]]; then
  width=${COLUMNS:-}
fi
if [[ -n "${width:-}" && "$width" =~ ^[0-9]+$ ]]; then
  if (( width < min_width )); then
    exit 0
  fi
fi

status_bg=$(tmux show -gqv status-bg)
if [[ -z "$status_bg" || "$status_bg" == "default" ]]; then
  status_bg=black
fi

host_bg="${TMUX_THEME_COLOR:-#b294bb}"
host_fg="#1d1f21"
separator=""
right_cap="█"
hostname=$(hostname -s 2>/dev/null || hostname 2>/dev/null || printf 'host')

printf '#[fg=%s,bg=%s]%s#[fg=%s,bg=%s] %s #[fg=%s,bg=%s]%s' \
  "$host_bg" "$status_bg" "$separator" \
  "$host_fg" "$host_bg" "$hostname" \
  "$host_bg" "$status_bg" "$right_cap"
