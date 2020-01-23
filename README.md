# Columnar Transposition Cipher
Objective: Developed a message encryption and decryption program with a secret key implementing the Columnar Transposition Cipher algorithm and develop the program to crack the encrypted message without a secret key using the brute force method.

# Part I of project:
1. Created 3 versions of text files that contain a plain text message of at least 500 chars long
2. Loaded the plain text file into memory and allowed user to select which message text file to load and print on the console subsequently.
3. Program generates random secret key range from 0-9 with key length (5-10) as directed by user input from the system console.
4. The program encrypts and decrypts a message using a secret key that is either provided by the user or randomly generated.
Algorithm Explanation: To decipher it, the recipient has to work out the column lengths by dividing the message length by the key length. Then, write the message out in columns again, then re-order the columns by reforming the key word.

# Part II of project:
1. Developed the program to crack the encrypted message assuming one has lost the secret key.
2. Used the brute force method on trying all possible secret keys based on known secret key generation principle as explained in Part I.
3. The program attempts to decrypt the encrypted message by guessing the secret key and asserts if decrypted message matches the original plain text message.
