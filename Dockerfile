FROM ubuntu
COPY ./How-to-Make-a-Computer-Operating-System/src/ /src
WORKDIR /src
RUN apt-get update && apt-get install -y \ 
	nasm \
	make \
	build-essential \
	grub \
	qemu \
	zip \
&& rm -rf /var/lib/apt/lists/*
