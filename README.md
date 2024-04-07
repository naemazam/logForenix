<p align="center">
  <img src="https://github.com/naemazam/logForenix/blob/main/img/log.png" alt="Logo">
</p>

# 🕵️ log Forenix🕵️

Welcome to log Forenix - Your Linux Forensic Artifacts Collector Tool! 🚀

## Description

Forenix is a powerful shell CLI tool designed to automate the collection of forensic artifacts in Linux systems. It streamlines data collection processes during incident response engagements, reducing dependency on remote tools/agents. With built-in functionality and simplicity, Forenix makes forensic artifact collection a breeze!

## Features

- Automated collection of system artifacts Like Log
- Depend less on remote tools/agents
- Streamlined data collection process
- Built-in functionality for convenience
- Simplifies incident response engagements

## Dependencies

- net-tools - networking utilities for Linux

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

4. 🔑 Grant execution permissions by executing `chmod +x logForenix.sh`.

5. 🏃‍♂️ Run the script using the following command:
   ```bash
   sudo ./logForenix.sh
   ```

6. ⏳ Wait patiently until the script finishes collecting the logs.

7. 📦 Once completed, find the compressed logs in `/opt/` directory. dir named as <'hostname'>.tar.gz



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

## About the Author

Forenix is developed and maintained by [Naem Azam](https://github.com/naemazam). Connect with me on [LinkedIn](https://www.linkedin.com/in/your_profile) for any inquiries or collaboration opportunities.


## License

This project is licensed under the [MIT License](LICENSE).
