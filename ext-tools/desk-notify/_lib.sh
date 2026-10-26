#!/usr/bin/env bash
# Shared by handle and setup. Sourced, never run.

# The notifier this machine has: osascript (macOS) or notify-send (Linux).
# Prints its name, or nothing.
desk_notify_notifier() {
  if [ "$(uname -s 2>/dev/null)" = "Darwin" ] && command -v osascript >/dev/null 2>&1; then
    echo osascript
  elif command -v notify-send >/dev/null 2>&1; then
    echo notify-send
  fi
}

# desk_notify_show <title> <text>: show one notification. The text arrives as
# an argument, never spliced into a script, so a message cannot run anything.
desk_notify_show() {
  local title="$1" text="$2"
  case "$(desk_notify_notifier)" in
    osascript)
      osascript -e 'on run argv' \
        -e 'display notification (item 2 of argv) with title (item 1 of argv)' \
        -e 'end run' "$title" "$text" >/dev/null
      ;;
    notify-send)
      notify-send -- "$title" "$text"
      ;;
    *)
      echo "no desktop notifier on this machine (needs osascript on macOS or notify-send on Linux)" >&2
      return 1
      ;;
  esac
}
