        .text
        .extern func_02090910
        .extern func_02090af0
        .global func_02090944
        .arm
func_02090944:
    ldr ip, .L_02090954
    ldr r1, .L_02090958
    ldr r2, .L_0209095c
    bx ip
.L_02090954: .word func_02090af0
.L_02090958: .word 0x27fffe0
.L_0209095c: .word func_02090910
