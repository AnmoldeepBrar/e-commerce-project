Rails.configuration.stripe = {
  :publishable_key => "pk_test_51NYwKyCrvrSzkpoXkUH6FLTTIEaaD3QiGXKZb7GT0XWX5qf4qQHPoBhGfQwoqPegxexfkI4YG2ZOgYsyYxXxR1K800fTzCgzw2",
  :secret_key => "sk_test_51NYwKyCrvrSzkpoXZWSFkNVbIHiAg35extpliJzVmw64BGZ1Ne9H603KOCHhhOVuWB7jSZbQoA3tnJdqpZWraecj00qPr8hUD6"
}
Stripe.api_key = Rails.configuration.stripe[:secret_key]