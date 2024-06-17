package terraform.aws.common

# Missing required tags
deny[msg] {
 changeset := input.resource_changes[_]
 # Ignore if block is data 
 split(changeset.address, ".")[0] != "data"

 changeset.provider_name == "registry.terraform.io/hashicorp/aws"
 # Ignore if resource doesn't support tags_all
 changeset.change.after.tags_all

 required_tags := {"Name", "Application", "Project", "Owner", "Environment"}
 provided_tags := {tag | changeset.change.after.tags_all[tag]}
 missing_tags := required_tags - provided_tags

 count(missing_tags) > 0

 msg := sprintf("%v is missing required tags: %v", [
  changeset.address,
  concat(", ", missing_tags),
 ])
}