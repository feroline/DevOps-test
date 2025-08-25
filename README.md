# DevOps-test
Configuração para deploy da aplicação em repositórios distintos, utilizando tomcat, jenkins, BD postgres. Também neste repositório estão contido os testes automatizados utilizando Junit (componentes), Rest Assuranced (API) e Selenium (funcionais de front-end). Também será utilizado o Sonarcube para verificação da esteira em uma pipeline CI/CD

#### Clonando o projeto 
```bash 
    # Também baixa o conteúdo dos submodules, projetos que estão em repositórios diferentes
    git clone --recurse-submodules https://github.com/seu-usuario/devops-repo.git
```

#### Atualizando os submodules  
```bash 
    git submodule update --remote
```