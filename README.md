# Columnar Transposition Cipher
Objective: Developing a message decryption and encryption program with a secret key (user-given or randomly generated) by precisely implementing the Columnar Transposition Cipher algorithm and developing the program to crack the already-encrypted message without a secret key using the brute force method.

# Part I of project (Encryption and Decryption):
1. Created 3 versions of text files that contains plain text of at least 400 characters long.
2. Loaded the plain text file into the memory and allowed user to select which text file to load and print on the console after the user chooses to encrypt or decrypt it.
3. Program can generate a random key ranging from 0 through 9 and A through Z with the key length being 5 to 10 characters as directed by the input of the user from the console.
4. The program encrypts and decrypts a message using a secret key that is either provided by the user or randomly generated.

Algorithm Explanation: To decipher the text, one has to calculate the length of the columns by dividing the length of the text by the length of the key. Then, the message is written once again in columns in orderly fashion. Finally, the columns are re-ordered by forming the key word again.

# Part II of project (Bruteforce):
1. Developed the program to crack the encrypted message in a hypothetical scenario when one has lost the secret key.
2. Used the brute force method on trying all possible secret keys in an efficient manner.
3. The program attempts to decrypt an encrypted message by approximating the secret key and finally asserts if the decrypted text matches the original plain text.
