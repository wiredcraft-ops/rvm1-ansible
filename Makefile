build:
	cat ~/.ssh/id_rsa.pub > authorized_keys
	docker build -t rvm .
	rm authorized_keys

run:
	docker run -d -p 2222:22 rvm

bash:
	docker exec -it rvm bash
