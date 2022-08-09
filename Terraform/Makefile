
# tf:init is terraform init
.PHONY: init
init:
	@test -n "$(ENV)" || (echo " \033[31m Missing ENV $$? \033[0m"; exit 1)
	@echo "\033[92m Building $(ENV) environment \033[0m"
	@terraform init -var="enviroments/tfvars/$(ENV).tfvars" -backend-config="enviroments/backend/$(ENV).conf"

clean:
	rm -rf .terraform
.PHONY: clean

plan:
	@test -n "$(ENV)" || (echo " \033[31m Missing ENV $$? \033[0m"; exit 1)
	@terraform plan -out plan.out
.PHONEY: plan

build: clean init plan
.PHONEY: build

apply:
	@terraform apply -auto-approve -input=false plan.out
