%include "../include/io.mac"

struc proc
    .pid: resw 1
    .prio: resb 1
    .time: resw 1
endstruc
extern printf
section .text

    global sort_procs

sort_procs:
    ;; DO NOT MODIFY
    enter 0,0
    pusha

    mov edx, [ebp + 8]      ; processes
    mov eax, [ebp + 12]     ; length
    ;; DO NOT MODIFY

    ;; Your code starts here
    xor edi, edi
    xor esi, esi
loop1_1:
    mov esi, edi
    add esi, 1
loop2_1:
    mov ebx, edi
    imul ebx, proc_size
    mov bl, byte [edx + ebx + proc.prio]
    mov ecx, esi
    imul ecx, proc_size
    mov cl, byte [edx + ecx + proc.prio]
    cmp bl, cl
    jg swap_1
go_back_swap_1:
    inc esi
    cmp esi, eax
    jl loop2_1
    inc edi
    mov ebx, eax
    sub ebx, 1
    cmp edi, ebx
    jl loop1_1
    jmp out1

swap_1:
    push eax
    ; swap each field
    ;swap the pid
    mov ebx, edi
    imul ebx, proc_size
    mov bx, [edx + ebx + proc.pid] ; get the values
    mov ecx, esi
    imul ecx, proc_size
    mov cx, [edx + ecx + proc.pid] ; get the values
    mov ax, bx ; swap the values
    mov bx, cx
    mov cx, ax
    mov eax, edi ; put the values back
    imul eax, proc_size
    mov word [edx + eax + proc.pid], bx
    mov eax, esi ; put the values back
    imul eax, proc_size
    mov word [edx + eax + proc.pid], cx


    ; swap the priority
    mov ebx, edi
    imul ebx, proc_size
    mov bl, byte [edx + ebx + proc.prio] ; get the values
    mov ecx, esi
    imul ecx, proc_size
    mov cl, byte [edx + ecx + proc.prio] ; get the values
    mov al, bl ; swap the values
    mov bl, cl
    mov cl, al
    mov eax, edi ; put the values back
    imul eax, proc_size
    mov byte [edx + eax + proc.prio], bl
    mov eax, esi ; put the values back
    imul eax, proc_size
    mov byte [edx + eax + proc.prio], cl


    ; swap the time
    mov ebx, edi
    imul ebx, proc_size
    mov bx, word [edx + ebx + proc.time] ; get the values
    mov ecx, esi
    imul ecx, proc_size
    mov cx, word [edx + ecx + proc.time] ; get the values
    mov ax, bx ; swap the values
    mov bx, cx
    mov cx, ax
    mov eax, edi ; put the values back
    imul eax, proc_size
    mov word [edx + eax + proc.time], bx
    mov eax, esi ; put the values back
    imul eax, proc_size
    mov word [edx + eax + proc.time], cx
    ; get the original eax back
    pop eax
    
    
    jmp go_back_swap_1

out1:

    ; sort for the time
    xor edi, edi
    xor esi, esi
loop1_2:
    mov esi, edi
    add esi, 1
loop2_2:
    mov ebx, edi
    imul ebx, proc_size
    mov bl, byte [edx + ebx + proc.prio]
    mov ecx, esi
    imul ecx, proc_size
    mov cl, byte [edx + ecx + proc.prio]
    cmp bl, cl
    jne go_back_swap_2
    mov ebx, edi
    imul ebx, proc_size
    mov bx, word [edx + ebx + proc.time]
    mov ecx, esi
    imul ecx, proc_size
    mov cx, word [edx + ecx + proc.time]
    cmp bx, cx
    jg swap_2
go_back_swap_2:
    inc esi
    cmp esi, eax
    jl loop2_2
    inc edi
    mov ebx, eax
    sub ebx, 1
    cmp edi, ebx
    jl loop1_2
    jmp out2

