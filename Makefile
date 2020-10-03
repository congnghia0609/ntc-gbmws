NAME=ntc-gbmws
VERSION=0.0.1

.PHONY: build
build:
	@echo "Build project..."
	@go build -o $(NAME)

.PHONY: run
run:
	@echo "Run project mode development..."
	@./$(NAME) -e development

.PHONY: clean
clean:
	@echo "Clean project..."
	@rm -f $(NAME)

.PHONY: deps
deps:
	@./deps.sh
