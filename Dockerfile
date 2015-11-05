FROM UBUNTU
MAINTAINER mwaeckerlin

ENV DATABASE ""

RUN apt-get install -y python3-pip python3-mysql.connector
RUN pip3 install mysql-autodoc

WORKDIR /mysql-autodoc
CMD if -z "${MYSQL_ENV_MYSQL_ROOT_PASSWORD}"; then \
      echo "**** ERROR: you must link to a mysql database" 1>&2; \
      exit 1; \
    fi; \
    if -n "${DATABASE}"; then \
      mysql-autodoc -H mysql -u root --password="${MYSQL_ENV_MYSQL_ROOT_PASSWORD}" "${DATABASE}"; \
    else \
      for db in $(echo "show databases;" | \
                  mysql -h mysql -u root --password=${MYSQL_ENV_MYSQL_ROOT_PASSWORD} \
                  2> /dev/null); do \
        mysql-autodoc -H mysql -u root --password="${MYSQL_ENV_MYSQL_ROOT_PASSWORD}" "${db}"; \
      done; \
    fi;
VOLUME /mysql-autodoc
