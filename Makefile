.PHONY: build build-v4 clean

V4_YAML = v4/html/static/mattermost-openapi-v4.yaml

V4_SRC = v4/source

build: build-v4

build-v4: .npminstall
	@echo Building mattermost openapi yaml for v4

	@cat $(V4_SRC)/introduction.yaml > $(V4_YAML)
	@cat $(V4_SRC)/users.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/status.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/teams.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/channels.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/posts.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/preferences.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/files.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/jobs.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/system.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/emoji.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/webhooks.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/saml.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/compliance.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/ldap.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/groups.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/cluster.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/brand.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/commands.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/oauth.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/elasticsearch.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/dataretention.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/plugins.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/roles.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/schemes.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/opengraph.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/reactions.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/actions.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/bots.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/definitions.yaml >> $(V4_YAML)

	@node_modules/swagger-cli/bin/swagger-cli.js validate $(V4_YAML)

	@echo Complete

.npminstall:
	@echo Getting dependencies using npm

	npm install swagger-cli
	npm install redoc-cli
	touch $@

run:
	@echo Starting redoc server

	npx redoc-cli serve v4/html/static/mattermost-openapi-v4.yaml

clean:
	@echo Cleaning

	rm -f .npminstall
	rm -rf node_modules
