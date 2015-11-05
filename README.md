# mysql-autodoc

Docker image to generate a HTML documentation file from a docker mysql database container.

Connect to a mysql-database, then get the files and cleanup the container:

    docker run --name get-db-doc --link a-mysql-db:mysql -e DATABASE="dbname" mwaeckerlin/mysql-autodoc
    docker cp get-db-doc:/mysql-autodoc/dbname.html .
    docker rm get-db-doc

Or even simpler, use local path as volume and auto-remove the container:

    docker run --rm -v $(pwd):/mysql-autodoc -u $(id -u) --link a-mysql-db:mysql -e DATABASE="dbname" mwaeckerlin/mysql-autodoc
