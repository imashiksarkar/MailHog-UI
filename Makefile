all: bindata fmt ui

ui:
	go install .

bindata: bindata-deps
	-rm assets/assets.go
	$(shell go env GOPATH)/bin/go-bindata -o assets/assets.go -pkg assets assets/...

bindata-deps:
	go install github.com/jteeuwen/go-bindata/...@latest

fmt:
	go fmt ./...

.PNONY: all ui bindata bindata-deps fmt
