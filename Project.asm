; Copyright (c) Mahamadsaad Sheikh, Taylor Wu, Kevin Lin
; Team Project (3 members)

INCLUDE irvine32.inc

.data
	msg0_1 BYTE 0Dh,0Ah,0Dh,0Ah
		   BYTE "********************************************",0Dh,0Ah
		   BYTE "  Columnar Transposition Cipher Encryption  ",0Dh,0Ah
		   BYTE "********************************************",0Dh,0Ah,0Dh,0Ah
		   BYTE "Please select from one of the following options:",0Dh,0Ah,0Dh,0Ah
		   BYTE "1. Encryption a text",0Dh,0Ah,0Dh,0Ah
           BYTE "2. Decryption a text",0Dh,0Ah,0Dh,0Ah
		   BYTE "3. Brute-force key guessing (please run encrypt the first text)",0Dh,0Ah
		   BYTE "     - Please run encryption on <US Constitution - 14th Amendment> in Option 1 first",0Dh,0Ah
		   BYTE "     - Due to the property of Columnar Transposition Cipher:",0Dh,0Ah
		   BYTE "          1. There are more than 1 keys that are able to decrypt.",0Dh,0Ah
		   BYTE "          2. Brute-force method will find the smallest key to decrypt.",0Dh,0Ah
		   BYTE "          3. Keys will appear as numbers.",0Dh,0Ah
		   BYTE "     - After it's done, use the cracked key in Option 2 to test it.",0Dh,0Ah,0Dh,0Ah
		   BYTE "0. Exit",0Dh,0Ah,0Dh,0Ah
		   BYTE "-> ",0
	msg0_2 BYTE 0Dh,0Ah,0Dh,0Ah,"Rerun? y/n ",0

;Part 1 Encryption
    msg1_0 BYTE 0Dh,0Ah,0Dh,0Ah,"Please enter the length of your key (5 to 10): ",0
	msg1_1 BYTE 0Dh,0Ah,0Dh,0Ah,"Does your key contain numbers (0-9)? y/n ",0	        ;10
	msg1_2 BYTE 0Dh,0Ah,0Dh,0Ah,"Does your key contain lowercase letters (a-z)? y/n ",0	;26
	msg1_3 BYTE 0Dh,0Ah,0Dh,0Ah,"Does your key contain uppercase letters (A-Z)? y/n ",0	;26
    msg1_4 BYTE 0Dh,0Ah,0Dh,0Ah,"Generated key: ",0
    msg1_5 BYTE 0Dh,0Ah,"Accept? y/n ",0
    msg1_6 BYTE 0Dh,0Ah,0Dh,0Ah
		   BYTE "---------------Encrypt A Text---------------",0Dh,0Ah
		   BYTE 0Dh,0Ah,0
	msg1_11 BYTE "Please select from the following texts:",0Dh,0Ah,0Dh,0Ah
		   BYTE "1. US Constitution - 14th Amendment",0Dh,0Ah,0Dh,0Ah
		   BYTE "2. Last section of <The Last Question>",0Dh,0Ah,0Dh,0Ah
		   BYTE "3. Lebron James the hypocrite",0Dh,0Ah,0Dh,0Ah
		   BYTE "0. Return",0Dh,0Ah,0Dh,0Ah
		   BYTE "-> ",0
    msg1_7 BYTE 0Dh,0Ah,0Dh,0Ah,"This is the original text:",0
    msg1_8 BYTE 0Dh,0Ah,0Dh,0Ah,"This is the encrypted text:",0
    msg1_9 BYTE 0Dh,0Ah,0Dh,0Ah,"Encrypted text saved to: encrypted_text.txt",0Dh,0Ah,0Dh,0Ah,0
	msg1_10 BYTE 0Dh,0Ah,0Dh,0Ah,"Enter your own key? y/n ",0

    err1_0 BYTE 0Dh,0Ah,0Dh,0Ah,"Invalid length!",0
    err1_1 BYTE 0Dh,0Ah,0Dh,0Ah,"Empty key!",0
    err1_2 BYTE 0Dh,0Ah,0Dh,0Ah,"Invalid selection!",0

