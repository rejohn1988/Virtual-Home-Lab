# Penetration Testing Lab

## Overview
Complete penetration testing environment using ESXi virtualization.

## Lab Infrastructure
- **Attack Platform**: Kali Linux (192.168.50.10)
- **Targets**: 
  - Windows Server 2019 DC (192.168.40.10)
  - Windows 10 Client (192.168.40.20)
  - Ubuntu Server (192.168.50.20)

## Lab Exercises

### 1. Network Reconnaissance
- Network discovery and port scanning
- Service enumeration and fingerprinting
- Operating system identification

### 2. Active Directory Testing
- Domain enumeration
- Kerberoasting attacks
- Privilege escalation scenarios

### 3. Web Application Security
- OWASP Top 10 testing
- SQL injection attacks
- Cross-site scripting (XSS)

### 4. Post-Exploitation
- Lateral movement techniques
- Persistence mechanisms
- Data exfiltration simulation

## ESXi Integration
- Use vSphere snapshots for lab reset
- Monitor resource usage during tests
- Isolate lab network for safe testing

## Tools and Scripts
- Custom scripts in /home/kali/lab-scripts/
- Standard Kali Linux toolkit
- Additional tools installed via setup script

This lab provides hands-on experience with real-world penetration testing techniques in a controlled ESXi 
environment.
