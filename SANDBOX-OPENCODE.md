# OpenCode Sandbox

Containerized OpenCode setup with persistent local state and project-safe worktree mounts.

## Goals

- Isolated OpenCode runtime per terminal/worktree.
- Git changes always persisted on host (bind-mounted worktree).
- Always use local OpenCode config + provider logins.
- Include dev toolchain for this repo (`bun`, `node`, `rust`, `tauri`, `agent-browser`).

## Files

- `~/.config/opencode/sandbox/Dockerfile`
- `~/.config/opencode/sandbox/ocx`
- `~/.zshrc` (`ocx` function + defaults)

## First-time setup

1. Reload shell config:
   - `source ~/.zshrc`
2. Build the image:
   - `ocx build`

## Daily usage

- Start OpenCode in current worktree:
  - `ocx`
- Start OpenCode in another worktree:
  - `ocx /path/to/worktree`
- Open shell in the sandbox container:
  - `ocx shell .`

## Mounted paths

- Config (from dotfiles):
  - `/Users/dawid/dotfiles/.config/opencode` -> `/home/opencode/.config/opencode`
- Provider auth/session state:
  - `~/.local/share/opencode` -> `/home/opencode/.local/share/opencode`
- OpenCode cache:
  - `~/.cache/opencode` -> `/home/opencode/.cache/opencode`
- Browser tooling cache:
  - `~/.cache/ms-playwright` -> `/home/opencode/.cache/ms-playwright`
  - `~/.local/share/agent-browser` -> `/home/opencode/.local/share/agent-browser`
- Project/worktree:
  - `<worktree>` -> `/workspace`

## Resource caps (optional)

No per-container caps are applied by default.

If needed:

```bash
export OCX_CPUS=2
export OCX_MEMORY=4g
export OCX_PIDS=512
```

## Notes

- This uses a Linux container. Building/running Linux Tauri is supported.
- Native macOS desktop packaging is still best done on host macOS toolchain.
