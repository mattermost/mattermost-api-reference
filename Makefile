.PHONY: build

HTML_DIR= ./html/static
SOURCE_DIR = ./source

build:
	@echo Building mattermost openapi yaml

	@cat $(SOURCE_DIR)/introduction.yaml > $(HTML_DIR)/mattermost-openapi.yaml
	@cat $(SOURCE_DIR)/users.yaml >> $(HTML_DIR)/mattermost-openapi.yaml
	@cat $(SOURCE_DIR)/teams.yaml >> $(HTML_DIR)/mattermost-openapi.yaml
	@cat $(SOURCE_DIR)/channels.yaml >> $(HTML_DIR)/mattermost-openapi.yaml
	@cat $(SOURCE_DIR)/posts.yaml >> $(HTML_DIR)/mattermost-openapi.yaml
	@cat $(SOURCE_DIR)/files.yaml >> $(HTML_DIR)/mattermost-openapi.yaml
	@cat $(SOURCE_DIR)/preferences.yaml >> $(HTML_DIR)/mattermost-openapi.yaml
	@cat $(SOURCE_DIR)/incoming-webhooks.yaml >> $(HTML_DIR)/mattermost-openapi.yaml
	@cat $(SOURCE_DIR)/reactions.yaml >> $(HTML_DIR)/mattermost-openapi.yaml
	@cat $(SOURCE_DIR)/definitions.yaml >> $(HTML_DIR)/mattermost-openapi.yaml

	@echo Complete
