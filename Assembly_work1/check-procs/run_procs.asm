%include "../include/io.mac"

    ;;
    ;;   TODO: Declare 'avg' struct to match its C counterpart
struc avg
    .quo resw 1
    .remain resw 1
endstruc
    ;;

struc proc
    .pid: resw 1
    .prio: resb 1
    .time: resw 1
endstruc

    ;; Hint: you can use these global arrays
section .data
    prio_result dd 0, 0, 0, 0, 0
    time_result dd 0, 0, 0, 0, 0

section .text
    extern printf
    global run_procs

run_procs:
    ;; DO NOT MODIFY

    push ebp
    mov ebp, esp
    pusha

    xor ecx, ecx

clean_results:
    mov dword [time_result + 4 * ecx], dword 0
    mov dword [prio_result + 4 * ecx],  0

    inc ecx
    cmp ecx, 5
    jne clean_results

    mov ecx, [ebp + 8]      ; processes
    mov ebx, [ebp + 12]     ; length
    mov eax, [ebp + 16]     ; proc_avg
    ;; DO NOT MODIFY
   
    ;; Your code starts here
    
    ; calculate the number of procs with prio 1
    ; calculate de sum of procs with prio 1
    xor edi, edi
    xor esi, esi
loop1_ex2:
    mov edx, edi
    imul edx, proc_size
    mov dl, byte [ecx + edx + proc.prio]
    cmp dl, 1
    jne end1
    mov dx, word [eax + avg.quo]
    mov esi, edi
    imul esi, proc_size
    mov si, word [ecx + esi + proc.time]
    add dx, si
    mov word [eax + avg.quo], dx
    mov dx, word [eax + avg.remain]
    inc dx
    mov word [eax + avg.remain], dx
    inc edi
    cmp edi, ebx
    jl loop1_ex2

end1:

    mov di, word [eax + avg.quo]
    mov si, word [eax + avg.remain]
    xor edx, edx
divide1:
    cmp di, si
    jl end2
    sub di, si
    inc edx
    jmp divide1
    ; calculate the sum of procs with prio 1
    

end2:
    push edx
    mov di, word [eax + avg.quo]
    mov si, word [eax + avg.remain]
    cmp si, 0
    je next_step1

remain1:
    mov dx, di
    sub dx, si
    cmp dx, 0
    jl end3
    sub di, si
    jmp remain1

end3:
    mov word [eax + avg.remain], di
    pop edi
    mov word [eax + avg.quo], di

    ; proceed the same for the rest prios

next_step1:
    xor edi, edi
    xor esi, esi
loop2_ex2:
    mov edx, edi
    imul edx, proc_size
    mov dl, byte [ecx + edx + proc.prio]
    cmp dl, 2
    jl increase1
    cmp dl, 2
    jne end4
    mov dx, word [eax + 1 * avg_size + avg.quo]
    mov esi, edi
    imul esi, proc_size
    mov si, word [ecx + esi + proc.time]
    add dx, si
    mov word [eax + 1 * avg_size + avg.quo], dx
    mov dx, word [eax + 1 * avg_size + avg.remain]
    inc dx
    mov word [eax + 1 * avg_size + avg.remain], dx
increase1:
    inc edi
    cmp edi, ebx
    jl loop2_ex2

end4:
    mov di, word [eax + 1 * avg_size + avg.quo]
    mov si, word [eax + 1 * avg_size + avg.remain]
    cmp esi, 0
    je next_step2
    xor edx, edx

divide2:
    cmp di, si
    jl end5
    sub di, si
    inc edx
    jmp divide2
    
end5:
    push edx
    mov di, word [eax + 1 * avg_size + avg.quo]
    mov si, word [eax + 1 * avg_size + avg.remain]

remain2:
    mov dx, di
    sub dx, si
    cmp dx, 0
    jl end6
    sub di, si
    jmp remain2

end6:
    mov word [eax + 1 * avg_size + avg.remain], di
    pop edi
    mov word [eax + 1 * avg_size + avg.quo], di

next_step2:
    xor edi, edi
    xor esi, esi
