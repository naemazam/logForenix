<p align="center">
  <img src="https://github.com/naemazam/logForenix/blob/main/img/log.png" alt="Logo" width="200">
</p>


# 🕵️ log Forenix🕵️

Welcome to log Forenix (Log + Forencis + Linux ) - Your Linux Forensic Artifacts Collector Tool! 🚀

## Description

Forenix is a powerful shell CLI tool designed to automate the collection of forensic artifacts in Linux systems. It streamlines data collection processes during incident response engagements, reducing dependency on remote tools/agents. With built-in functionality and simplicity, Forenix makes forensic artifact collection a breeze!


## Features

- Forenix collects the command history for both `regular users` and the `root user`. The `.bash_history file` contains a record of commands executed in the Bash shell, providing insights into user activities and potential malicious actions. This includes recurring commands or scripts set to run at specific intervals, which may indicate routine system maintenance or suspicious activities.
- Forenix captures network interface information using the `ifconfig` or `ip addr` commands. This includes details such as IP addresses, MAC addresses, and network configurations, helping investigators understand network connectivity and potential network-related security issues.
- Forenix gathers network connection information using the `netstat` command. This includes established connections, listening ports, and routing tables, providing visibility into active network connections and potential network-based attacks.
- Forenix retrieves a snapshot of running processes with detailed information using the `ps aux` command. This includes process IDs, CPU and memory usage, and associated users, aiding in identifying running applications, services, and potential malicious processes
- Forenix collects system log files located in the `/var/log` directory. These logs contain a wealth of information, including system events, error messages, and user activities, enabling forensic analysts to reconstruct system events and detect anomalies or security incidents.
- Forenix captures temporary file logs stored in the `/tmp` directory. Temporary files may contain valuable information related to user activities, program executions, or malware persistence, allowing investigators to analyze potential security breaches or unauthorized activities.

## Dependencies

- It Will Check Automatic and Install .. Relax

## How to Run

Sure, here are the steps formatted nicely in Markdown:

1. Clone this repository:
   ```bash
   git clone https://github.com/naemazam/logForenix.git
   ```

2. Navigate to the directory:
   ```bash
   cd logForenix
   ```

3. 📝 Copy `logForenix.sh` to your local machine.

4. 🔑 Grant execution permissions by executing

   ```bash
   chmod +x logForenix.sh
   ```

6. 🏃‍♂️ Run the script using the following command:

   ```bash
   sudo ./logForenix.sh
   ```

8. ⏳ Wait patiently until the script finishes collecting the logs.

9. 📦 Once completed, find the compressed logs in `/opt/` directory. dir named as <'hostname'>.tar.gz



## Testing Linux OS List

| Linux OS      | Support |
|---------------|---------|
| Ubuntu        | ✅      |
| Debian        | ✅      |
| CentOS        | ✅      |
| Fedora        | ✅      |
| Arch Linux    | ❌      |
| RHEL          | ✅      |
| OpenSUSE      | ✅      |

## Screenshots

[Add screenshots here if available]

## ⚠️ Warning:

Running Forenix on production systems without proper understanding and authorization may lead to unintended consequences, including data loss or system instability. Always ensure you have appropriate permissions and follow best practices when using Forenix or any other forensic tool in sensitive environments.

![Imag ](https://github.com/naemazam/logForenix/blob/main/img/IMG_6116.JPG)

## About the Author

Forenix is developed and maintained by [Naem Azam](https://github.com/naemazam). Connect with me on [LinkedIn](https://www.linkedin.com/in/your_profile) for any inquiries or collaboration opportunities.


## License

This project is licensed under the [MIT License](LICENSE).
