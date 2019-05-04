#
.PHONY:	build push

#
NOW=	$(shell date +%Y%m%d-%H%m%S)

#
build:
	docker build -t gslin/tor:${NOW} .
	docker tag gslin/tor:${NOW} gslin/tor:latest

push:
	docker push gslin/tor
