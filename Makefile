EXERCISM_LANG := elixir

include ../docker.mk

test::
	$(DOCKER_RUN) mix test lib/exercism/elixir

lint::
	$(DOCKER_RUN) mix credo
