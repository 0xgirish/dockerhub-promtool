# build promtool from source
FROM golang:1.17.5 as builder

# promtool version
ARG checkout_point

# add maintainer
LABEL maintainer="zkmrgirish@gmail.com"

WORKDIR /go/src

# clone prometheus source and checkout version
RUN git clone https://github.com/prometheus/prometheus && cd prometheus && git checkout $checkout_point

# build promtool from source
WORKDIR /go/src/prometheus
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /bin/promtool ./cmd/promtool

FROM alpine:3.9
COPY --from=builder /bin/promtool /bin
ENTRYPOINT ["/bin/promtool"]