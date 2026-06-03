# 🛡️ Windows STIG Remediation Scripts

A curated collection of PowerShell scripts that implement **Windows Security Technical Implementation Guide (STIG)** remediations published by DISA. Each script targets a specific STIG ID, hardens the system according to DoD cybersecurity standards, and includes inline documentation for clarity and auditing.

> ⚙️ Built to assist system administrators, cybersecurity professionals, and compliance teams in automating secure baseline enforcement across Windows environments.

---

## 📌 What Is This Repository?

This project contains standalone PowerShell scripts that:

- Enforce **DISA STIG** policies on Windows 10/11 systems
- Address specific findings from vulnerability assessments (e.g., SCAP scans)
- Include **documentation**, **script logic**, and **expected outcomes**
- Are version-controlled and auditable for use in production or lab hardening efforts

Each script targets one STIG ID and can be executed independently or grouped into remediation pipelines.

---

## 🧩 Sample of the STIG Remediations Included

| STIG ID            | Description                                                                 |
|--------------------|-----------------------------------------------------------------------------|
| [WN11-CC-000315](https://github.com/jgdev-arc/stigs-windows10-remediation/blob/main/scripts/WN11-CC-000315.ps1)   | Disables Windows Installer elevated privilege installations                 |
| [WN11-CC-000090](https://github.com/jgdev-arc/stigs-windows10-remediation/blob/main/scripts/WN11-CC-000090.ps1)   | Forces Group Policy settings to reapply during refresh cycle                |
| [WN11-CC-000197](https://github.com/jgdev-arc/stigs-windows10-remediation/blob/main/scripts/WN11-CC-000197.ps1)   | Disables Microsoft consumer experiences and app suggestions                 |
| [WN11-CC-000285](https://github.com/jgdev-arc/stigs-windows10-remediation/blob/main/scripts/WN11-CC-000285.ps1)   | Requires secure RPC communication for Remote Desktop Services               |
| [WN11-00-000170](https://github.com/jgdev-arc/stigs-windows10-remediation/blob/main/scripts/WN11-00-000170.ps1)   | Disables the SMBv1 protocol on Windows SMB clients                          |
| [WN11-AU-000083](https://github.com/jgdev-arc/stigs-windows10-remediation/blob/main/scripts/WN11-AU-000083.ps1)   | Enables auditing of Other Object Access Events successes                    |

New remediations are added periodically. [You can view all of my completed STIGs here](https://github.com/jgdev-arc/stigs-windows10-remediation/tree/main/scripts).

---

## 🧠 Why This Matters

Implementing DISA STIGs is essential for:

- Reducing the attack surface
- Complying with DoD cybersecurity policies
- Enforcing secure configuration baselines in enterprise environments

This project helps **automate that process** using **PowerShell** and is suitable for use in:

- Security hardening workflows  
- Audit readiness checks  
- Cybersecurity portfolios  
- DevSecOps pipelines  

---

## 💼 Author

**Jonathan Gistand**  
[LinkedIn](https://linkedin.com/in/jgdev/) • [GitHub](https://github.com/jgdev-arc)

---

## 🚀 Usage

Each script is self-contained and can be executed directly in PowerShell (with administrator privileges).  
Scripts are named for traceability and mapped to their respective STIG IDs.

