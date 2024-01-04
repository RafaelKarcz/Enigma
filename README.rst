Enigma: File Management and Encryption Script
=============================================

Enigma is a Bash script designed for effective file management, offering functionalities to create, read, encrypt, and decrypt files. It balances ease of use with the security of AES-256 encryption.

Features
========

- **Create Text Files**: Allows users to create files with simple text content.
- **Read Text Files**: Users can read and display the contents of existing text files.
- **Encrypt and Decrypt Files**: Utilizes OpenSSL's AES-256-CBC encryption for secure file handling.
- **User-Friendly Menu Interface**: An intuitive menu guides the user through various functionalities.
- **Input Validation**: Ensures that file names and messages meet predefined formats for consistency and error mitigation.

Installation
============

To use Enigma, first clone the repository to your local machine:

.. code-block:: bash

    git clone https://github.com/RafaelKarcz/Enigma.git

Ensure that Bash and OpenSSL are installed on your system.

Usage
=====

Run the script to access the main menu, which includes the following options:

0. **Exit**: Exit the script.
1. **Create a File**: Create a new text file.
2. **Read a File**: Read the content of an existing file.
3. **Encrypt a File**: Encrypt a file securely.
4. **Decrypt a File**: Decrypt a previously encrypted file.

Select an option by entering the corresponding number.

Creating and Reading Files
==========================

To create a file, you'll be prompted to enter a filename and a message. Filenames are validated against `FILENAME_REGEX`, allowing only letters and dots. Messages must conform to `MESSAGE_REGEX`, permitting uppercase letters and spaces only.

Encrypting and Decrypting Files
===============================

The script's encryption and decryption functionalities leverage OpenSSL's AES-256-CBC mode. For encryption, the original file is replaced with an encrypted `.enc` file. During decryption, the `.enc` file is restored to its original format, and the encrypted file is removed.

Error Handling and Validation
=============================

Enigma includes validation checks for file existence when reading, encrypting, or decrypting files. It also validates user inputs for filenames and messages, providing feedback for invalid entries.

Contributing
============

I'm happy about any contributions to Enigma! If you have suggestions or improvements, feel free to fork the repository and submit a pull request with your changes. Your contributions could include bug fixes, new features, or improvements to the existing code.

Also, before making significant changes, it's always a good idea to open an issue in the GitHub repository to discuss your ideas with the community.

Please note that all contributions to this project should comply with the principles of the MIT license, under which this game is released.

License
=======

Enigma is MIT licensed. This means it is free software and comes with no warranty. You can use, modify, and distribute it under the terms of the MIT license. For more details, see the `LICENSE <LICENSE>`_ file.

Support
=======

For support, please open an issue in the GitHub repository, and I will try to address it as soon as possible.

Conclusion
==========

Enigma is a user-friendly and secure tool for managing files. Its straightforward interface, coupled with robust encryption, makes it suitable for those needing a simple solution for file encryption and basic file operations. Have fun with it. Cheers!
