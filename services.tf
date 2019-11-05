resource "pagerduty_escalation_policy" "service_1" {
  name      = "Engineering escalation policy"
  num_loops = 3
  
  rule {
    escalation_delay_in_minutes = "${var.time}"
    target {
      type  = "user"
      id    = "${pagerduty_user.user_general_support.*.id[0]}"
    }
  }
  
  rule {
    escalation_delay_in_minutes = "${var.time}"
    target {
      type  = "user"
      id    = "${pagerduty_user.user_general_support.*.id[1]}"
    }
  }
  
  rule {
    escalation_delay_in_minutes = "${var.time}"
    target {
      type  = "user"
      id    = "${pagerduty_user.user_general_support.*.id[2]}"
    }
  }
}


data "pagerduty_vendor" "datadog" { 
  name = "Datadog"
}

resource "pagerduty_service" "service_app1" {
  name                    = "spinnaker app"
  auto_resolve_timeout    = 12200
  auto_resolve_timeout    = 600
  escalation_policy       = "${pagerduty_escalation_policy.service_1.id}"
}

resource "pagerduty_service_integration" "service_example" {
  name                    = "service_${data.pagerduty_vendor.datadog.name}"
  service                 = "${pagerduty_service.service_app1.id}"
  vendor                  = "${data.pagerduty_vendor.datadog.id}"
}



