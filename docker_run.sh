# run docker with terminal attached for debuging purpose
docker run -it -v ~/.dbt/:/app/.secrets --name dbtbqlocal --entrypoint bash taz002dev/dbt-bq:latest
# run docker detached
docker run -d -v ~/.dbt/:/app/.secrets --name dbtbqlocal taz002dev/dbt-bq:latest run
