FROM oven/bun:1-alpine as deps

WORKDIR /build

COPY package.json package.json
COPY bun.lockb bun.lockb

RUN bun install --frozen-lockfile

FROM deps as server

COPY . .
RUN bun build --compile ./index.ts --outfile=server

FROM ubuntu:mantic

COPY --from=server /build/server ./server
EXPOSE 3001
CMD [ "./server" ]
