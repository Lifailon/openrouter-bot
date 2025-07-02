
# Build image
FROM golang:1.23-alpine3.20 AS build
WORKDIR /openrouter-bot
COPY . .
# Download dependencies for caching
RUN go mod download
# Build bot for determining os and architecture
ARG TARGETOS TARGETARCH
RUN CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -o /openrouter-bot/openrouter-bot

# Final image
FROM alpine:3.20
WORKDIR /openrouter-bot
# Copy config and langs
COPY --from=build /openrouter-bot/config.yaml ./
COPY --from=build /openrouter-bot/lang/ ./lang/
# Copy bot binary
COPY --from=build /openrouter-bot/openrouter-bot ./
# Creating directory for logs
RUN mkdir logs

ENTRYPOINT ["/openrouter-bot/openrouter-bot"]
