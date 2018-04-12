.PHONY: build build-v3 build-v4 clean

V3_YAML = v3/html/static/mattermost-openapi-v3.yaml
V4_YAML = v4/html/static/mattermost-openapi-v4.yaml

V3_SRC = v3/source
V4_SRC = v4/source

build: build-v3 build-v4

build-v3: .npminstall
	@echo Building mattermost openapi yaml for v3

	@cat $(V3_SRC)/introduction.yaml > $(V3_YAML)
	@cat $(V3_SRC)/users.yaml >> $(V3_YAML)
	@cat $(V3_SRC)/teams.yaml >> $(V3_YAML)
	@cat $(V3_SRC)/channels.yaml >> $(V3_YAML)
	@cat $(V3_SRC)/posts.yaml >> $(V3_YAML)
	@cat $(V3_SRC)/files.yaml >> $(V3_YAML)
	@cat $(V3_SRC)/admin.yaml >> $(V3_YAML)
	@cat $(V3_SRC)/preferences.yaml >> $(V3_YAML)
	@cat $(V3_SRC)/webhooks.yaml >> $(V3_YAML)
	@cat $(V3_SRC)/reactions.yaml >> $(V3_YAML)
	@cat $(V3_SRC)/definitions.yaml >> $(V3_YAML)

	@node_modules/swagger-cli/bin/swagger-cli.js validate $(V3_YAML)

	@echo Complete

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
	@cat $(V4_SRC)/cluster.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/brand.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/commands.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/oauth.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/elasticsearch.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/dataretention.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/plugins.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/roles.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/definitions.yaml >> $(V4_YAML)

	@node_modules/swagger-cli/bin/swagger-cli.js validate $(V4_YAML)

	@echo Complete

.npminstall:
	@echo Getting dependencies using npm

	npm install swagger-cli@1.0.0
	touch $@

clean:
	@echo Cleaning

	rm -f .npminstall
	rm -rf node_modules
