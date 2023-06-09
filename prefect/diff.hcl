metadata {
  path = "prefect"
  name = "diff"
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

step "terraform" {
  wkdir   = "prefect/terraform"
  target  = "prefect/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "prefect",
  ]

  sha     = "h1:C4lNbtAbOm/zAIh6NJUeGK2moS6/ij7uNJ8k399cZzM="
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "prefect/helm"
  target  = "prefect/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "prefect",
  ]

  sha     = "h1:9A/r0szyiVrgtCaR68SYHz/RQjRssNvGLF3IilWUXGI="
  retries = 0
  verbose = false
}
