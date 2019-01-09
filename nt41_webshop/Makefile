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
	sudo apt-get purge  postgresql-9.6 postgresql-client-9.6 postgresql-client-common postgresql-common postgresql-contrib-9.6 -y

diag:
	./bin/kitchen diagnose --no-instances --loader


restart: purgedb berks test2
	echo lets go chef

test3:
	KITCHEN_LOCAL_YAML=kitchen_test.yml ./bin/kitchen test