swap_2:
    push eax
    ; swap each field
    ;swap the pid
    mov ebx, edi
    imul ebx, proc_size
    mov bx, [edx + ebx + proc.pid] ; get the values
    mov ecx, esi
    imul ecx, proc_size
    mov cx, [edx + ecx + proc.pid] ; get the values
    mov ax, bx ; swap the values
    mov bx, cx
    mov cx, ax
    mov eax, edi ; put the values back
    imul eax, proc_size
    mov word [edx + eax + proc.pid], bx
    mov eax, esi ; put the values back
    imul eax, proc_size
    mov word [edx + eax + proc.pid], cx


    ; swap the priority
    mov ebx, edi
    imul ebx, proc_size
    mov bl, byte [edx + ebx + proc.prio] ; get the values
    mov ecx, esi
    imul ecx, proc_size
    mov cl, byte [edx + ecx + proc.prio] ; get the values
    mov al, bl ; swap the values
    mov bl, cl
    mov cl, al
    mov eax, edi ; put the values back
    imul eax, proc_size
    mov byte [edx + eax + proc.prio], bl
    mov eax, esi ; put the values back
    imul eax, proc_size
    mov byte [edx + eax + proc.prio], cl


    ; swap the time
    mov ebx, edi
    imul ebx, proc_size
    mov bx, word [edx + ebx + proc.time] ; get the values
    mov ecx, esi
    imul ecx, proc_size
    mov cx, word [edx + ecx + proc.time] ; get the values
    mov ax, bx ; swap the values
    mov bx, cx
    mov cx, ax
    mov eax, edi ; put the values back
    imul eax, proc_size
    mov word [edx + eax + proc.time], bx
    mov eax, esi ; put the values back
    imul eax, proc_size
    mov word [edx + eax + proc.time], cx
    ; get the original eax back
    pop eax
    
    
    jmp go_back_swap_2

out2:


    ; sort for the pid
    xor edi, edi
    xor esi, esi
loop1_3:
    mov esi, edi
    add esi, 1
loop2_3:
    mov ebx, edi
    imul ebx, proc_size
    mov bl, byte [edx + ebx + proc.prio]
    mov ecx, esi
    imul ecx, proc_size
    mov cl, byte [edx + ecx + proc.prio]
    cmp bl, cl
    jne go_back_swap_3
    mov ebx, edi
    imul ebx, proc_size
    mov bx, word [edx + ebx + proc.time]
    mov ecx, esi
    imul ecx, proc_size
    mov cx, word [edx + ecx + proc.time]
    cmp bx, cx
    jne go_back_swap_3
    mov ebx, edi
    imul ebx, proc_size
    mov bx, word [edx + ebx + proc.pid]
    mov ecx, esi
    imul ecx, proc_size
    mov cx, word [edx + ecx + proc.pid]
    cmp bx, cx
    jg swap_3
go_back_swap_3:
    inc esi
    cmp esi, eax
    jl loop2_3
    inc edi
    mov ebx, eax
    sub ebx, 1
    cmp edi, ebx
    jl loop1_3
    jmp out3

swap_3:
    push eax
    ; swap each field
    ;swap the pid
    mov ebx, edi
    imul ebx, proc_size
    mov bx, [edx + ebx + proc.pid] ; get the values
    mov ecx, esi
    imul ecx, proc_size
    mov cx, [edx + ecx + proc.pid] ; get the values
    mov ax, bx ; swap the values
    mov bx, cx
    mov cx, ax
    mov eax, edi ; put the values back
    imul eax, proc_size
    mov word [edx + eax + proc.pid], bx
    mov eax, esi ; put the values back
    imul eax, proc_size
    mov word [edx + eax + proc.pid], cx


    ; swap the priority
    mov ebx, edi
    imul ebx, proc_size
    mov bl, byte [edx + ebx + proc.prio] ; get the values
    mov ecx, esi
    imul ecx, proc_size
    mov cl, byte [edx + ecx + proc.prio] ; get the values
    mov al, bl ; swap the values
    mov bl, cl
    mov cl, al
    mov eax, edi ; put the values back
    imul eax, proc_size
    mov byte [edx + eax + proc.prio], bl
    mov eax, esi ; put the values back
    imul eax, proc_size
    mov byte [edx + eax + proc.prio], cl


    ; swap the time
    mov ebx, edi
    imul ebx, proc_size
    mov bx, word [edx + ebx + proc.time] ; get the values
    mov ecx, esi
    imul ecx, proc_size
    mov cx, word [edx + ecx + proc.time] ; get the values
    mov ax, bx ; swap the values
    mov bx, cx
    mov cx, ax
    mov eax, edi ; put the values back
    imul eax, proc_size
    mov word [edx + eax + proc.time], bx
    mov eax, esi ; put the values back
    imul eax, proc_size
    mov word [edx + eax + proc.time], cx
    ; get the original eax back
    pop eax
    
    
    jmp go_back_swap_3

out3:

    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY