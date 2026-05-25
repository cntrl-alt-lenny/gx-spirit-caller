        .text
        .extern func_ov002_02281994
        .global func_ov002_02295418
        .arm
func_ov002_02295418:
    ldrh r0, [r0, #0x2]
    ldr ip, .L_02295430
    ldr r1, .L_02295434
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bx ip
.L_02295430: .word func_ov002_02281994
.L_02295434: .word 0x15a3
