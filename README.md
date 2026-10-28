# rdiCidr

Calculadora interactiva de subnetting IPv4 en React, usada acá como ejercicio de DevOps: contenedor, infraestructura como código y CI.

La app es de [RDerik](https://rderik.com) (MIT). Demo: https://rdicidr.rderik.com

![Infraestructura](docs/infra.svg)

## Qué agregué

- **Docker:** build multi-stage servido por nginx, con `/health`.
- **Terraform:** VPC, ALB, ECS Fargate, ECR y CloudWatch por entorno (`devel`, `stage`). Una guarda impide aplicar el `tfvars` de un entorno sobre el workspace de otro.
- **CI:** en cada PR corre lint, tests y build, y solo acepta el flujo `feature/*` o `bugfix/*` → `devel` → `stage` → `main`.

## Correrlo

```bash
npm ci
npm start
```

Con Docker: `docker build -t rdicidr . && docker run -p 8080:80 rdicidr`.

Infraestructura (necesita credenciales de AWS):

```bash
cd terraform
terraform workspace select -or-create devel
terraform apply -var-file=envs/devel.tfvars -var image_tag=<tag>
```