;Part 2 Decryption
	msg2_0 BYTE 0Dh,0Ah,0Dh,0Ah
		   BYTE "---------------Decrypt A Text---------------",0Dh,0Ah		   
		   BYTE 0Dh,0Ah,0
	msg2_6 BYTE "[encrypted_text.txt loaded]",0Dh,0Ah,0Dh,0Ah,0
	msg2_5 BYTE "Please select from the following options:",0Dh,0Ah,0Dh,0Ah
		   BYTE "1. Decrypt using existing key from previous entries",0Dh,0Ah,0Dh,0Ah
		   BYTE "2. Enter a key",0Dh,0Ah,0Dh,0Ah
		   BYTE "0. Return",0Dh,0Ah,0Dh,0Ah
		   BYTE "-> ",0
	msg2_1 BYTE 0Dh,0Ah,0Dh,0Ah,"This is the decrypted text:",0
    msg2_2 BYTE 0Dh,0Ah,0Dh,0Ah,"Decrypted text saved to: decrypted_text.txt",0Dh,0Ah,0Dh,0Ah,0
	msg2_3 BYTE 0Dh,0Ah,"Please enter a key between 5 - 10 characters (uppercase/lowercase/numbers): ",0
	msg2_4 BYTE 0Dh,0Ah,"Key saved: ",0

	err2_0 BYTE 0Dh,0Ah,0Dh,0Ah
		   BYTE "Key is too short!",0Dh,0Ah,0

;Part 3 Brute Force
	msg3_0 BYTE 0Dh,0Ah,0Dh,0Ah
		   BYTE "---------------Brute Force---------------",0Dh,0Ah		   
		   BYTE 0Dh,0Ah,0
	msg3_1 BYTE "[Using <US Constitution - 14th Amendment> as Original Text]",0Dh,0Ah,0Dh,0Ah
		   BYTE "[encrypted_text.txt loaded as Encrypted Text]",0Dh,0Ah,0Dh,0Ah,0
	msg3_2 BYTE "                  _________       __[__]__                                   ",0Dh,0Ah
		   BYTE "                 |__|___|__|       (o_o )                                    ",0Dh,0Ah
		   BYTE "                 |____|____|         |     o   ___________________________   ",0Dh,0Ah
		   BYTE "         $$      |__|___|__|        /|\     O | I'm gonna break this wall |  ",0Dh,0Ah
		   BYTE "        $$$$     |____|____|       / | \      | and take the coins!!!     |  ",0Dh,0Ah
		   BYTE "       $$$$$$    |__|___|__|        / \       |___________________________|  ",0Dh,0Ah
		   BYTE "      $$$$$$$$   |____|____|       /   \                                     ",0Dh,0Ah
		   BYTE 0Dh,0Ah,"            THE BRUTE IS TRYING TO BREAK IN!!!!!!   ",0Dh,0Ah,0Dh,0Ah,0Dh,0Ah
		   BYTE "     - After it's done, use the cracked key in Option 2 to test it.",0Dh,0Ah,0Dh,0Ah,0

	msg3_3 BYTE 0Dh,0Ah,0Dh,0Ah
		   BYTE "We found the key: ",0Dh,0Ah,0

	



    fileNameE BYTE "encrypted_text.txt",0
	fileNameD BYTE "decrypted_text.txt",0
    fileName0 BYTE "01_amendment_14.txt",0
	fileName1 BYTE "02_the_last_question.txt",0
	fileName2 BYTE "03_lebron_the_hypocrite.txt",0
	fileNameBE BYTE "brute_etext.txt",0
	fileNameBD BYTE "brute_otext.txt",0

	textSize = 3000
    oText BYTE [textSize + 1] DUP (0)     ;storing the original text
	eText BYTE [textSize + 1] DUP (0)     ;storying encrypted text
	BoText BYTE [textSize + 1] DUP (0)
	BeText BYTE [textSize + 1] DUP (0)
	bytesRead DWORD ?						;how many byte read in
    bytesWritten DWORD ?
	fileHandle DWORD ?

	Bkey BYTE 10 DUP(?)
	BkeyLength DWORD ?
    key BYTE 10 DUP(?)          ;key stored in a char array
    keyLength DWORD ?
    keyType DWORD 0          	;0: empty, 1:numbers, 2:nums & lower, 3:nums & lower & upper
    base DWORD 0
	keyInput BYTE 11 DUP(?)
	Bcount DWORD 0

;macro to print a string
printStr MACRO buffer
    push edx
    mov edx,OFFSET buffer
    call WriteString
    pop edx
ENDM

.code
main PROC
    call Randomize
	mov eax,white+(black*16)
	call SetTextColor
    ;ask user to choose which part to run, in a loop
Start:
	call Clrscr
	printStr msg0_1
	mov eax,0
	call ReadInt
	cmp eax,1
	je O1
	cmp eax,2
	je O2
    cmp eax,3
    je O3
	cmp eax,8
	je O8
	cmp eax,0
	je Finish
O1:
	call option1
	jmp Start
O2:
	call option2
	jmp Start
O3:
    call option3

	
	jmp Start
O8:
	call Clrscr
	mov eax,black+(white*16)
	call SetTextColor
	mov eax,white+(black*16)
	call SetTextColor
	call WaitMsg
    jmp Start
Finish:
	call wipeText
	call wipeKey
	invoke ExitProcess,0
main ENDP

