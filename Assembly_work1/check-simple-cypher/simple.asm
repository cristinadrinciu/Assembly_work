%include "../include/io.mac"

section .text
    global simple
    extern printf

simple:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     ecx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; plain
    mov     edi, [ebp + 16] ; enc_string
    mov     edx, [ebp + 20] ; step

    ;; DO NOT MODIFY
   
    ;; Your code starts here

    xor ebx, ebx
process_letter:
    mov al, byte [esi + ebx] ; take a byte from the input string
    cmp al, 0 ; if it does not exist
    je exit
    add al, dl ; add the step (shift)
    cmp al, 'Z' ; if it isn't a letter anymore
    jle atribute_to_output
    ; modify back to a letter
    sub al, 26 ; 26 letters in the alphabet

atribute_to_output:
    mov byte [edi + ebx], al ; put the letter in the output string
    inc ebx ; increase the step from the loop
    cmp ebx, ecx
    jle process_letter
exit:
    ;; Your code ends here
    
    ;; DO NOT MODIFY

    popa
    leave
    ret
    
    ;; DO NOT MODIFY
