# Mattermost API Documentation

This respository holds the API reference available at [https://api.mattermost.com](https://api.mattermost.com).

The Mattermost API reference uses the [OpenAPI standard](https://openapis.org/) and the [ReDoc document generator](https://github.com/Rebilly/ReDoc).

All documentation is available under the terms of a [Creative Commons License](http://creativecommons.org/licenses/by-nc-sa/3.0/).

## Contributing

**Mattermost API version 4 is an active and in-progress project. We're looking for contributors to code server endpoints, build drivers and write documentation. If you're interested [please join our Mattermost instance](https://pre-release.mattermost.com/signup_user_complete/?id=f1924a8db44ff3bb41c96424cdc20676) and join the [APIv4 channel](https://pre-release.mattermost.com/core/channels/apiv4).**

We're accepting pull requests! Specifically we're looking for documenation on routes defined [here](https://github.com/mattermost/platform/tree/master/api).

All the documentation is written in YAML and found in the [source](https://github.com/mattermost/mattermost-api-reference/tree/master/source) directory. APIv3 documentation is in the [v3 directory](https://github.com/mattermost/mattermost-api-reference/tree/master/source/v3), and APIv4 documentation is in the [v4 directory](https://github.com/mattermost/mattermost-api-reference/tree/master/source/v4).

* When adding a new route, please add it to the correct file. For example, a channel route will go in [channels.yaml](https://github.com/mattermost/mattermost-api-reference/blob/master/source/channels.yaml).
* To add a new tag, please do so in [introduction.yaml](https://github.com/mattermost/mattermost-api-reference/blob/master/source/introduction.yaml)
* Definitions should be added to [definitions.yaml](https://github.com/mattermost/mattermost-api-reference/blob/master/source/definitions.yaml)

There is no strict style guide but please try to follow the example of the existing documentation.

To build the full YAML, run `make build` and it will be output to `html/static/mattermost-openapi.yaml`. To check for syntax, you can copy the contents of that into http://editor.swagger.io/ or you can look into using a commandline or ESLint-based syntax checker.

## Deployment

Currently, deployment is handled manually and can be done by running `make build` and deploying the full `/html` directory to the hosted sited.
