## Contributing

We're accepting pull requests! Specifically we're looking for documenation on routes defined [here](https://github.com/mattermost/mattermost-server/tree/master/api4).

All the documentation is written in YAML and found in the [source](https://github.com/mattermost/mattermost-api-reference/tree/master/v4/source) directory.

* When adding a new route, please add it to the correct file. For example, a channel route will go in [channels.yaml](https://github.com/mattermost/mattermost-api-reference/blob/master/v4/source/channels.yaml).
* To add a new tag, please do so in [introduction.yaml](https://github.com/mattermost/mattermost-api-reference/blob/master/v4/source/introduction.yaml)
* Definitions should be added to [definitions.yaml](https://github.com/mattermost/mattermost-api-reference/blob/master/v4/source/definitions.yaml)

There is no strict style guide but please try to follow the example of the existing documentation.

To build the full YAML, run `make build` and it will be output to `html/static/mattermost-openapi.yaml`. To check for syntax, you can copy the contents of that into http://editor.swagger.io/ or you can look into using a commandline or ESLint-based syntax checker.
