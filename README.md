# 🧪 Rails CRUD - TDD Lab com RSpec e Capybara

Projeto desenvolvido com o objetivo de aplicar na prática os princípios de **Desenvolvimento Orientado a Testes (TDD)** no ecossistema **Ruby on Rails**, seguindo a metodologia apresentada por **Jackson Pires**.

Durante o desenvolvimento, foi utilizado o ciclo clássico do TDD (**Red → Green → Refactor**) para construir um CRUD completo, garantindo qualidade, segurança e manutenção facilitada através de uma suíte de testes automatizados.

---

## 🚀 Tecnologias Utilizadas

* **Ruby:** 3.4.x
* **Framework:** Ruby on Rails 8
* **Test Framework:** RSpec Rails
* **Testes End-to-End:** Capybara
* **Factories:** FactoryBot
* **Dados Fictícios:** Faker
* **Banco de Dados:** SQLite3

---

## 🎯 Objetivos do Projeto

* Aplicar os conceitos fundamentais de TDD.
* Desenvolver um CRUD completo utilizando Ruby on Rails.
* Implementar testes automatizados em diferentes camadas da aplicação.
* Praticar boas práticas de desenvolvimento e organização de código.

---

## ✅ Cobertura de Testes

A suíte de testes foi estruturada em três níveis principais:

### 🔹 Model Specs

Responsáveis por validar:

* Regras de negócio;
* Validações de campos;
* Persistência de dados;
* Integridade dos modelos.

### 🔹 Request Specs

Responsáveis por verificar:

* Respostas dos endpoints;
* Códigos de status HTTP (`200`, `302`, etc.);
* Fluxos de redirecionamento;
* Comportamento dos controllers.

### 🔹 System Specs

Simulam a experiência real do usuário utilizando o navegador através do Capybara, cobrindo:

* Listagem de registros;
* Criação de novos registros;
* Edição de dados;
* Exclusão de registros.

---

## 💻 Pré-requisitos

Antes de iniciar, certifique-se de possuir instalado:

* Ruby **3.4.x**
* Bundler
* SQLite3
* Git

---

## 📦 Configuração do Ambiente

### 1️⃣ Clone o repositório

```bash
git clone https://github.com/Daniellezago/tdd_app.git
cd tdd_app
```

### 2️⃣ Instale as dependências

```bash
bundle install
```

### 3️⃣ Configure o banco de dados

Crie o banco e execute as migrações:

```bash
rails db:prepare
```

---

## 🧪 Executando os Testes

Para executar toda a suíte de testes:

```bash
bundle exec rspec
```

Para executar testes específicos:

```bash
bundle exec rspec spec/models
bundle exec rspec spec/requests
bundle exec rspec spec/system
```

---

## ▶️ Executando a Aplicação

Inicie o servidor Rails:

```bash
rails server
```

Acesse a aplicação no navegador:

```text
http://localhost:3000
```

---

## 📚 Conceitos Praticados

* Test Driven Development (TDD)
* Ciclo Red → Green → Refactor
* Testes automatizados
* Boas práticas com RSpec
* Testes de interface com Capybara
* Organização e manutenção de código

---

## 👩‍💻 Autora

Desenvolvido por **Danielle Zago** como parte do portfólio de estudos em **Ruby on Rails**, **testes automatizados** e **cultura ágil**.

⭐ Se este projeto foi útil para você, considere deixar uma estrela no repositório.
