FROM golang:latest

LABEL maintainer="Nitali Arora <nitali.arora@gmail.com>, Louis Lefebvre <louislefebvre199@gmail.com>"

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN go build -o server .

EXPOSE 8080

CMD ["./server"]