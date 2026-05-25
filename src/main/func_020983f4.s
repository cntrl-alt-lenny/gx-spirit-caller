        .text
        .extern data_021a8334
        .extern func_020973fc
        .global func_020983f4
        .arm
func_020983f4:
    ldr ip, .L_0209840c
    mov r3, r0
    mov r2, r1
    ldr r0, .L_02098410
    mov r1, r3
    bx ip
.L_0209840c: .word func_020973fc
.L_02098410: .word data_021a8334
