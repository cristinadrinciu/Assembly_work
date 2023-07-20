%include "../include/io.mac"

section .data

extern printf
section .text
	global checkers

checkers:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]	; x
    mov ebx, [ebp + 12]	; y
    mov ecx, [ebp + 16] ; table

    ;; DO NOT MODIFY
    ;; FREESTYLE STARTS HERE
    xor edx, edx
initialize:
    mov dword [ecx + edx], 0
    inc edx
    cmp edx, 64
    jl initialize


    cmp eax, 7 ; compare to not go out of line
    je out1
    cmp ebx, 0 ; compare to not go out of line
    je out1
top_left_corner: ; [x + 1][y - 1]
    inc eax ; modify the  og coordinates
    dec ebx
    xor edx, edx
    lea edx, [ecx + 8 * eax] ; initialize edx with a vector/ column
    mov byte [edx + ebx], 1 ; go on the position y in the column
    dec eax
    inc ebx ; go back to the og coordinates
out1:

    cmp eax, 7
    je out2
    cmp ebx, 7
    je out2
top_right_corner: ; [x + 1][y + 1]
    inc eax ; modify the  og coordinates
    inc ebx
    xor edx, edx
    lea edx, [ecx + 8 * eax] ; initialize edx with a vector/ column
    mov byte [edx + ebx], 1 ; go on the position y in the column
    dec eax
    dec ebx ; go back to the og coordinates
out2:

    cmp eax, 0
    je out3
    cmp ebx, 0
    je out3
low_left_corner: ; [x - 1][y - 1]
    dec eax ; modify the  og coordinates
    dec ebx
    xor edx, edx
    lea edx, [ecx + 8 * eax] ; initialize edx with a vector/ column
    mov byte [edx + ebx], 1 ; go on the position y in the column
    inc eax
    inc ebx ; go back to the og coordinates
out3:

    cmp eax, 0
    je out4
    cmp ebx, 7
    je out4
low_right_corner: ; [x - 1][y + 1]
    dec eax ; modify the  og coordinates
    inc ebx
    xor edx, edx
    lea edx, [ecx + 8 * eax] ; initialize edx with a vector/ column
    mov byte [edx + ebx], 1 ; go on the position y in the column
    inc eax
    dec ebx ; go back to the og coordinates
out4:


    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY