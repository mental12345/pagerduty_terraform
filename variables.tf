variable "pagerduty_token" {
  description     = "token for pagerduty"
  default         = "xxxxxxxxxxxxxxxxx" 
}

variable "users_team" {
  default = {
    "0"           = "ian@armory.io" 
    "1"           = "ramon@armory.io"
    "2"           = "test@armory.io"
  }
} 

variable "users_sre_team2" {
  default = {
    "0"           = "ia@armory.io" 
    "1"           = "ie@armory.io"
    "2"           = "iu@armory.io"
  }
} 

variable "time" {
  default         = 10
}
