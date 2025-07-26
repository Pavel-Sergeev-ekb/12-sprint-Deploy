FROM golang:1.23.6

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod tidy

COPY . ./

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /delivery

CMD ["/delivery"]