;----------------------------------------------------------
option1 PROC
;	Encryption: Pick a text, pick a key, encrypt it.
;	Input:		None
;	Output:		None
;	Require:	Irvine32.inc
;----------------------------------------------------------
O1Start:
	call Clrscr
	mov eax,red+(white*16)
	call SetTextColor
	printStr msg1_6
	mov eax,white+(black*16)
	call SetTextColor
	printStr msg1_11
	mov eax,0
	call ReadInt
	cmp eax,1
	je O1_1
	cmp eax,2
	je O1_2
    cmp eax,3
    je O1_3
	cmp eax,0
	je O1Return
O1_1:
	call wipeText
	push OFFSET oText
    push OFFSET fileName0
    call readText
    printStr msg1_7
    push OFFSET oText
    call printText
    call keyOption
    call encryptText
    printStr msg1_8
    push OFFSET eText
    call printText
	push OFFSET eText
	push OFFSET fileNameE
    call writeText
    printStr msg1_9
	jmp O1Finish
O1_2:
	call wipeText
	push OFFSET oText
    push OFFSET fileName1
    call readText
    printStr msg1_7
    push OFFSET  oText
    call printText
    call keyOption
    call encryptText
    printStr msg1_8
    push OFFSET eText
    call printText
	push OFFSET eText
	push OFFSET fileNameE
    call writeText
    printStr msg1_9
    jmp O1Finish
O1_3:
	call wipeText
	push OFFSET oText
    push OFFSET fileName2
    call readText
    printStr msg1_7
    push OFFSET  oText
    call printText
    call keyOption
    call encryptText
    printStr msg1_8
    push OFFSET eText
    call printText
	push OFFSET eText
	push OFFSET fileNameE
    call writeText
    printStr msg1_9
O1Finish:
	call WaitMsg
O1Return:
    ret
option1 ENDP

;----------------------------------------------------------
option2 PROC
;	Encryption: load encrypted_text.txt
;	Input:		None
;	Output:		None
;	Require:	Irvine32.inc
;----------------------------------------------------------
O2Start:
	call Clrscr
	mov eax,red+(white*16)
	call SetTextColor
	printStr msg2_0
	mov eax,white+(black*16)
	call SetTextColor
	printStr msg2_6
	lea edx,fileNameE
	call OpenInputFIle
	mov fileHandle,eax
	mov edx,OFFSET eText
	mov ecx,textSize
	call ReadFromFile
	mov bytesRead,eax
	mov eax,fileHandle
	call CloseFile

    printStr msg1_8
    push OFFSET eText
    call printText

	printStr msg2_5
	mov eax,0
	call ReadInt
	cmp eax,1
	je O2_1
	cmp eax,2
	je O2_2
	cmp eax,0
	je O2Return

O2_1:
	cmp keyLength,0
	ja goOn
	printStr err1_1
	jmp O2Finish
goOn:
	call decryptText
	printStr msg2_1
	push OFFSET oText
	call printText
	push OFFSET oText
	push OFFSET fileNameD
	call writeText
	printStr msg2_2
	jmp O2Finish
O2_2:
	call enterKey
	jmp O2_1
O2Finish:
	call WaitMsg
O2Return:
	ret
option2 ENDP

;----------------------------------------------------------
option3 PROC
;	Encryption: load encrypted_text.txt
;	Input:		None
;	Output:		None
;	Require:	Irvine32.inc
;----------------------------------------------------------
O3Start:
	call Clrscr
	mov eax,red+(white*16)
	call SetTextColor
	printStr msg3_0
	mov eax,white+(black*16)
	call SetTextColor

	push OFFSET BoText
	push OFFSET fileName0
	call readText

	push OFFSET eText
	push OFFSET fileNameE
	call readText

	printStr msg3_1
	printStr msg3_2

	call bruteForce
	call Crlf
	call Crlf


O3Finish:
	call WaitMsg
O3Return:
	ret
option3 ENDP

;----------------------------------------------------------
keyOption PROC
;	Ask user if he/she want to enter a key, or generate a key
;	Input:		None
;	Output:		None
;	Require:	Irvine32.inc
;----------------------------------------------------------
	printStr msg1_10
    call ReadChar
    cmp al,121
	je userEnterKey
	call pickKey
	jmp keyDone
userEnterKey:
	call enterKey
keyDone:
	ret
keyOption ENDP

;----------------------------------------------------------
enterKey PROC
;	Ask user to enter a key
;	Input:		key
;				keyInput
;				keyLength
;	Output:		key
;				keyLength
;	Require:	Irvine32.inc
;----------------------------------------------------------
Start:
	printStr msg2_3
	lea edx,keyInput
	mov ecx,11
	call ReadString
	cmp eax,4
	ja keyOkay
	printStr err2_0
	jmp Start
