FROM busybox
COPY go-fib-cpu-waste /go-fib-cpu-waste
CMD /go-fib-cpu-waste
EXPOSE 9090
