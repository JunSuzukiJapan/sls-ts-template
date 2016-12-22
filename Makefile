all: deploy

tsc: src/*.ts
	cd src; tsc *.ts --outDir ../dest

copy: src/*.yml
	cp src/*.yml ./dest

build: tsc copy

deploy: tsc copy
	cd dest; sls deploy

invoke: tsc copy
	cd dest; sls invoke -f hello

local: tsc copy
	cd dest; sls invoke local -f hello

clean:
	rm -r dest
