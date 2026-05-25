        .text
        .extern func_020a97b8
        .global func_02053ddc
        .arm
func_02053ddc:
    ldr ip, .L_02053df8
    mov r2, r0
    mov r3, r1
    ldr r0, [r2, #0x14]
    ldr r1, [r2, #0x0]
    ldr r2, [r2, #0x8]
    bx ip
.L_02053df8: .word func_020a97b8
