.PHONY: build build-v3 build-v4

HTML_DIR = ./html/static
V3_YAML = $(HTML_DIR)/mattermost-openapi-v3.yaml
V4_YAML = $(HTML_DIR)/mattermost-openapi-v4.yaml

SOURCE_DIR = ./source
V3_DIR = $(SOURCE_DIR)/v3
V4_DIR = $(SOURCE_DIR)/v4

build: build-v3 build-v4

build-v3:
	@echo Building mattermost openapi yaml for v3

	@cat $(V3_DIR)/introduction.yaml > $(V3_YAML)
	@cat $(V3_DIR)/users.yaml >> $(V3_YAML)
	@cat $(V3_DIR)/teams.yaml >> $(V3_YAML)
	@cat $(V3_DIR)/channels.yaml >> $(V3_YAML)
	@cat $(V3_DIR)/posts.yaml >> $(V3_YAML)
	@cat $(V3_DIR)/files.yaml >> $(V3_YAML)
	@cat $(V3_DIR)/admin.yaml >> $(V3_YAML)
	@cat $(V3_DIR)/preferences.yaml >> $(V3_YAML)
	@cat $(V3_DIR)/webhooks.yaml >> $(V3_YAML)
	@cat $(V3_DIR)/reactions.yaml >> $(V3_YAML)
	@cat $(V3_DIR)/definitions.yaml >> $(V3_YAML)

	@echo Complete

build-v4:
	@echo Building mattermost openapi yaml for v4

	@cat $(V4_DIR)/introduction.yaml > $(V4_YAML)
	@cat $(V4_DIR)/users.yaml >> $(V4_YAML)
	@cat $(V4_DIR)/teams.yaml >> $(V4_YAML)
	@cat $(V4_DIR)/definitions.yaml >> $(V4_YAML)

	@echo Complete
