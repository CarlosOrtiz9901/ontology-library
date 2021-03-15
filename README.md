## CREACIÓN DE UN BUSCADOR DE LIBROS Y SUS EVENTOS BASADO EN WEB SEMANTICA Y ONTOLOGÍAS

## Instalación

#### 1. Tener instalado Apache Jena Fuseki
```bash
#Url para descargar Apache Jena Fuseki
https://downloads.apache.org/jena/binaries/apache-jena-fuseki-3.17.0.zip
```

#### 1.1 Modificar el archivo shiro.ini
```bash
#Path
Cd: Fuseki/run/shiro.ini

#Copiar y pegar en la linea basic authentication user/password
/$/** = authcBasic,user[admin]
```
#### 2. Ejecutar Apache Jena Fuseki y cargar el archivo OntologíaBiblioteca.owl
```bash
#Comando Cmd
  cd C:\Fuseki> .\fuseki-server --update --mem /ds
```

<p align="center">
  <img src="https://raw.githubusercontent.com/CarlosOrtiz9901/ontology-library/main/Public/img1.png" width="700" alt="img" />
</p>
