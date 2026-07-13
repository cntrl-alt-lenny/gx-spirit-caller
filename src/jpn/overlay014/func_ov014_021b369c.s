; func_ov014_021b369c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov014_02234ff4
        .extern data_ov014_0223505c
        .extern func_020371b8
        .extern func_ov005_021acf10
        .extern func_ov014_021b3838
        .extern func_ov014_021b43e8
        .global func_ov014_021b369c
        .arm
func_ov014_021b369c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x34]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_3c0
    b .L_25c
    b .L_28c
    b .L_310
    b .L_394
.L_25c:
    mov r2, #0x1
    add r0, r4, #0xc
    mov r1, #0x0
    str r2, [r4, #0x2c]
    bl func_ov005_021acf10
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_28c:
    ldr r0, _LIT0
    ldr r1, [r4, #0x30]
    ldrh r0, [r0, #0x54]
    cmp r1, #0x0
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    beq .L_2b8
    add r0, r0, #0x1
    cmp r0, #0xa
    movgt r0, #0x1
    b .L_2c4
.L_2b8:
    sub r0, r0, #0x1
    cmp r0, #0x0
    movle r0, #0xa
.L_2c4:
    ldr r2, _LIT0
    mov r0, r0, lsl #0x10
    ldrh r1, [r2, #0x54]
    mov r0, r0, lsr #0x10
    and r0, r0, #0xff
    bic r1, r1, #0xff
    orr r1, r1, r0
    mov r0, r4
    strh r1, [r2, #0x54]
    mov r3, #0x1
    mov r1, #0x0
    str r3, [r2, #0x58]
    bl func_ov014_021b3838
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_3c0
.L_310:
    ldr r0, _LIT0
    ldr r1, [r4, #0x30]
    ldrh r0, [r0, #0x54]
    cmp r1, #0x0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x18
    beq .L_33c
    add r0, r0, #0x1
    cmp r0, #0xa
    movgt r0, #0x1
    b .L_348
.L_33c:
    sub r0, r0, #0x1
    cmp r0, #0x0
    movle r0, #0xa
.L_348:
    ldr r2, _LIT0
    mov r0, r0, lsl #0x10
    ldrh r1, [r2, #0x54]
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x18
    bic r1, r1, #0xff00
    orr r1, r1, r0, lsr #0x10
    mov r0, r4
    strh r1, [r2, #0x54]
    mov r3, #0x2
    mov r1, #0x1
    str r3, [r2, #0x58]
    bl func_ov014_021b3838
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_3c0
.L_394:
    ldrsb r0, [r4, #0xc]
    cmp r0, #0x0
    beq .L_3c0
    ldr r0, _LIT1
    bl func_ov014_021b43e8
    mov r0, #0x3a
    mov r3, #0x1
    sub r1, r0, #0x3b
    mov r2, #0x0
    str r3, [r4, #0x4]
    bl func_020371b8
.L_3c0:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov014_02234ff4
_LIT1: .word data_ov014_0223505c
