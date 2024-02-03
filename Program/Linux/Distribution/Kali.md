# kali

kali的安装、使用记录

## kali的一些默认账户密码

    https://www.kali.org/docs/introduction/default-credentials/
    Kali changed to a non-root user policy by default since the release of 2020.1.

    This means:

    During the installation of amd64 and i386 images, it will prompt you for a standard user account to be created.

    Any default operating system credentials used during Live Boot, or pre-created image (like Virtual Machines & ARM) will be:

    User: kali
    Password: kali
    Vagrant image (based on their policy):

        Username: vagrant
        Password: vagrant
        Amazon EC2:

        User: kali
        Password: <ssh key>
        Default Tool Credentials
        Some tools shipped with Kali, will use their own default hardcoded credentials (others will generate a new password the first time its used). The following tools have the default values:

        BeEF-XSS

        Username: beef
        Password: beef
        Configuration File: /etc/beef-xss/config.yaml
        MySQL

        User: root
        Password: (blank)
        Setup Program: mysql_secure_installation
        OpenVAS

        Username: admin
        Password: <Generated during setup>
        Setup Program: openvas-setup
        Metasploit-Framework

        Username: postgres
        Password: postgres
        Configuration File: /usr/share/metasploit-framework/config/database.yml
        PowerShell-Empire/Starkiller

        Username: empireadmin
        Password: password123
