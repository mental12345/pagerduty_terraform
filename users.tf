resource "pagerduty_team" "sre_team" {
    name        = "SRE_team"
    description = "DevOps and SRE PD team"
}

resource "pagerduty_user" "user_general_support" {
  name          = "${lookup(var.users_team, count.index)}"
  count         = 3
  email         = "${lookup(var.users_team, count.index)}"
  teams         = ["${pagerduty_team.sre_team.id}"]
}

resource "pagerduty_user" "user_sre_support" {
  name          = "${lookup(var.users_sre_team2, count.index)}"
  count         = 3
  email         = "${lookup(var.users_sre_team2, count.index)}"
  teams         = ["${pagerduty_team.sre_team.id}"]
}
