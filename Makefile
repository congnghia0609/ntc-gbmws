NAME=ntc-gbmws
VERSION=0.0.1


.PHONY: deps
deps:
	@./deps.sh

.PHONY: build
build:
	@echo "Build project..."
	@go build -o client client.go
	@go build -o server server.go epoll.go

.PHONY: clean
clean:
	@echo "Clean project..."
	@rm -f client
	@rm -f server

# .PHONY: run
# run:
# 	@echo "Run project mode development..."
# 	@./$(NAME) -e development
