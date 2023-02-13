# How to use

1. To avoid affecting your local test environment, suggest [installing with Docker](https://postgresql-anonymizer.readthedocs.io/en/latest/INSTALL/#install-with-docker) 

2. excute the following command

```
$ psql --host=localhost --port=6543 --user=postgres -d falcon_dev -f masking_rules.sql
```
