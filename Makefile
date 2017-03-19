#
NOW=	$(shell date +%Y%m%d-%H%m%S)

#
build:
	docker build -t gslin/tor:${NOW} .
	docker tag gslin/tor:latest gslin/tor:${NOW}

push:
	docker push gslin/tor