loop3_ex2:
    mov edx, edi
    imul edx, proc_size
    mov dl, byte [ecx + edx + proc.prio]
    cmp dl, 3
    jl increase2
    cmp dl, 3
    jne end7
    mov dx, word [eax + 2 * avg_size + avg.quo]
    mov esi, edi
    imul esi, proc_size
    mov si, word [ecx + esi + proc.time]
    add dx, si
    mov word [eax + 2 * avg_size + avg.quo], dx
    mov dx, word [eax + 2 * avg_size + avg.remain]
    inc dx
    mov word [eax + 2 * avg_size + avg.remain], dx
increase2:
    inc edi
    cmp edi, ebx
    jl loop3_ex2

end7:
    mov di, word [eax + 2 * avg_size + avg.quo]
    mov si, word [eax + 2 * avg_size + avg.remain]
    cmp esi, 0
    je next_step3
    xor edx, edx

divide3:
    cmp di, si
    jl end8
    sub di, si
    inc edx
    jmp divide3
    
end8:
    push edx
    mov di, word [eax + 2 * avg_size + avg.quo]
    mov si, word [eax + 2 * avg_size + avg.remain]

remain3:
    mov dx, di
    sub dx, si
    cmp dx, 0
    jl end9
    sub di, si
    jmp remain3

end9:
    mov word [eax + 2 * avg_size + avg.remain], di
    pop edi
    mov word [eax + 2 * avg_size + avg.quo], di

next_step3:
    xor edi, edi
    xor esi, esi
loop4_ex2:
    mov edx, edi
    imul edx, proc_size
    mov dl, byte [ecx + edx + proc.prio]
    cmp dl, 4
    jl increase3
    cmp dl, 4
    jne end10
    mov dx, word [eax + 3 * avg_size + avg.quo]
    mov esi, edi
    imul esi, proc_size
    mov si, word [ecx + esi + proc.time]
    add dx, si
    mov word [eax + 3 * avg_size + avg.quo], dx
    mov dx, word [eax + 3 * avg_size + avg.remain]
    inc dx
    mov word [eax + 3 * avg_size + avg.remain], dx
increase3:
    inc edi
    cmp edi, ebx
    jl loop4_ex2

end10:
    mov di, word [eax + 3 * avg_size + avg.quo]
    mov si, word [eax + 3 * avg_size + avg.remain]
    cmp esi, 0
    je next_step4
    xor edx, edx

divide4:
    cmp di, si
    jl end11
    sub di, si
    inc edx
    jmp divide4
    
end11:
    push edx
    mov di, word [eax + 3 * avg_size + avg.quo]
    mov si, word [eax + 3 * avg_size + avg.remain]

remain4:
    mov dx, di
    sub dx, si
    cmp dx, 0
    jl end12
    sub di, si
    jmp remain4

end12:
    mov word [eax + 3 * avg_size + avg.remain], di
    pop edi
    mov word [eax + 3 * avg_size + avg.quo], di

next_step4:
    xor edi, edi
    xor esi, esi
loop5_ex2:
    mov edx, edi
    imul edx, proc_size
    mov dl, byte [ecx + edx + proc.prio]
    cmp dl, 5
    jl increase4
    cmp dl, 5
    jne end13
    mov dx, word [eax + 4 * avg_size + avg.quo]
    mov esi, edi
    imul esi, proc_size
    mov si, word [ecx + esi + proc.time]
    add dx, si
    mov word [eax + 4 * avg_size + avg.quo], dx
    mov dx, word [eax + 4 * avg_size + avg.remain]
    inc dx
    mov word [eax + 4 * avg_size + avg.remain], dx
increase4:
    inc edi
    cmp edi, ebx
    jl loop5_ex2

end13:
    mov di, word [eax + 4 * avg_size + avg.quo]
    mov si, word [eax + 4 * avg_size + avg.remain]
    cmp esi, 0
    je next_step5
    xor edx, edx

divide5:
    cmp di, si
    jl end14
    sub di, si
    inc edx
    jmp divide5
    
end14:
    push edx
    mov di, word [eax + 4 * avg_size + avg.quo]
    mov si, word [eax + 4 * avg_size + avg.remain]

remain5:
    mov dx, di
    sub dx, si
    cmp dx, 0
    jl end15
    sub di, si
    jmp remain5

end15:
    mov word [eax + 4 * avg_size + avg.remain], di
    pop edi
    mov word [eax + 4 * avg_size + avg.quo], di

next_step5:
    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY