variable "provider_region"{
	type = string
        default = "us-east-1"
}

variable "instance_name"{
	type = string
        default = "Test"
}

variable "ami_id"{
	type = string
        default = "ami-0c293f3f676ec4f90"
}

variable "instance_type"{
	type = string
        default = "t2.micro"
}

variable "key_name"{
	type = string
        default = "darpan"
}