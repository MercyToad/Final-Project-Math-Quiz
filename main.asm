; David Todd
; This program will give the user a 5 simple math problems that they will try to solve and will give them their score at the end
; Created Apr 16 2024
; Revised Apr 23 2024: Created welcome message, question, and answer data
; Revised Apr 30 2024: Displays the questions to the user
; Revised May 1 2024: Able to take in what the user inputs for each answer and displays if they are correct or not
; Revised May 4 2024: Able to restart the quiz if the user wants and displays the users total score back to them after each attempt



.386P												; indicates 8086 code of version 386
.model flat											; where extern references go (like C++'s #inlcude)


extern  _GetStdHandle@4:near
extern  _WriteConsoleA@20:near
extern  _ReadConsoleA@20:near
extern  _ExitProcess@4: near


.data

welcome			byte	"Welcome to my math quiz! Try your best to get all the questions correct!", 10, 0
qTemplate		byte	"What is ", 0
question1		byte	"42 + 56?", 10, 0
question2		byte	"105 - 79?", 10, 0
question3		byte	"14 x 9?", 10, 0
question4		byte	"76 / 19?", 10, 0
question5		byte	"15 x 8 - 17?", 10, 0
ans1            dword   98
ans2            dword   26
ans3            dword   126
ans4            dword   4
ans5            dword   103
corr			byte	"That is correct!", 10, 10, 0
incorr			byte	"That is incorrect.", 10, 10, 0
scorePrompt1    byte    "You got a score of",0
scorePrompt2    byte    "/5 correct!",10 , 0
correctCount	dword	0
tryAgain		byte	"Would you like to take the quiz again? Type Y for yes, anything else to exit: ", 0
doAgain			dword	?



outputHandle		dword   ?		                ; Storage the the handle for input and output. uninitslized
inputHandle			dword   ?						; will let user read from the console
written				dword   ?						; saves what the user writes in the console
readBuffer			byte	1024		DUP(00h)	; will hold what the user wrote
writeBuffer			byte	1024		DUP(00h)
numCharsToRead		dword	1024					; the amount of charaters still needed to be read
numCharsRead		dword	?						; the amount of charaters that have been read
wBIndex				dword	?
countDown			dword	?
count				dword	0

.code
main PROC near
_main:

    ;Displays the welcome message
    _Welcome:
        push    -11									
        call    _GetStdHandle@4	
        mov     outputHandle, eax					
        
        
        push    offset welcome
        call    countChars
        push    0
        push    offset written
        push    eax
        push    offset welcome
        mov     eax, offset welcome
        push	outputHandle
		call	_WriteConsoleA@20	



    ;This will display the questions to the user and recieve their answers to tell them if they are correct
    _MathQuiz:
        ;Displays and asks for the answer of the 1st question
        mov     correctCount, 0
	    _Question1:
            push    offset qTemplate
            call    countChars
            push    eax
            push    offset qTemplate
            call    writeLine

            push    offset question1
            call    countChars
            push    eax
            push    offset question1
            call    writeLine

            push	-10								
		    call	_GetStdHandle@4	
            mov     inputHandle, eax
            call    readline


            mov     eax, 0
            mov     ebx, 0
            mov     ecx, 0

        ;converts the user input so the program can compare it to ans1
        _getAns1:
            mov     bl, [readBuffer+ecx]
            cmp     bl, '9'
            jg      _checkAns1
            sub     bl, '0'
            cmp     bl, 0
            jl      _checkAns1
            mov     edx, 10
            mul     edx
            add     eax, ebx
            inc     ecx
            jmp     _getAns1

        _checkAns1:
            cmp     eax, ans1
            je      _CorrectDisplay1    
            call    displayIncorrAns
            jmp     _Question2
        _CorrectDisplay1:
            call    displayCorrAns 


        ;Displays and asks for the answer of the 2nd question
	    _Question2:
            push    offset qTemplate
            call    countChars
            push    eax
            push    offset qTemplate
            call    writeLine
            push    offset question2
            call    countChars
            push    eax
            push    offset question2
            call    writeLine

            push	-10								
		    call	_GetStdHandle@4	
            mov     inputHandle, eax
            call    readline


            mov     eax, 0
            mov     ebx, 0
            mov     ecx, 0

        ;converts the user input so the program can compare it to ans2
        _getAns2:
            mov     bl, [readBuffer+ecx]
            cmp     bl, '9'
            jg      _checkAns2
            sub     bl, '0'
            cmp     bl, 0
            jl      _checkAns2
            mov     edx, 10
            mul     edx
            add     eax, ebx
            inc     ecx
            jmp     _getAns2

        _checkAns2:
            cmp     eax, ans2
            je      _CorrectDisplay2    
            call    displayIncorrAns
            jmp     _Question3
        _CorrectDisplay2:
            call    displayCorrAns 


        ;Displays and asks for the answer of the 3rd question
	    _Question3:
            push    offset qTemplate
            call    countChars
            push    eax
            push    offset qTemplate
            call    writeLine

            push    offset question3
            call    countChars
            push    eax
            push    offset question3
            call    writeLine

            push	-10								
		    call	_GetStdHandle@4	
            mov     inputHandle, eax
            call    readline


            mov     eax, 0
            mov     ebx, 0
            mov     ecx, 0

        ;converts the user input so the program can compare it to ans3
        _getAns3:
            mov     bl, [readBuffer+ecx]
            cmp     bl, '9'
            jg      _checkAns3
            sub     bl, '0'
            cmp     bl, 0
            jl      _checkAns3
            mov     edx, 10
            mul     edx
            add     eax, ebx
            inc     ecx
            jmp     _getAns3

        _checkAns3:
            cmp     eax, ans3
            je      _CorrectDisplay3    
            call    displayIncorrAns
            jmp     _Question4
        _CorrectDisplay3:
            call    displayCorrAns 


        ;Displays and asks for the answer of the 4th question
	    _Question4:
            push    offset qTemplate
            call    countChars
            push    eax
            push    offset qTemplate
            call    writeLine

            push    offset question4
            call    countChars
            push    eax
            push    offset question4
            call    writeLine

            push	-10								
		    call	_GetStdHandle@4	
            mov     inputHandle, eax
            call    readline


            mov     eax, 0
            mov     ebx, 0
            mov     ecx, 0

        ;converts the user input so the program can compare it to ans4
        _getAns4:
            mov     bl, [readBuffer+ecx]
            cmp     bl, '9'
            jg      _checkAns4
            sub     bl, '0'
            cmp     bl, 0
            jl      _checkAns4
            mov     edx, 10
            mul     edx
            add     eax, ebx
            inc     ecx
            jmp     _getAns4

        _checkAns4:
            cmp     eax, ans4
            je      _CorrectDisplay4    
            call    displayIncorrAns
            jmp     _Question5
        _CorrectDisplay4:
            call    displayCorrAns 



        ;Displays and asks for the answer of the 5th question
	    _Question5:
            push    offset qTemplate
            call    countChars
            push    eax
            push    offset qTemplate
            call    writeLine

            push    offset question5
            call    countChars
            push    eax
            push    offset question5
            call    writeLine

            push	-10								
		    call	_GetStdHandle@4	
            mov     inputHandle, eax
            call    readline


            mov     eax, 0
            mov     ebx, 0
            mov     ecx, 0

        ;converts the user input so the program can compare it to ans5
        _getAns5:
            mov     bl, [readBuffer+ecx]
            cmp     bl, '9'
            jg      _checkAns5
            sub     bl, '0'
            cmp     bl, 0
            jl      _checkAns5
            mov     edx, 10
            mul     edx
            add     eax, ebx
            inc     ecx
            jmp     _getAns5

        _checkAns5:
            cmp     eax, ans5
            je      _CorrectDisplay5    
            call    displayIncorrAns
            jmp     _DisplayGrade
        _CorrectDisplay5:
            call    displayCorrAns 


    ;Displays what score the user got out of 5
    _DisplayGrade:
    call    displayScore
    
    ;Restarts the quiz if the user wants to
    _tryAgain:
        push    offset tryAgain
        call    countChars
        push    eax
        push    offset tryAgain
        call    writeLine
        
        push	-10								
		call	_GetStdHandle@4	
        mov     inputHandle, eax
        call    readline

        mov     eax, 0
        mov     ebx, 0
        mov     ecx, 0

    _getRetry:
        mov     bl, [readBuffer+ecx]
        cmp     bl, '9'
        jg      _confirmRetry
        sub     bl, '0'
        cmp     bl, 0
        jl      _confirmRetry
        mov     edx, 10
        mul     edx
        add     eax, ebx
        inc     ecx
        jmp     _getRetry
    
    _confirmRetry:
        cmp     bl, "Y"
        je      _MathQuiz
        cmp     bl, "y"
        je      _MathQuiz

    ;ends the program
    _exit:
	    push	5								
	    call	_ExitProcess@4	

main ENDP	




;displays when the user's answer is correct
displayCorrAns PROC near
_displayCorrAns:
    push    offset corr
    call    countChars
    push    eax
    push    offset corr
    call    writeLine
    inc     correctCount
    ret
displayCorrAns ENDP




;displays when the user's answer is incorrect
displayIncorrAns PROC near
_displayIncorrAns:
    push    offset incorr
    call    countChars
    push    eax
    push    offset incorr
    call    writeLine
    ret
displayIncorrAns ENDP




;displays what score the user got at the end of each attempt out of 5
displayScore PROC near
_displayScore:

    push    offset scorePrompt1
    call    countChars
    push    eax
    push    offset scorePrompt1
    call    writeLine

    ;push    offset correctCount
    ;call    countChars
    ;push    eax
    ;push    offset correctCount
    ;call    writeLine

    push    correctCount
    call    writeInt

    push    offset scorePrompt2
    call    countChars
    push    eax
    push    offset scorePrompt2
    call    writeLine
    ret
displayScore ENDP



;counts the amount of characters that are in the inputed string
countChars PROC near
_countChars:
    pop     edx                             ; Saves return address
    pop     ebx                             ; Saves address of string
    push    edx                             ; 
    mov     eax,0                           ; Set counter to 0
    mov     ecx,0                           ; Clears register
_counter:
    mov     cl,[ebx]                        ; Checks how long the string is 
    cmp     ecx,0                           ; Used to find the end of the string
    je      _endCounter
    inc     eax                             ; increases the count
    inc     ebx                             ; goes to the next character of the string
    jmp     _counter
_endCounter:
    ret
countChars  ENDP

;Displays the string to the consoleSaves return address
;EAX - Saves return address
;EBX -
;ECX -
;EDX - 
writeline PROC near
_writeline:
		pop		eax									; pops the top element of the stack into eax
		pop		edx									; pops the next top element of the stack into edx
		pop		ecx									; pops the next top element of the stack into ecx
		push	eax									; pushes the content of eax on top of the stack

        ; WriteConsole(handle, &msg[0], numCharsToWrite, &written, 0)
        push    0									; resets the amount of bytes
        push    offset written						; pushes address of what the user writes
        push    ecx									; return ecx to the stack for the call to _WriteConsoleA@20 (20 is how many bits are in the call stack)
        push    edx									; same as ecx, but for edx (previous line)
        push    outputHandle
        call    _WriteConsoleA@20
		ret											; Returns either "Your value: " or "You typed: ", which will be displayed
writeline ENDP										; ends writeline function


;reads the string from the console
readline PROC near
_readline: 
		; ReadConsole(handle, &buffer, numCharToRead, numCharsRead, null)
		push	0									;
		push	offset numCharsRead					; pushes the address of the amount of characters that have been read
		push	numCharsToRead						; pushes the amount of characters that still need to be read
		push	offset readBuffer					; pushes the address of readBuffer, which holds what ever the user wrote
		push	inputHandle							
		call	_ReadConsoleA@20					; Returns what is read from what the user wrote
		ret											; Returns the users data and displays it
readline ENDP										; ends readline funtion


; Convert number to string
; For all routines, the last item to be pushed on the stack is the return address, save it to a register
; then save any other expected parameters in registers, then restore the return address to the stack.
; Use of registers (important to document so they are not overwritten)
; EAX - Set with lower 32-bits of 64-bit dividend, after idiv holds the quotient
; EDX - Set with upper 32-bits of 64-bit dividend, after idiv holds the remainder
; EBX - used as divisor, safest to set each time before divide
; ECX - Last available general register. Used as index into buffer to be written.
writeInt PROC near
_writeInt:
            pop ebx                         ; Save the return address
            pop eax                         ; Save first number to convert in register EAX
            push ebx                        ; Restore return address, this frees up EBX for use here.
            mov count, 0                    ; Resets the count

    _convertLoop:
           ; Find the remainder and put on stack
           ; The choices are div for 8-bit division and idiv for 64-bit division. To use full registers, I had to use 64-bit division
           mov  edx, 0                      ; idiv starts with a 64-bit number in registers edx:eax, therefore I zero out edx.
           mov  ebx, 10                     ; Divide by 10.
           idiv ebx
           add  edx,'0'                     ; Make remainder into a character
           push edx                         ; Put in on the stack for printing this digit
           inc  count
           cmp  eax, 0
           jg   _convertLoop                ; Go back if there are more characters
           mov  wBIndex, offset writeBuffer
           mov  ebx, wBIndex
           mov  byte ptr [ebx], ' '         ; Add starting blank space
           inc  ebx                         ; Go to next byte location
           mov  ecx, count                  ; EBX is being reloading each divide, so I can use it here to
           mov  countDown, ecx              ; transfer value to set up counter to go through all numbers

    _fillString:
            pop     eax                     ; Remove the first stacked digit
            mov     [ebx], al                  ; Write it in the array
            dec     countDown
            inc     ebx                        ; Go to next byte location
            cmp     countDown, 0
            jg      _fillString
            mov     byte ptr[ebx], 0           ; Add end zero
            inc     count                      ; Take into account extra space
            push    count                      ; How many characters to print
            push    offset writeBuffer         ; And the buffer itself
            call    writeline

            ret                                 ; And return
writeInt ENDP

END