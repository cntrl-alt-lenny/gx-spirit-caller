        .text
        .extern func_ov002_021d479c
        .global func_ov002_021e28fc
        .arm
func_ov002_021e28fc:
    ldr ip, .L_021e2918
    mov r0, r0, lsl #0x10
    mov r2, #0x0
    mov r1, r0, lsr #0x10
    mov r3, r2
    mov r0, #0x59
    bx ip
.L_021e2918: .word func_ov002_021d479c