keyOkay:
	mov keyLength,eax
	mov eax,10
	sub eax,keyLength
	lea esi,key
	add esi,eax
	lea ebx,keyInput
	mov ecx,keyLength
copyKey:
	mov al,BYTE PTR [ebx]
	mov BYTE PTR [esi],al
	inc ebx
	inc esi
	loop copyKey
	printStr msg2_4
	call printKey
	ret
enterKey ENDP

;----------------------------------------------------------
pickKey PROC
;	
;	Input:		None
;	Output:		None
;	Require:	Irvine32.inc
;----------------------------------------------------------
Start:
    printStr msg1_0
    call ReadDec
    cmp eax,5
    jb InvalidLength
    cmp eax,10
    jbe Next
InvalidLength:
    printStr err1_0
    jmp Start
Next:
	mov keyLength,eax
L:
	mov keyType,0			;reset key info
    mov base,0
    printStr msg1_1
    call ReadChar
    cmp al,121
    jne N1
    xor keyType,1           ;key has 0-9
    add base,10
N1:
    printStr msg1_2
    call ReadChar
    cmp al,121
    jne N2
    xor keyType,2           ;key has a-z
    add base,26
N2:
    printStr msg1_3
    call ReadChar
    cmp al,121
    jne N3
    xor keyType,4           ;key has A-Z
    add base,26
N3:
    cmp keyType,0
    je emptyKey
N4:
    call generateKey
    printStr msg1_4
    call printKey
    printStr msg1_5
    call ReadChar
    cmp al,121
    je Done
    cmp al,110
    je N4
Done:
    ret
emptyKey:
    printStr err1_1
    jmp L
pickKey ENDP

;----------------------------------------------------------
generateKey PROC
;   Randomly generate a key with length 5-10,
;   contains 0-9 & a-z & A-Z
;   (10 + 26  + 26 = 62 unique characters)
;
;   Base on keyType, use different loops to generate random key
;	
;	Input:		key
;               keyLength
;               keyType
;               base
;	Output:		key
;	Require:	Irvine32.inc
;----------------------------------------------------------
    uniqueChar EQU DWORD PTR [ebp-4]
    push ebp
    mov ebp,esp
    sub esp,4           ;1 local DWORD

;   dec  bin     condition
;    0   0000    empty
;    1   0001    numbers
;    2   0010    lowercase
;    4   0100    uppercase
;eg: if user picks nums: xor keyType,1
;    then user picks uppercase: xor keyType,4

    mov ecx,keyLength
    mov esi,OFFSET key
    add esi,9

;decide which loop to use
    cmp keyType,7
    je L1
    cmp keyType,1
    je L1
    cmp keyType,5
    je L1
    cmp keyType,4
    je L2
    cmp keyType,6
    je L2
    cmp keyType,2
    je L3
    cmp keyType,3
    je L3

;loop for all chars, 0-9 only, or 0-9 & uppercase (b = 62)
;0-9:   0-9   +48
;10-35: A-Z   +55
;36-61: a-z   +61
L1:
    mov eax,base
    call RandomRange
    cmp al,9
    ja  alphabets 
    add al,48
    jmp Next1

alphabets:
    cmp al,35
    ja lowercase1
    add al,55
    jmp Next1

lowercase1:
    add al,61

Next1:
    mov BYTE PTR [esi],al
    dec esi
    loop L1

    jmp Finish

;loop for uppercase only, lower & upper (b = 52)
;0-25: A-Z    +65
;26-51: a-z   +71
L2:
    mov eax,base
    call RandomRange
    cmp al,25
    ja  lowercase2 
    add al,65
    jmp Next2

lowercase2:
    add al,71

Next2:
    mov BYTE PTR [esi],al
    dec esi
    loop L2

    jmp Finish

;loop for lower only, lower & 0-9  (b = 36)
;0-25:   a-z   +97
;25-35:  0-9   +23
L3:
    mov eax,base
    call RandomRange
    cmp al,25
    ja  numbers 
    add al,97
    jmp Next3

numbers:
    add al,23

Next3:
    mov BYTE PTR [esi],al
    dec esi
    loop L3

Finish:
    mov esp,ebp
    pop ebp
    ret
generateKey ENDP

;----------------------------------------------------------
printKey PROC
;	
;	Input:		None
;	Output:		None
;	Require:	Irvine32.inc
;----------------------------------------------------------
    mov ebx,10
    sub ebx,keyLength
    mov esi,OFFSET key
    add esi,ebx
    mov ecx,keyLength
printLoop:
    mov al,BYTE PTR [esi]
    call WriteChar
    add esi,1
    loop printLoop
    ret
printKey ENDP

