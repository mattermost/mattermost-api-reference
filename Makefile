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
	@cat $(V4_SRC)/uploads.yaml >> $(V4_YAML)
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
	@cat $(V4_SRC)/bleve.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/dataretention.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/plugins.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/roles.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/schemes.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/service_terms.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/opengraph.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/reactions.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/actions.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/bots.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/cloud.yaml >> $(V4_YAML)
	@cat $(V4_SRC)/definitions.yaml >> $(V4_YAML)

	@node_modules/.bin/swagger-cli validate $(V4_YAML)
	@node_modules/.bin/redoc-cli -t ./v4/html/ssr_template.hbs bundle ./v4/html/static/mattermost-openapi-v4.yaml -o ./v4/html/index.html --options.noAutoAuth  --options.suppressWarnings  --cdn
	@echo Complete

.npminstall:
	@echo Getting dependencies using npm

	npm install
	touch $@

run:
	@echo Starting redoc server

	@node_modules/.bin/redoc-cli -t ./v4/html/ssr_template.hbs serve ./v4/html/static/mattermost-openapi-v4.yaml --options.noAutoAuth  --options.suppressWarnings  --ssr

clean:
	@echo Cleaning

	rm -f .npminstall
	rm -rf node_modules
