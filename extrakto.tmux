#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


default_clip_key="e"
extrakto_clip_key=$(tmux show-option -gqv "@extrakto_clip_key")
CLIP_KEY=${extrakto_clip_key:-$default_clip_key}

default_clip_opt="wr"
extrakto_clip_opt=$(tmux show-option -gqv "@extrakto_clip_opt")
CLIP_OPT=${extrakto_clip_opt:-$default_clip_opt}

default_insert_key="tab"
extrakto_insert_key=$(tmux show-option -gqv "@extrakto_insert_key")
INSERT_KEY=${extrakto_insert_key:-$default_insert_key}

default_insert_opt="wr"
extrakto_insert_opt=$(tmux show-option -gqv "@extrakto_insert_opt")
INSERT_OPT=${extrakto_insert_opt:-$default_insert_opt}

default_window_split_direction="v"
extrakto_window_split_direction=$(tmux show-option -gqv "@extrakto_window_split_direction")
SPLIT_DIRECTION=${extrakto_window_split_direction:-$default_window_split_direction}

default_window_lines=6
extrakto_window_lines=$(tmux show-option -gqv "@extrakto_window_lines")
WINDOW_LINES=${extrakto_window_lines:-$default_window_lines}


tmux bind-key ${CLIP_KEY} split-window -${SPLIT_DIRECTION} -l ${WINDOW_LINES} "$CURRENT_DIR/tmux-extrakto -${CLIP_OPT} clip"
tmux bind-key ${INSERT_KEY} split-window -${SPLIT_DIRECTION} -l ${WINDOW_LINES} "$CURRENT_DIR/tmux-extrakto -${INSERT_OPT} insert"