;----------------------------------------------------------
encryptText PROC
;	Use Columnar Transposition Cipher algorithm to encrypt
;	
;	Input:		oText
;               eText
;               key
;               keyLength
;               bytesRead
;	Output:		eText
;	Require:	Irvine32.inc
;----------------------------------------------------------
    oTextEnd EQU DWORD PTR [ebp-4]
    rowCount EQU DWORD PTR [ebp-8]
    padCount EQU DWORD PTR [ebp-12]
    keyPTR EQU DWORD PTR [ebp-16]       ;address to start of key
    col0 EQU DWORD PTR [ebp-20]        ;address to col0
    col1 EQU DWORD PTR [ebp-24] 
    col2 EQU DWORD PTR [ebp-28] 
    col3 EQU DWORD PTR [ebp-32] 
    col4 EQU DWORD PTR [ebp-36] 
    col5 EQU DWORD PTR [ebp-40] 
    col6 EQU DWORD PTR [ebp-44] 
    col7 EQU DWORD PTR [ebp-48] 
    col8 EQU DWORD PTR [ebp-52] 
    col9 EQU DWORD PTR [ebp-56]
    cOrder0 EQU DWORD PTR [ebp-60]
    count EQU DWORD PTR [ebp-100]
    lower EQU BYTE PTR [ebp-104]
    upper EQU BYTE PTR [ebp-108]
    index EQU DWORD PTR [ebp-112]
    temp1 EQU DWORD PTR [ebp-116]

    pad = '_'
    push ebp
    mov ebp,esp
    sub esp,116           ;29 local DWORDs

;wipe local variables
	mov ecx,29
	mov esi,ebp
wipe:
	mov DWORD PTR [esi],0
	sub esi,4
	loop wipe

;get oTextEnd
;    mov eax,SIZEOF oText
;    mov esi,OFFSET oText
;    mov oTextEnd,esi
;    add oTextEnd,eax
;    dec oTextEnd                ;address of last char in oText

;calculate rowCount & padCount at the end of the oText
	mov edx,0
	mov eax,bytesRead  
	mov ecx,keyLength
	div ecx
	cmp edx,0
	ja Padding
	mov padCount,0
	mov rowCount,eax
	jmp NoPadding

Padding:
	sub ecx,edx
	mov padCount,ecx
	inc eax
	mov rowCount,eax

NoPadding:

;get keyPTR
	mov esi,OFFSET key
	mov eax,10
	sub eax,keyLength
	add esi,eax
	mov keyPTR,esi

	; mov eax,bytesRead
	; call WriteDec
	; call Crlf
	; mov eax,rowCount
	; call WriteDec
	; call Crlf
	; mov eax,padCount
	; call WriteDec
	; call Crlf

comment !
method 1:
1. determine the starting address of each column
2. determine the index modifier (order) of each column
        eg: HACK - > 3,1,2,4
3. go through the oText once:
        a)each byte has its own index modifier
        b)use the index modifier to determine which column to write
        c)write the byte to column and increase column offset by 1
!

;break up the encrypted eText into columns
;store address for each column in col0 - col9
	mov ecx,keyLength
	mov eax,OFFSET eText
	mov esi,ebp				;col0
	sub esi,20
colLoop:
	mov DWORD PTR [esi],eax
	add eax,rowCount
	sub esi,4
	loop colLoop

;go through the index modifiers and sort them
;loop through the key
;pick the lowest value each iteartion,assign order in column orders

;for each char:
;	1. if column order > 0, skip to next char
;	2. if char < lower, set char to upper

;macro to get column order address based on index
goCol MACRO
	push eax
	push edx
	mov esi,ebp			;cOrder0
	sub esi,60
	mov eax,index
	mov edx,4
	mul edx
	sub esi,eax
	pop edx
	pop eax
ENDM

	mov lower,123
	mov ecx,keyLength
	mov count,1
sortL1:
	push ecx
	mov lower,123
	mov ecx,keyLength
	mov edi,keyPTR					;keyPTR
	mov index,0					;current key position
	sortL2:
		;check if column order is empty
		goCol                          ;go to current column order
		cmp DWORD PTR [esi],0
		ja nextChar                     ;this char already has an order

		mov al,lower
		cmp BYTE PTR [edi],al
		jb foundLower
		jmp nextChar

	foundLower:
		mov al,BYTE PTR [edi]
		mov lower,al                    ;store the new lowest ascii
		goCol                           ;go to current column order
		mov temp1,esi                   ;remember the current column

	nextChar:
		inc index
		inc edi

	continue:
		loop sortL2

	;mov count to the column
	mov eax,count
	mov esi,temp1
	mov DWORD PTR [esi],eax

	pop ecx
	inc count
	loop sortL1

;comment !
;Testing column order sorting
	call Crlf
	call Crlf
	mov ecx,keyLength
	mov esi,ebp			;cOrder0
	sub esi,60
