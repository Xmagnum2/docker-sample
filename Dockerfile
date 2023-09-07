FROM golang:1.19.1-alpine
RUN mkdir /app
WORKDIR /app
# ADDではなくCOPY、COPYでできないこと（外部からダウンロード、zip展開など）はRUNで
COPY ./main.go .
CMD ["go", "run", "main.go"]