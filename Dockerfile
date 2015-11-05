FROM UBUNTU
MAINTAINER mwaeckerlin

ENV DATABASE "specify database name"

RUN apt-get install -y python3-pip python3-mysql.connector
RUN pip3 install mysql-autodoc

WORKDIR /mysql-autodoc
CMD mysql-autodoc -H mysql -u root --password="${MYSQL_ENV_MYSQL_ROOT_PASSWORD}" "${DATABASE}"
VOLUME /mysql-autodoc