testL1:
	mov eax,DWORD PTR [esi]
	call WriteDec
	mov al,' '
	call WriteChar
	sub esi,4
	loop testL1
	call Crlf
	call Crlf
;!

comment !

Example:
	key =    H A C K K A
	order =  4 1 3 5 6 2
	keyLength = 6

	oText:
		"I didn't buy anything this Black Friday because I don't have any money. "
		 413562413562413562413562413562413562413562413562413562413562413562413562
!

    mov esi,OFFSET oText
	mov edi,ebp
	sub edi,60			;cOrder0
	mov ecx,1
readoText:
	mov edx,ebp                     ;col0
	sub edx,20
	mov bl,BYTE PTR [esi]
	cmp bl,0
	je endOfoText

	cmp ecx,keyLength
	ja Reorder
	jmp writeeText

Reorder:
	mov ecx,1
	mov edi,ebp
	sub edi,60			;cOrder0

writeeText:
	mov eax,DWORD PTR [edi]         ;get order
	dec eax                         ;change start of order to 0
	push edx
	mov edx,4
	mul edx                         ;order * 4 = correct column
	pop edx

	sub edx,eax                     ;go to the correct column
	mov eax,DWORD PTR [edx]         ;address to the position in eText
	mov BYTE PTR [eax],bl
	inc eax                         ;point to the next empty location in eText
	mov DWORD PTR [edx],eax         ;update column address

	sub edi,4                       ;next order number
	inc esi                         ;next char in oText
	inc ecx                         ;keyLength counter

	jmp readoText

endOfoText:

comment !
;add padding to eText
	cmp padCount,0
	je encryptionDone

    mov ecx,padCount
    lea ebx,col0
    mov eax,keyLength
	dec eax
    mov edx,4
    mul edx
    sub ebx,eax						;go to the last column pointer
addPaddingToEText:
    mov esi,DWORD PTR [ebx]			;go to the last column in eText
    mov BYTE PTR [esi],pad
    add ebx,4						;move to previous column pointer
    loop addPaddingToEText

;add padding to end of oText
	mov esi,OFFSET oText
	add esi,bytesRead
	mov ecx,padCount
addPaddingToOText:
	mov BYTE PTR [esi],pad
	inc esi
	loop addPaddingToOText

;add padCount to bytesRead
	mov eax,bytesRead
	add eax,padCount
	mov bytesRead,eax
!

;add padding to eText
	cmp padCount,0
	je encryptionDone
	mov ecx,bytesRead
	add ecx,padCount
	mov bytesRead,ecx
	mov esi,OFFSET oText
	mov ebx,OFFSET eText
addPads:
	cmp BYTE PTR [esi],0
	je oPad
	jmp nextPart
	oPad:
		mov BYTE PTR [esi],pad

nextPart:
	cmp BYTE PTR [ebx],0
	je ePad
	jmp nextPad
	ePad:
		mov BYTE PTR [ebx],pad
		jmp nextPad
	nextpad:
		inc esi
		inc ebx
		loop addPads

encryptionDone:
    mov esp,ebp
    pop ebp
    ret
encryptText ENDP

;----------------------------------------------------------
decryptText PROC
;	Decrypt using Columnar Transposition Cipher algorithm
;	
;	Input:		oText
;               eText
;               key
;               keyLength
;               bytesRead
;	Output:		eText
;	Require:	Irvine32.inc
;----------------------------------------------------------
    oTextEnd EQU DWORD PTR [ebp-4]
    rowCount EQU DWORD PTR [ebp-8]
    padCount EQU DWORD PTR [ebp-12]
    keyPTR EQU DWORD PTR [ebp-16]       ;address to start of key
    col0 EQU DWORD PTR [ebp-20]        ;address to col0
    col1 EQU DWORD PTR [ebp-24] 
    col2 EQU DWORD PTR [ebp-28] 
    col3 EQU DWORD PTR [ebp-32] 
    col4 EQU DWORD PTR [ebp-36] 
    col5 EQU DWORD PTR [ebp-40] 
    col6 EQU DWORD PTR [ebp-44] 
    col7 EQU DWORD PTR [ebp-48] 
    col8 EQU DWORD PTR [ebp-52] 
    col9 EQU DWORD PTR [ebp-56]
    cOrder0 EQU DWORD PTR [ebp-60]
    count EQU DWORD PTR [ebp-100]
    lower EQU BYTE PTR [ebp-104]
    upper EQU BYTE PTR [ebp-108]
    index EQU DWORD PTR [ebp-112]
    temp1 EQU DWORD PTR [ebp-116]

    push ebp
    mov ebp,esp
    sub esp,116           ;29 local DWORDs

;wipe local variables
	mov ecx,29
	lea esi,oTextEnd
wipe:
	mov DWORD PTR [esi],0
	sub esi,4
	loop wipe

