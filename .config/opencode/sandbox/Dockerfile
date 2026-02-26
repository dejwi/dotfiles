FROM ubuntu:24.04

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
ARG DEBIAN_FRONTEND=noninteractive

# Core tooling + Linux deps needed for Tauri builds/dev.
RUN apt-get update && apt-get install -y --no-install-recommends \
  ca-certificates \
  curl \
  git \
  gh \
  jq \
  lsof \
  openssh-client \
  ripgrep \
  fd-find \
  unzip \
  xz-utils \
  zip \
  build-essential \
  pkg-config \
  python3 \
  python3-pip \
  musl \
  libssl-dev \
  libwebkit2gtk-4.1-dev \
  libgtk-3-dev \
  libayatana-appindicator3-dev \
  librsvg2-dev \
  libnspr4 \
  libnss3 \
  libasound2t64 \
  patchelf \
  xvfb \
  && rm -rf /var/lib/apt/lists/*

# Node.js 22 (for agent-browser + modern JS tooling).
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - \
  && apt-get install -y --no-install-recommends nodejs \
  && npm install -g npm@latest \
  && rm -rf /var/lib/apt/lists/*

# Bun (needed by your nvim-settings project).
RUN mkdir -p /opt/bun \
  && export BUN_INSTALL=/opt/bun \
  && curl -fsSL https://bun.sh/install | bash \
  && ln -sf /opt/bun/bin/bun /usr/local/bin/bun \
  && ln -sf /opt/bun/bin/bunx /usr/local/bin/bunx

# Rust toolchain (needed by Tauri projects).
ENV CARGO_HOME=/opt/cargo
ENV RUSTUP_HOME=/opt/rustup
ENV PATH=/opt/cargo/bin:/opt/bun/bin:${PATH}

RUN mkdir -p "${CARGO_HOME}" "${RUSTUP_HOME}" \
  && chmod -R 777 "${CARGO_HOME}" "${RUSTUP_HOME}" \
  && curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs \
    | sh -s -- -y --profile minimal --default-toolchain stable --no-modify-path \
  && rustup component add rustfmt clippy

ENV HOME=/home/opencode
ENV XDG_CONFIG_HOME=/home/opencode/.config
ENV XDG_DATA_HOME=/home/opencode/.local/share
ENV XDG_CACHE_HOME=/home/opencode/.cache
ENV AGENT_BROWSER_HOME=/home/opencode/.local/share/agent-browser
ENV PLAYWRIGHT_BROWSERS_PATH=/home/opencode/.cache/ms-playwright

# OpenCode + browser automation + Tauri CLI.
RUN mkdir -p \
  /home/opencode/.config \
  /home/opencode/.local/share \
  /home/opencode/.cache \
  /home/opencode/.cache/ms-playwright \
  /home/opencode/.local/share/agent-browser \
  && chmod -R 777 /home/opencode \
  && npm install -g opencode-ai@latest agent-browser@latest @tauri-apps/cli@latest \
  && npx -y playwright@latest install-deps chromium \
  && AGENT_BROWSER_HOME=/home/opencode/.local/share/agent-browser PLAYWRIGHT_BROWSERS_PATH=/home/opencode/.cache/ms-playwright agent-browser install --with-deps \
  && npm cache clean --force

RUN mkdir -p \
  /workspace \
  && chmod -R 777 /home/opencode /workspace

WORKDIR /workspace
ENTRYPOINT ["opencode"]
