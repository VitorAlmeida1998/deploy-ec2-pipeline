# 🚀 CI/CD Pipeline com GitHub Actions + Docker + AWS EC2

Este projeto demonstra como implementar um **pipeline completo de CI/CD** utilizando:

- **GitHub Actions** → Automação do build, push da imagem Docker e deploy.  
- **Docker** → Containerização da aplicação.  
- **AWS EC2** → Servidor de destino para hospedar a aplicação.

---

## 📌 Arquitetura

1. **Aplicação Node.js** simples rodando em Express.  
2. **Dockerfile** para empacotar a aplicação em um container.  
3. **GitHub Actions Workflow** que:
   - Faz build e push da imagem para o GitHub Container Registry (GHCR).  
   - Conecta na instância **EC2** via SSH.  
   - Puxa a imagem mais recente e reinicia o container.  

---

## 🛠️ Tecnologias Utilizadas

- Node.js  
- Express  
- Docker  
- GitHub Actions  
- AWS EC2

---

## 📂 Estrutura do Projeto

```
deploy-ec2-pipeline/
├── src/
│   └── index.js        # Aplicação Node.js
├── package.json        # Dependências do projeto
├── Dockerfile          # Build da imagem
├── .dockerignore       # Arquivos ignorados no build
└── .github/
    └── workflows/
        └── cicd.yml    # Pipeline CI/CD
```

---

## ▶️ Rodando Localmente

Clone o repositório:

```bash
git clone <SEU_FORK_OU_REPO>.git
cd deploy-ec2-pipeline
```

Instale dependências e rode:

```bash
npm install
npm start
```

Acesse em: http://localhost:3000 🚀

---

## 🐳 Rodando com Docker

Build e run da imagem:

```bash
docker build -t ci-cd-ec2 .
docker run -d -p 3000:3000 ci-cd-ec2
```

---

## ⚙️ Configuração do GitHub Actions

### 🔑 Secrets necessários

No repositório, adicione em **Settings > Secrets and variables > Actions**:

- `EC2_HOST` → IP da instância EC2  
- `EC2_USER` → Usuário (ex.: `ubuntu`)  
- `EC2_SSH_KEY` → Conteúdo da sua chave privada (ex.: `~/.ssh/id_rsa`)  
- `IMAGE_NAME` → Nome da imagem no GHCR (ex.: `ghcr.io/seuusuario/deploy-ec2-pipeline`)  
- `GHCR_USERNAME` (opcional) → Usuário GitHub (use se o pacote do GHCR for **privado**)  
- `GHCR_TOKEN` (opcional) → PAT com `read:packages` para login no GHCR na EC2  

> Dica: você pode deixar o pacote do GHCR **público** e não usar `GHCR_USERNAME/TOKEN` na EC2.

---

## 🚀 Deploy Automático

1. Faça commit e push para as branches `main` **ou** `master`.  
2. O **GitHub Actions** irá:  
   - Buildar a imagem  
   - Publicar no GHCR  
   - Conectar na **EC2**  
   - Atualizar o container em execução  

3. Acesse sua aplicação em `http://<SEU_IP_EC2>`.

---

## ☁️ Preparando a EC2 (Ubuntu 22.04)

```bash
# Docker Engine
curl -fsSL https://get.docker.com | sudo sh
sudo usermod -aG docker $USER
newgrp docker

# (opcional) login no GHCR se o pacote for privado
echo $CR_PAT | docker login ghcr.io -u <seu_usuario> --password-stdin
```

Abra as portas no Security Group: **22** (SSH) e **80** (HTTP).

---

## 📊 Próximos Passos

- Adicionar **Nginx** como reverse proxy + HTTPS.  
- Usar **Docker Compose**.  
- Observabilidade com **Prometheus + Grafana**.  

---

## 👨‍💻 Autor

Projeto base gerado para demonstração de CI/CD.
