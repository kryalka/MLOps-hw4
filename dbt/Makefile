DBT ?= ../.venv/bin/dbt
SQLFLUFF ?= .venv/bin/sqlfluff
DBT_FLAGS = --profiles-dir .

.PHONY: deps run test unit build docs serve lint fix clean

deps:
	$(DBT) deps $(DBT_FLAGS)
run:
	$(DBT) run $(DBT_FLAGS)
test:
	$(DBT) test $(DBT_FLAGS)
unit:
	$(DBT) test $(DBT_FLAGS) --select test_type:unit
build: deps
	$(DBT) build $(DBT_FLAGS)
docs:
	$(DBT) docs generate $(DBT_FLAGS)
serve:
	$(DBT) docs serve $(DBT_FLAGS) --port 8085
lint:
	cd .. && $(SQLFLUFF) lint --config dbt/.sqlfluff dbt/models dbt/macros dbt/tests
	cd .. && $(SQLFLUFF) lint --config dbt/.sqlfluff --templater raw --disregard-sqlfluffignores dbt/tests/fixtures
fix:
	cd .. && $(SQLFLUFF) fix --config dbt/.sqlfluff dbt/models dbt/macros dbt/tests
	cd .. && $(SQLFLUFF) fix --config dbt/.sqlfluff --templater raw --disregard-sqlfluffignores dbt/tests/fixtures
clean:
	$(DBT) clean $(DBT_FLAGS)
