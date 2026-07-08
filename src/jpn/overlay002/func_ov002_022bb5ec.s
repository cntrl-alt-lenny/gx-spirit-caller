; func_ov002_022bb5ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d1330
        .extern data_ov002_022d281c
        .extern func_020371b8
        .extern func_ov002_022a61e8
        .extern func_ov002_022bda78
        .global func_ov002_022bb5ec
        .arm
func_ov002_022bb5ec:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldr r0, [r5, #0xc60]
    cmp r0, #0x0
    beq .L_6b4
    cmp r0, #0x1
    beq .L_74c
    cmp r0, #0x2
    beq .L_7a0
    b .L_7b8
.L_6b4:
    add r0, r5, #0xc00
    ldrh ip, [r0, #0x68]
    ldr r0, _LIT0
    ldr r4, _LIT1
    mov r1, ip, lsl #0x1f
    mov r2, ip, lsl #0x1a
    mov r3, ip, lsl #0x12
    mov r1, r1, lsr #0x1f
    mov r2, r2, lsr #0x1b
    mov r3, r3, lsr #0x18
    strh ip, [sp, #0x4]
    bl func_ov002_022a61e8
    ldrh r0, [r0, #0xa]
    mov ip, #0x0
    add r3, r5, #0xc80
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x1f
    ldr r0, [r5, #0xcf8]
    movne r1, #0x1
    moveq r1, #0x0
    cmp r0, #0x0
    movne r2, #0x2
    moveq r2, #0x0
    orr r2, r2, r1
    mov r0, r4
    mov r1, #0x35
    str ip, [sp]
    bl func_ov002_022bda78
    mov r0, #0x93
    sub r1, r0, #0x94
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, #0x1
    str r0, [r5, #0xc60]
    mov r0, #0x0
    str r0, [r5, #0xc64]
    b .L_7b8
.L_74c:
    ldr r2, _LIT1
    mov r1, #0x0
.L_754:
    ldr r0, [r2]
    cmp r0, #0x0
    beq .L_770
    ldr r0, [r2, #0x4]
    cmp r0, #0x35
    moveq r0, #0x1
    beq .L_784
.L_770:
    add r1, r1, #0x1
    cmp r1, #0x10
    add r2, r2, #0x8
    blt .L_754
    mov r0, #0x0
.L_784:
    cmp r0, #0x0
    bne .L_7b8
    mov r0, #0x2
    str r0, [r5, #0xc60]
    mov r0, #0x0
    str r0, [r5, #0xc64]
    b .L_7b8
.L_7a0:
    mov r0, #0xc
    str r0, [r5, #0xcc8]
    mov r0, #0x0
    add sp, sp, #0x8
    str r0, [r5, #0xc54]
    ldmia sp!, {r3, r4, r5, pc}
.L_7b8:
    ldr r1, [r5, #0xc64]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r5, #0xc64]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022d1330
_LIT1: .word data_ov002_022d281c
