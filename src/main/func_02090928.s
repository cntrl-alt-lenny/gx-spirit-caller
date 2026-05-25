        .text
        .extern func_020908f8
        .extern func_02090a50
        .global func_02090928
        .arm
func_02090928:
    ldr ip, .L_02090938
    ldr r1, .L_0209093c
    ldr r2, .L_02090940
    bx ip
.L_02090938: .word func_02090a50
.L_0209093c: .word 0x27fffe0
.L_02090940: .word func_020908f8
