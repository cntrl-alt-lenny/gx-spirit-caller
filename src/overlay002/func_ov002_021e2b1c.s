        .text
        .extern func_ov002_021d479c
        .global func_ov002_021e2b1c
        .arm
func_ov002_021e2b1c:
    ldr ip, .L_021e2b38
    mov r0, r0, lsl #0x10
    mov r2, #0x0
    mov r1, r0, lsr #0x10
    mov r3, r2
    mov r0, #0xa
    bx ip
.L_021e2b38: .word func_ov002_021d479c
