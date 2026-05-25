        .text
        .extern func_02032d58
        .global func_02033808
        .arm
func_02033808:
    cmp r1, #0x0
    ldr r1, [r0, #0xeb4]
    ldr ip, .L_02033824
    orrne r1, r1, #0x40000
    biceq r1, r1, #0x40000
    str r1, [r0, #0xeb4]
    bx ip
.L_02033824: .word func_02032d58
