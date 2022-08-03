
# tf:init is terraform init
.PHONY: init
init:
	@test -n "$(ENV)" || (echo "\033[91m Missing ENV" )
	@terraform init -var="enviroments/tfvars/$(ENV).tfvars" -backend-config="enviroments/backend/$(ENV).conf"

clean:
	rm -rf .terraform
.PHONY: clean

plan:
	@test -n "$(ENV)" || ERROR
	@terraform plan -out plan.out
.PHONEY: plan

build: clean init plan

.PHONEY: build

apply:
	@terraform apply -auto-approve -input=false plan.out

ERROR:
	$(error Missing ENV)
