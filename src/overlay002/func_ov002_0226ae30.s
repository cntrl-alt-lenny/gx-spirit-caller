        .text
        .extern func_ov002_0226ae50
        .global func_ov002_0226ae30
        .arm
func_ov002_0226ae30:
    cmp r2, #0x0
    mov r2, #0x0
    movne r2, #0x1
    cmp r3, #0x0
    ldr ip, .L_0226ae4c
    movne r2, #0x7
    bx ip
.L_0226ae4c: .word func_ov002_0226ae50
