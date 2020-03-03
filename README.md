## Example of Multi-stage Build on Dockerfile

In Dockerfile `FROM` gives us to use an image which typed.

```docker
FROM scratch as NOTthis
WORKDIR /nothis/
COPY nothis.txt /nothis/output.txt
```

In thise lines, normal file copying. But `as NOTthis` is gives file system accessibility to others.

`golang:1.14-alpine` just official builder for `goLang`. `AS goBuilder` gives other accessibility also.

```

in `goLang` `go build -o bla` makes `./main.go` built.


COPY --from=goBuilder /bin/exited /bin/exited
```
in this line 3th image uses the file system of the 2nd of.

Then the 3th runs built file from the 2nd.

Building: `$ docker build -t multistage .`

Output fo `$ docker run multistage`:

`This file is from Alpine GoLang Builder: Welcome to Alpine Linux 3.11;Kernel  on an m (l);, but this is from scratch: This file from the first image. Scratch. The built file is run on 3th image`

