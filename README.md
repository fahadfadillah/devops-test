## Architecture Overview

- **Nginx** : Reverse proxy (public access, port 80)
- **Python HTTP Server** : Dummy backend (port 9000, internal only)
- **Node.js Docker App** : Containerized app (port 8000, internal only)
- **Domain access only** : `devops.local`

Backend **tidak dapat diakses langsung via public IP**, hanya melalui reverse proxy.

---

## Repository Structure

```text

/opt/app
 |--âdeploy.sh
	â|-- src/
â    |-- version.txt
 |-- docker-app/
    â|-- Dockerfile
    â|-- app/
        â|-- index.js

================================================

### TASK 1  Server Hardening
###Objective

Mengamankan server sebelum aplikasi dijalankan.

### Implementation

Membuat user non-root

### Disable SSH login untuk root

Enable UFW firewall

==============================================

### TASK 2  Reverse Proxy & Dummy Backend
### Objective

Menggunakan Nginx sebagai reverse proxy agar backend tidak diekspos langsung.

### Implementation

Nginx listen di port 80

Python HTTP server di port 9000

Backend hanya bisa diakses melalui domain

Contoh konfigurasi:

===========================================

### TASK 3  Dockerized Node.js Application
### Objective

Menjalankan aplikasi Node.js dalam container Docker.

### Implementation

Menggunakan base image node:20-alpine

Aplikasi expose port 8000

Container berjalan menggunakan host network

Aplikasi tidak dapat diakses langsung dari public IP

Proof

==========================================

### ASK 4 â Manual CI/CD (deploy.sh)
### Objective

Membuat pipeline deployment sederhana tanpa menggunakan tools CI/CD.

### Implementation

Script deploy.sh melakukan:

Update source (dummy)

Build Docker image

Stop & remove container lama

Menjalankan container baru

Script ini bersifat idempotent, dapat dijalankan berkali-kali tanpa error.

### Proof  First Run
![Task4 First Run](docs/screenshots/task4_first_run.png)

### Proof  Second Run
![Task4 Second Run](docs/screenshots/task4_second_run.png)

==========================================

# Conclusion

- Seluruh requirement pada technical test telah diimplementasikan dengan baik:

- Server aman

- Backend tidak terekspos langsung

- Aplikasi ter-containerize

- Deployment dapat diulang (idempotent)

- Dokumentasi lengkap dan terstruktur


