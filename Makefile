build:
	@docker build -t artronics/nhsd-newman-docker:latest .

run:
	@docker run --rm -it artronics/nhsd-newman-docker:latest $(ARGS)