;calculate rowCount & padCount at the end of the oText
	mov edx,0
	mov eax,bytesRead  
	mov ecx,keyLength
	div ecx
	cmp edx,0
	ja Padding
	mov padCount,0
	mov rowCount,eax
	jmp NoPadding

Padding:
	sub ecx,edx
	mov padCount,ecx
	inc eax
	mov rowCount,eax

NoPadding:

;get keyPTR
	mov esi,OFFSET key
	mov eax,10
	sub eax,keyLength
	add esi,eax
	mov keyPTR,esi

	; mov eax,bytesRead
	; call WriteDec
	; call Crlf
	; mov eax,rowCount
	; call WriteDec
	; call Crlf
	; mov eax,padCount
	; call WriteDec
	; call Crlf

;break up the encrypted eText into columns
;store address for each column in col0 - col9
	mov ecx,keyLength
	mov eax,OFFSET eText
	mov esi,ebp				;col0
	sub esi,20
colLoop:
	mov DWORD PTR [esi],eax
	add eax,rowCount
	sub esi,4
	loop colLoop

;macro to get column order address based on index
goCol MACRO
	push eax
	push edx
	mov esi,ebp				;cOrder0
	sub esi,60
	mov eax,index
	mov edx,4
	mul edx
	sub esi,eax
	pop edx
	pop eax
ENDM

	mov lower,123
	mov ecx,keyLength
	mov count,1
sortL1:
	push ecx
	mov lower,123
	mov ecx,keyLength
	mov edi,keyPTR						;keyPTR
	mov index,0							;current key position
	sortL2:
		;check if column order is empty
		goCol							;go to current column order
		cmp DWORD PTR [esi],0
		ja nextChar                     ;this char already has an order

		mov al,lower
		cmp BYTE PTR [edi],al
		jb foundLower
		jmp nextChar

	foundLower:
		mov al,BYTE PTR [edi]
		mov lower,al                    ;store the new lowest ascii
		goCol                           ;go to current column order
		mov temp1,esi                   ;remember the current column

	nextChar:
		inc index
		inc edi

	continue:
		loop sortL2

	;mov count to the column
	mov eax,count
	mov esi,temp1
	mov DWORD PTR [esi],eax

	pop ecx
	inc count
	loop sortL1

comment !
Example:
	key =    H A C K K A
	order =  4 1 3 5 6 2
	keyLength = 6

	Encryption:
		"I did not buy anything this Black Friday because I do not have any money"
		 413562413562413562413562413562413562413562413562413562413562413562413562

	Decryption:  rowCount = 72 / 6 = 12
		" O IICDCIOEM UTTLRBE AYYDTANSKAA T OINYHHAIE NV I NG  YUD ANDBY BF SOHNE"
		 <-  col 1 -><-  col 2 -><-  col 3 -><-  col 4 -><-  col 5 -><-  col 6 ->

		 1st row: 413562 -> take 1st character from each column -> "I_DID_"
		 2nd row: 413562 -> take 2nd character from each column -> "NOT_BU"
		 3rd row: same ...
!

;esi  -> oText		edi  -> order		edx  -> column
	mov count,1
	lea esi,oText
	lea edi,cOrder0
	mov ecx,1

readeText:
	mov eax,count
	cmp eax,bytesRead
	ja endOfeText
	lea edx,col0
	cmp ecx,keyLength
	ja Reorder
	jmp writeoText

Reorder:
	mov ecx,1
	lea edi,cOrder0
writeoText:
	mov eax,DWORD PTR [edi]
	dec eax
	push edx
	mov edx,4
	mul edx
	pop edx
	sub edx,eax                     ;go to the correct column
	mov eax,DWORD PTR [edx]         ;address to the position in eText
	mov bl,BYTE PTR [eax]           ;get the character
	mov BYTE PTR[esi],bl            ;write to oText
	inc eax                         ;point to the next char in column
	mov DWORD PTR [edx],eax         ;update column address

	sub edi,4                       ;next order number
	inc esi                         ;next char in oText
	inc ecx                         ;keyLength counter
	inc count
	jmp readeText

endOfeText:
    mov esp,ebp
    pop ebp
    ret
decryptText ENDP

;--------------------------------
bruteForce PROC
;
;	
;	Input:		None
;	Output:		None
;	Require:	Irvine32.inc
;----------------------------------------------------------
	PTRBkey EQU DWORD PTR [ebp-8]
	push ebp
    mov ebp,esp
    sub esp,8           ;2 local DWORD

	mov ecx,10
	mov BkeyLength,ecx
    mov PTRBkey,OFFSET Bkey
    add PTRBkey,9

fillBkey:
	mov esi,DWORD PTR [PTRBkey]
    mov BYTE PTR [esi],48
    dec PTRBkey
	loop fillBkey

