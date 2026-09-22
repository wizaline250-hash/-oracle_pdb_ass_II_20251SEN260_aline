

Readme · MD
# Oracle PDB Management — Assignment II
 
**Course:** INSY 8311 – Database Development with PL/SQL
**Student:** Uwimana Aline
**Student ID:** 20251SEN260
**Group:** B
**Institution:** Adventist University of Central Africa (AUCA)
 
---
 
## 1. Overview
 
This repository documents the completion of Assignment II, which involved
creating, managing, and deleting Oracle Pluggable Databases (PDBs) within a
Container Database (CDB) environment, along with monitoring via Oracle
Enterprise Manager (OEM).
 
The assignment consisted of four tasks:
 
1. **Task 1** — Create a new Pluggable Database and a dedicated user account
   inside it, to be reused for future coursework.
2. **Task 2** — Create a temporary Pluggable Database, verify its existence,
   then delete it completely and confirm its removal.
3. **Task 3** — Monitor the database environment using OEM (Oracle
   Enterprise Manager) and capture the dashboard.
4. **Task 4** — Document the process and publish evidence to a public GitHub
   repository.
---
 
## 2. Oracle Environment Used
 
| Component            | Detail                              |
|-----------------------|--------------------------------------|
| Oracle Database       | Oracle Database 19c Enterprise Edition |
| Version               | 19.3.0.0.0                          |
| Interface             | SQL*Plus                            |
| Operating System      | Windows 10                          |
| Container Database    | ORCL (CDB$ROOT)                     |
 
---
 
## 3. Task Explanations
 
### Task 1 — Create a New Pluggable Database
 
A pluggable database named `uw_pdb_20251SEN260` was created under the
CDB$ROOT container, following the naming convention
`FirstTwoLettersOfFirstName_pdb_StudentID`. An administrator user,
`uwimana_plsqlauca_20251SEN260`, was created inside the PDB during PDB
creation. A `USERS` tablespace was configured as the default tablespace, and
the user was granted `CONNECT`, `RESOURCE`, and `DBA` privileges with an
unlimited quota on the tablespace. This account will be reused for all
future class work.
 
**Screenshots:** see `screenshots/pdb_creation/`
 
### Task 2 — Create and Delete a Temporary PDB
 
A temporary pluggable database named `uw_to_delete_pdb_20251SEN260` was
created, opened, and verified via `V$PDBS`. It was then closed with
`CLOSE IMMEDIATE` and removed using `DROP PLUGGABLE DATABASE ... INCLUDING
DATAFILES`. A final query against `V$PDBS` confirmed the PDB no longer
existed (no rows returned).
 
**Screenshots:** see `screenshots/pdb_deletion/`

 
### Task 4 — Documentation & Reporting
 
This README, along with the organized screenshot folders, constitutes the
final report for the assignment, published to a public GitHub repository as
required.
 
---
 
## 4. Challenges Faced and Solutions
 
| Challenge | Solution |
|---|---|
| `ORA-00922: missing or invalid option` when creating the PDB with a password containing `!` | Wrapped the password in double quotes (e.g. `IDENTIFIED BY "Uwimana_2025!"`) so SQL*Plus parsed it correctly. |
| `ORA-12154: TNS:could not resolve the connect identifier specified` when connecting to the new PDB | The PDB name was not registered as a TNS alias in `tnsnames.ora`. Resolved by connecting using the Easy Connect syntax instead: `user/"password"@host:port/service_name`. |
| `ORA-65011: Pluggable database ... does not exist` when trying to close/drop a PDB | The PDB had not actually been created yet in that session (name mismatch/typo). Verified the exact PDB name using `SHOW PDBS` before retrying. |
 
---
 
## 5. Integrity Statement
 
I confirm that all work shown in this repository — including commands
executed, screenshots captured, and this documentation — was performed and
written by me. No part of this submission was copied from another student.
I understand and uphold the principle that discipline, precision, and
integrity are non-negotiable in database administration work.
 
---
 
## 6. Submission Details
 
- **Repository Link:** `[[insert your GitHub repository URL here]](https://github.com/wizaline250-hash/-oracle_pdb_ass_II_20251SEN260_aline`
- **PDB Name Created:** `uw_pdb_20251SEN260`
- **Issues Encountered:** Yes — see "Challenges Faced and Solutions" above (all resolved)
---
 
## 7. Repository Structure
 
```
oracle_pdb_ass_II_20251SEN260_aline/
│
├── README.md
└── screenshots/
    ├── pdb_creation/
    ├── pdb_deletion/
```
 
