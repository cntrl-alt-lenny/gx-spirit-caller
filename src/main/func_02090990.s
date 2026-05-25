        .text
        .extern func_02090978
        .extern func_020909d0
        .global func_02090990
        .arm
func_02090990:
    ldr ip, .L_020909a4
    ldr r1, .L_020909a8
    ldr r2, .L_020909ac
    mov r3, #0x1
    bx ip
.L_020909a4: .word func_020909d0
.L_020909a8: .word 0x27fffe8
.L_020909ac: .word func_02090978
