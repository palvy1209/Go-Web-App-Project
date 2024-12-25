FROM golang:1.22.5 as base
WORKDIR /app
COPY go.mod ./
RUN go mod download
COPY . .
RUN go build -o main .
# EXPOSE 8080
# CMD ["./main"]
# final stage distrolees image 

From gcr.io/distroless/base
WORKDIR /app
COPY --from=base /app/main .
COPY --from=base /app/static ./static
EXPOSE 8080
CMD [ "./main" ]
