# 🛡️ Windows 10 STIG Remediation Scripts

A curated collection of PowerShell scripts that implement **Windows 10 Security Technical Implementation Guide (STIG)** remediations published by DISA. Each script targets a specific STIG ID, hardens the system according to DoD cybersecurity standards, and includes inline documentation for clarity and auditing.

> ⚙️ Built to assist system administrators, cybersecurity professionals, and compliance teams in automating secure baseline enforcement across Windows 10 environments.

---

## 📌 What Is This Repository?

This project contains standalone PowerShell scripts that:

- Enforce **DISA STIG** policies on Windows 10 systems
- Address specific findings from vulnerability assessments (e.g., SCAP scans)
- Include **documentation**, **script logic**, and **expected outcomes**
- Are version-controlled and auditable for use in production or lab hardening efforts

Each script targets one STIG ID and can be executed independently or grouped into remediation pipelines.

---

## 🧩 Sample STIG Remediations Included

| STIG ID            | Description                                                                 |
|--------------------|-----------------------------------------------------------------------------|
| `WN10-AC-000020`   | Enforces password history to remember 24 previous passwords                 |
| `WN10-CC-000035`   | Disables WDigest authentication to prevent credential dumping               |
| `WN10-SO-000250`   | Requires UAC elevation prompts on the secure desktop                        |
| `WN10-UR-000070`   | Denies network logon to Administrators and SYSTEM accounts                  |
| `WN10-CC-000310`   | Prevents users from modifying installation options via Windows Installer    |
| `WN10-CC-000355`   | Ensures WinRM does not store RunAs credentials                              |

More remediations are continuously being added.

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

Example:
```powershell
.\V-220711-disable-basic-auth-wdigest.ps1
