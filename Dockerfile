FROM golang:1.20-alpine AS builder

WORKDIR /app

COPY ./app .
RUN go build -o /main main.go


FROM scratch
WORKDIR /
COPY --from=builder /main /main
ENTRYPOINT ["./main"]