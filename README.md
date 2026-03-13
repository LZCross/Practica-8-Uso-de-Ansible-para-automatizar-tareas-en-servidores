# Práctica 8: Uso de Ansible para Automatizar Tareas en Servidores

[![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/)
[![Ansible](https://img.shields.io/badge/Ansible-000000?style=for-the-badge&logo=ansible&logoColor=white)](https://www.ansible.com/)
[![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)](https://ubuntu.com/)

## 📋 Descripción

Esta práctica demuestra el uso de **Ansible** para automatizar la configuración y gestión de múltiples servidores Linux. Se crean 5 servidores Ubuntu utilizando **Docker** como entorno de contenedores, y se ejecuta un playbook de Ansible para realizar tareas comunes de administración de sistemas de manera automatizada.

El proyecto ilustra conceptos clave de:
- Infraestructura como Código (IaC)
- Automatización de configuración
- Gestión de servidores remotos
- Contenerización con Docker

## ✨ Características

- ✅ Creación automática de 5 servidores Ubuntu con SSH configurado
- ✅ Usuario 'ansible' con privilegios sudo sin contraseña
- ✅ Playbook de Ansible para tareas de configuración
- ✅ Actualización de paquetes del sistema
- ✅ Creación de usuarios y directorios
- ✅ Instalación de aplicaciones (cowsay, htop)
- ✅ Arquitectura escalable y reproducible

## 🛠️ Requisitos Previos

Antes de ejecutar este proyecto, asegúrate de tener instalado:

- **Docker** (versión 20.10 o superior)
- **Docker Compose** (versión 2.0 o superior)
- **Git** (para clonar el repositorio)

### Verificación de Instalación

```bash
# Verificar Docker
docker --version
docker compose version

# Verificar Git
git --version
```

## 🚀 Instalación

1. **Clona el repositorio:**
   ```bash
   git clone https://github.com/LZCross/Practica-8-Uso-de-Ansible-para-automatizar-tareas-en-servidores.git
   cd Practica-8-Uso-de-Ansible-para-automatizar-tareas-en-servidores
   ```

2. **Construye y levanta los contenedores:**
   ```bash
   docker compose up -d
   ```

3. **Instala Ansible en el controlador:**
   ```bash
   docker exec ansible-controller apt update
   docker exec ansible-controller apt install -y ansible sshpass
   ```

## 📖 Uso

### Ejecutar el Playbook de Ansible

```bash
docker exec ansible-controller ansible-playbook playbook.yml
```

### Verificar la Configuración

Puedes verificar que las tareas se ejecutaron correctamente conectándote a cualquiera de los servidores:

```bash
# Conectar a server1
docker exec -it ubuntu-server1 bash

# Dentro del contenedor, verificar:
ls -la /home/itla/app/
cowsay "Hola Mundo"
htop --version
```

### Detener los Contenedores

```bash
docker compose down
```

## 🏗️ Arquitectura del Proyecto

```
.
├── Dockerfile              # Imagen base de Ubuntu con SSH
├── docker-compose.yml      # Definición de servicios Docker
├── inventario.ini          # Inventario de hosts para Ansible
├── ansible.cfg             # Configuración de Ansible
├── playbook.yml            # Playbook principal de Ansible
└── README.md               # Documentación del proyecto
```

### Servicios Docker

- **ansible-controller**: Contenedor con Ansible para ejecutar playbooks
- **ubuntu-server[1-5]**: 5 servidores Ubuntu idénticos con SSH

### Tareas del Playbook

1. **Actualización del Sistema**: Actualiza todos los paquetes APT
2. **Gestión de Usuarios**: Crea el usuario 'itla'
3. **Gestión de Archivos**: Crea directorio `/home/itla/app` y archivo `hola.txt`
4. **Instalación de Software**: Instala `cowsay` y `htop`

## 🔧 Configuración Avanzada

### Modificar el Número de Servidores

Edita `docker-compose.yml` para agregar o quitar servicios de servidor.

### Personalizar el Playbook

Modifica `playbook.yml` para agregar nuevas tareas de automatización.

### Cambiar Credenciales

Actualiza el usuario y contraseña en:
- `Dockerfile` (para el usuario ansible)
- `inventario.ini` (para la conexión SSH)

## 🤝 Contribución

Las contribuciones son bienvenidas. Para contribuir:

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo `LICENSE` para más detalles.

## 👤 Autor

**Lizander Cross**
- Matrícula: 2021-1754
- GitHub: [@LZCross](https://github.com/LZCross)

---

⭐ Si este proyecto te fue útil, ¡dale una estrella en GitHub!


