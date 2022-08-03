GREEN := '\033[0;32m'

define Log =
echo $(2) $(1)
endef

define info =
echo -e '$(GREEN) $(1)'
endef

# tf:init is terraform init
init:
	@terraform init -var="enviroments/tfvars/$(ENV).tfvars" -backend-config="enviroments/backend/$(ENV).conf"
.PHONY: init

clean:
	rm -rf .terraform
.PHONY: clean

plan:
	@terraform plan -out plan.out
.PHONEY: plan

build: clean init plan

.PHONEY: build

apply:
	@terraform apply -auto-approve -input=false plan.out

