openbsd_amd64:
	GOOS=openbsd GOARCH=amd64 go build -o terraform-provider-schemaregistry
	tar cvzf terraform-provider-schemaregistry_openbsd_amd64.tar.gz terraform-provider-schemaregistry

freebsd_amd64:
	GOOS=freebsd GOARCH=amd64 go build -o terraform-provider-schemaregistry
	tar cvzf terraform-provider-schemaregistry_freebsd_amd64.tar.gz terraform-provider-schemaregistry

linux_amd64:
	GOOS=linux GOARCH=amd64 go build -o terraform-provider-schemaregistry
	tar cvzf terraform-provider-schemaregistry_linux_amd64.tar.gz terraform-provider-schemaregistry

darwin_amd64:
	GOOS=darwin GOARCH=amd64 go build -o terraform-provider-schemaregistry
	tar cvzf terraform-provider-schemaregistry_darwin_amd64.tar.gz terraform-provider-schemaregistry

test:
	go build -o terraform-provider-schemaregistry
	mkdir -p ~/.terraform.d/plugins/github.com/francescop/schemaregistry/1.0.0/darwin_amd64
	cp terraform-provider-schemaregistry ~/.terraform.d/plugins/github.com/francescop/schemaregistry/1.0.0/darwin_amd64/
	cd examples; rm -f .terraform.lock.hcl; terraform init; terraform apply

clean:
	cd examples; rm -rf .terraform; rm -f *.tfstate*


# mkdir -p ~/.terraform.d/plugins/github.com/francescop/schemaregistry/1.0.0/linux_amd64
# wget -c https://github.com/francescop/kafka_schema_registry_terraform_provider/releases/download/v1.0.0/terraform-provider-schemaregistry_linux_amd64.tar.gz -O - | tar -xz -C ~/.terraform.d/plugins/github.com/francescop/schemaregistry/1.0.0/linux_amd64/
# chmod +X ~/.terraform.d/plugins/github.com/francescop/schemaregistry/1.0.0/linux_amd64/terraform-provider-schemaregistry