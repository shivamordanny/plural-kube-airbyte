metadata {
  path = "prefect"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "prefect/terraform"
  target  = "prefect/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:C4lNbtAbOm/zAIh6NJUeGK2moS6/ij7uNJ8k399cZzM="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "prefect/terraform"
  target  = "prefect/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:C4lNbtAbOm/zAIh6NJUeGK2moS6/ij7uNJ8k399cZzM="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "prefect"
  target  = "prefect/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "prefect",
  ]

  sha     = "h1:C4lNbtAbOm/zAIh6NJUeGK2moS6/ij7uNJ8k399cZzM="
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "prefect"
  target  = "prefect/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "prefect",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "prefect"
  target  = "prefect/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "prefect",
  ]

  sha     = "h1:9A/r0szyiVrgtCaR68SYHz/RQjRssNvGLF3IilWUXGI="
  retries = 2
  verbose = false
}
