test2:
	./bin/kitchen test

debug:
	./bin/kitchen test  -l d --debug 

bundle:
	bundler install --binstubs


berks:
	- rm Berksfile.lock 
	./bin/berks install

purgedb:
	sudo apt-get purge  postgresql-9.6 postgresql-client-9.6 postgresql-client-common postgresql-common postgresql-contrib-9.6

diag:
	./bin/kitchen diagnose --no-instances --loader
