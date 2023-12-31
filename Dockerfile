FROM oven/bun:1.0.11-slim AS build

WORKDIR /app

COPY . .
RUN bun install
RUN bun run build

FROM build AS release

COPY --from=build /app/build ./

RUN bun install --production --no-save --frozen-lockfile

CMD bun run start