;generate key from 10000, +1 at a time
	mov Bcount,10000
serialKeyGen:
	mov esi,OFFSET Bkey
    add esi,9
	inc Bcount
	mov eax,Bcount
	mov ebx,10
	mov ecx,10
;convert integer key to string key
toStr:
	mov edx,0
	div ebx
	add edx,48
	mov BYTE PTR [esi],dl
	dec esi
	loop toStr

	;testing, just comparing to 12345
	;cmp Bcount,12345
	;je foundKey
	;jmp serialKeyGen

;copy Bkey to key
	mov ecx,10
	mov esi,OFFSET key
	mov edi,OFFSET Bkey
copyKey:
	mov al,BYTE PTR [edi]
	mov BYTE PTR [esi],al
	inc esi
	inc edi
	loop copyKey

;calculate keyLength
	mov keyLength,5
	cmp Bcount,999999999
	ja @10
	cmp Bcount,99999999
	ja @9
	cmp Bcount,9999999
	ja @8
	cmp Bcount,999999
	ja @7
	cmp Bcount,99999
	ja @6
	jmp check
@10:
	mov keyLength,10
	jmp Check
@9:
	mov keyLength,9
	jmp Check
@8:
	mov keyLength,8
	jmp Check
@7:
	mov keyLength,7
	jmp Check
@6:
	mov keyLength,6

;check if key is correct by decryption	
Check:
	call decryptText
	mov ebx,0
	lea esi,oText
	lea edi,BoText
	mov al,0				;comparison score, 0 = match
	mov ecx,10				;only checking the first 20 characters
LoopOne:
	add al,BYTE PTR [esi]	;move ascii code from BoText
	sub al,BYTE PTR [edi]	;if BoText = BeText, al = 0 here
	cmp al,0
	je Same
	inc ebx
Same:
	inc esi
	inc edi
	loop LoopOne

	cmp ebx,0
	je foundKey				;al = 0 means BoText = BeText for all 20 characters
	jmp serialKeyGen				;al != 0, we need to guess key again

foundKey:
	printStr msg3_3

    mov ebx,10
    sub ebx,keyLength
    mov esi,OFFSET Bkey
    add esi,ebx
    mov ecx,keyLength
printLoop:
    mov al,BYTE PTR [esi]
	inc al
    call WriteChar
    add esi,1
    loop printLoop

	mov esp,ebp
    pop ebp
	ret
bruteForce ENDP


;function to open a text file and read it to oText
;experiment with passing by reference
;just need to do [push OFFSET <your text>] before calling this proc
readText PROC
    push ebp
    mov ebp,esp
    mov edx,[ebp + 8]           ;pass by reference
	call OpenInputFIle
	mov fileHandle,eax
	mov edx,[ebp + 12]
	mov ecx,textSize
	call ReadFromFile
	mov bytesRead,eax
	mov eax,fileHandle
	call CloseFile
    pop ebp
    ret 8						;only pass 1 DWORD
readText ENDP

;push source and then destination file name
writeText PROC
    push ebp
    mov ebp,esp
    mov edx,[ebp + 8] 
	call CreateOutputFile
	mov fileHandle, eax
	mov edx,[ebp + 12]
	mov ecx,bytesRead
	call WriteToFile
	mov eax, fileHandle
	call CloseFile
    pop ebp
    ret 8						;passed 2 DWORDs
writeText ENDP

;function to print a text
;just need to do [push OFFSET <your text>]  before calling this proc
printText PROC
    push ebp
    mov ebp,esp
    mov esi,[ebp + 8]           ;pass by reference
	mov ecx,bytesRead
    call Crlf
    call Crlf
    call Crlf
printIt:
	mov al,BYTE PTR [esi]
	call WriteChar
	inc esi
	loop printIt
    call Crlf
    call Crlf
    call Crlf
    pop ebp
    ret 4
printText ENDP

;wipe oText and eText
wipeText PROC
	cmp bytesRead,0
	je nothing2Wipe
	mov ecx,bytesRead
	mov esi,OFFSET oText
	mov ebx,OFFSET eText
clean:
	mov BYTE PTR [esi],0
	mov BYTE PTR [ebx],0
	inc esi
	inc ebx
	loop clean
nothing2Wipe:
	mov ecx,0
	mov esi,0
	mov ebx,0
	ret
wipeText ENDP

;wipe key and related memory locations
wipeKey PROC
	mov keyLength,0
	mov keyType,0
	mov ecx,10
	lea esi,key
	lea ebx,keyInput
WKL:
	mov BYTE PTR [esi],0
	mov BYTE PTR [ebx],0
	inc esi
	inc ebx
	loop WKL
	mov esi,0
	mov ebx,0
	ret
wipeKey ENDP
end main