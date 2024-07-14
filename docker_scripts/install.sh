export PATH="/root/.turso:$PATH"
sh /usr/src/app/docker_scripts/turso_install.sh
pnpm install -g bun
pnpm install