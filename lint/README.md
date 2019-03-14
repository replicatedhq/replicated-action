# Replicated Lint GitHub Action

Lints a replicated or ship yaml with your account.

This Action uses the [replicatedhq/replicated](https://github.com/replicatedhq/replicated) CLI to lint a release for your Replicated app. It will post linting errors, warnings and suggestions as a comment in the Pull Request.

By default, this action will create a new release in your app's unstable channel. This action looks for a file named `replicated.yaml` in the root of your repo. The release version will be the git commit SHA, and the release notes will match Pull Request message.

You can set environment variables to use a different channel or path to a YAML.

### Quick Start

Add a new [GitHub Action](https://github.com/features/actions) to your repo. You can create a file named `.github/main.workflow` and use this as a quick start:

```hcl
workflow "Lint Replicated Release" {
  resolves = "replicated_lint"
  on = "pull_request"
}

action "filter-to-pr-open-synced" {
  uses = "actions/bin/filter@master"
  args = "action 'opened|synchronize'"
}

action "replicated_release" {
  uses = "replicatedhq/replicated-action/lint@v0.2.0"
  needs = "filter-to-pr-open-synced"
  secrets = [
    "GITHUB_TOKEN",
    "REPLICATED_API_TOKEN"
  ],
  env = {
    REPLICATED_APP = ""
  }
}
```

Note: You'll need to put a value in for the REPLICATED_API_TOKEN secret, and either an app slug or app id for the REPLICATED_APP env.

### Secrets
| Name | Default Value | Description |
|------|---------------|-------------|
| REPLICATED_API_TOKEN | "" | Required. An API token from your Replicated account to use in requests   |


### Environment Variables

The following environment variables can be set to override defaults:

| Name | Default Value | Description |
|------|---------------|-------------|
| REPLICATED_APP | "" | Required. Set to the app ID or app slug of your Replicated app |
| REPLICATED_YAML | "./replicated.yaml" | Set to the path of the YAML to lint |

