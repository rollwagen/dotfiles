
# TFLint ruleset plugin for Terraform AWS provider
# <https://github.com/terraform-linters/tflint-ruleset-aws>
#
#  *Deep Checking* uses your provider's credentials to perform a more strict
#  inspection. For example, if the IAM profile references something that doesn't
#  exist, terraform apply will fail, which can't be found by general validation.
#
plugin "aws" {
    source  = "github.com/terraform-linters/tflint-ruleset-aws"
    version = "0.14.0"

    enabled = true
    # deep_check = true
}

#
# Terraform Language (i.e. provider/plugin independent) rules see
#   <https://github.com/terraform-linters/tflint/tree/master/docs/rules>
#

# Disallow // comments in favor of #
# default: disabled
rule "terraform_comment_syntax" {
  enabled = true
}

# Disallow output declarations without description
# default: disabled
rule "terraform_documented_outputs" {
  enabled = true
}

# Disallow variable declarations without description
# default: disabled
rule "terraform_documented_variables" {
  enabled = true
}

# Disallow variable declarations without type
# default: disabled
rule "terraform_typed_variables" {
  enabled = true
}

# Disallow variables, data sources,
# and locals that are declared but never used
# default: disabled
rule "terraform_unused_declarations" {
   enabled = true
}

# Check that all required_providers
# are used in the module
rule "terraform_unused_required_providers" {
   enabled = true
}
