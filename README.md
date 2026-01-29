## Architecture Overview

- **Nginx** : Reverse proxy (public access, port 80)
- **Python HTTP Server** : Dummy backend (port 9000, internal only)
- **Node.js Docker App** : Containerized app (port 8000, internal only)
- **Domain access only** : `devops.local`

Backend **tidak dapat diakses langsung via public IP**, hanya melalui reverse proxy.

## Repository Structure

```text

|-- README.md
|-- build
|   |-- Dockerfile
|   `-- app
|       `-- index.js
|-- deploy.sh
|-- docker-app
|   |-- Dockerfile
|   `-- app
|       `-- index.js
|-- docs
|   `-- screenshots
|       |-- curl_domain.png
|       |-- curl_ip_public.png
|       |-- docker_ps.png
|       |-- docker_status.png
|       |-- gitstatus.png
|       |-- nginx_status.png
|       |-- task1-firewall_status.png
|       |-- task1-hosts.png
|       |-- task1-id_devopsuser.png
|       |-- task1-sshd_config.png
|       |-- task2-nginx_enable.png
|       |-- task2-nginx_reverse_proxy.png
|       |-- task2-nginx_test.png
|       |-- task2-port_pyhton.png
|       |-- task3-port_nodejs.png
|       |-- task4-first_run.png
|       `-- task4-second_run.png
|-- nginx
|   `-- devops.local.conf
`-- src
    `-- version.txt


================================================

### Task 1 Hardening Server
### Objective

Mengamankan server sebelum aplikasi dijalankan.

### Implementation

1. Membuat user non-root devopsuser
<img width="683" height="369" alt="task1- Id_devopsuser" src="https://github.com/user-attachments/assets/7eb57c33-eb13-4ecf-a827-847f031184c6" />

2. Nonaktifkan login SSH untuk root
<img width="228" height="155" alt="task1-sshd_config" src="https://github.com/user-attachments/assets/7d7c7b56-1b9e-4bdc-a1d8-bc7609528b7c" />

3. Enable firewall (UFW)
<img width="758" height="591" alt="task1-firewall_status" src="https://github.com/user-attachments/assets/29519565-e21e-4f37-9ae9-3b03faf33dc6" />

3. Add Domain devops.local
<img width="429" height="130" alt="task1-hosts" src="https://github.com/user-attachments/assets/012e1c0b-8f1f-4c89-9968-fa1ca5776120" />


==============================================

### TASK 2  Reverse Proxy & Dummy Backend
### Objective

Menggunakan Nginx sebagai reverse proxy agar backend tidak diekspos langsung.

### Implementation

1. Nginx Status
<img width="974" height="324" alt="Nginx Status" src="https://github.com/user-attachments/assets/9221d0bd-b81a-4555-809d-9e0b0868c366" />

2. Enable Configuration
<img width="493" height="116" alt="task2-nginx_enable" src="https://github.com/user-attachments/assets/e2e8929e-e79c-4dc0-84c6-e327f0f05557" />

3. Nginx Configuration
<img width="575" height="564" alt="task2-nginx_reverse_proxy" src="https://github.com/user-attachments/assets/84fd6215-5fb2-4e4c-ab7a-2f4a34b397c8" />

4. Result nginx configuration
<img width="556" height="46" alt="task2-nginx_test" src="https://github.com/user-attachments/assets/2a0143eb-95a5-4a61-8ed5-7243a62209aa" />

5. Python fowarding HTTP server  9000
<img width="756" height="39" alt="task2-port_pyhton" src="https://github.com/user-attachments/assets/bbdc57e8-6ca7-4f20-aa47-21d197e3ab9b" />

===========================================

### TASK 3  Dockerized Node.js Application
### Objective

Membuktikan Node.js app berjalan di Docker container, tidak dapat diakses langsung via public IP.

### Implementation
1. Docker Status
<img width="1343" height="450" alt="Docker Status" src="https://github.com/user-attachments/assets/a0b172c5-7ee0-4600-bef4-928d2560a1bf" />

2. Docker Container Running
<img width="895" height="79" alt="docker_ps" src="https://github.com/user-attachments/assets/1edfd875-a2f0-4076-a4eb-7d588b402f5b" />

3. Node.js listening port 8000
<img width="731" height="42" alt="task3-port_nodejs" src="https://github.com/user-attachments/assets/10918556-af38-40d2-b49d-1c8b72e7b9ba" />

4. Curl Accepted via Domain
<img width="475" height="272" alt="curl_domain" src="https://github.com/user-attachments/assets/c251c2a2-a72c-4414-a15c-59dfd6b2d05c" />

5. Curl Rejected via IP Public
<img width="662" height="220" alt="curl_ip_public" src="https://github.com/user-attachments/assets/e58d3981-0cc8-4bbc-8a2f-78a782fb37b1" />

==========================================

### TASK Manual CI/CD (deploy.sh)
### Objective![Uploading curl_ip_public.png…]()


Membuat pipeline deployment sederhana tanpa menggunakan tools CI/CD dan membuktikan script deploy.sh berjalan dan idempotent.

### Implementation

1. Script ./deploy.sh ini bersifat idempotent, dapat dijalankan berkali-kali tanpa error.

### Proof  First Run
<img width="1026" height="463" alt="task4-first_run" src="https://github.com/user-attachments/assets/730f966f-76d1-4aae-8c71-652b3aaa3f19" />

### Proof  Second Run
<img width="969" height="463" alt="task4-second_run" src="https://github.com/user-attachments/assets/0a69a396-a5ff-40a3-926d-6efc44b42e99" />

2. Docker Container Running
<img width="895" height="79" alt="docker_ps" src="https://github.com/user-attachments/assets/a7d5d389-90a2-44c7-ac92-d12453f4caf8" />

==========================================

# Conclusion

- Seluruh requirement pada technical test telah diimplementasikan dengan baik:

- Server aman

- Backend tidak terekspos langsung

- Aplikasi ter-containerize

- Deployment dapat diulang (idempotent)

- Dokumentasi lengkap dan terstruktur


