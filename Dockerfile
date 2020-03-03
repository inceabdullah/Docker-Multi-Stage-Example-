FROM scratch as NOTthis
WORKDIR /nothis/
COPY nothis.txt /nothis/output.txt

FROM golang:1.14-alpine AS goBuilder

WORKDIR /gobuild/
COPY main.go /gobuild/
RUN cat /etc/issue > /gobuild/output.txt
COPY --from=NOTthis /nothis/output.txt /gobuild/nothis.txt
RUN sed -i "s|FMTNOTES|This file is from Alpine GoLang Builder: $(cat /gobuild/output.txt | paste -sd ';'), but this is from scratch: $(cat /gobuild/nothis.txt). The built file is run on 3th image taht is second scratch|g"  /gobuild/main.go
RUN CGO_ENABLED=0 go build -o /bin/exited

FROM scratch
COPY --from=goBuilder /bin/exited /bin/exited
ENTRYPOINT ["/bin/exited"]