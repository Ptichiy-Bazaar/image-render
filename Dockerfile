FROM oven/bun:1-alpine as deps

WORKDIR /build

COPY package.json package.json
COPY bun.lockb bun.lockb

RUN bun install --frozen-lockfile
COPY . .

EXPOSE 80
ENTRYPOINT [ "bun", "run", "index.tsx" ]
