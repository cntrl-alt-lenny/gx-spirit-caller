; func_ov002_021bd630 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021b3ef8
        .extern func_ov002_021ba024
        .extern func_ov002_021c1c48
        .global func_ov002_021bd630
        .arm
func_ov002_021bd630:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldr r0, _LIT0
    ldr r2, _LIT1
    and r3, sl, #0x1
    mla r2, r3, r0, r2
    mov r9, r1
    mov r0, #0x14
    mul fp, r9, r0
    add r0, r2, #0x30
    str r0, [sp]
    ldr r0, [r0, fp]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r5, #0x0
.L_44:
    cmp sl, r5
    movne r2, #0x1
    moveq r2, #0x0
    mov r0, sl
    mov r1, r9
    bl func_ov002_021c1c48
    cmp r0, #0x0
    bne .L_130
    ldr r2, _LIT1
    ldr r0, _LIT0
    and r1, r5, #0x1
    mla r0, r1, r0, r2
    add r7, r0, #0x94
    add r8, r0, #0x64
    ldr r0, _LIT0
    mov r6, #0x5
    add r4, r0, #0xb00
.L_88:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    cmp r4, r0, lsr #0x13
    bne .L_11c
    ldr r3, [r8, #0x40]
    ldrh r0, [r8, #0x38]
    mov r2, r3, lsr #0x6
    mov r1, r3, lsr #0x2
    orr r1, r1, r3, lsr #0x1
    and r2, r2, #0x1
    mvn r2, r2
    and r1, r1, #0x1
    and r2, r0, r2
    mvn r0, r1
    tst r2, r0
    beq .L_11c
    ldr r2, [r8, #0x3c]
    mov r0, sl
    mov r1, r9
    bl func_ov002_021ba024
    cmp r0, #0x0
    beq .L_11c
    ldr r0, [sp]
    ldr r2, [r0, fp]
    mov r0, r5
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r3, r2, lsl #0x12
    mov r2, r1, lsl #0x1
    add r3, r2, r3, lsr #0x1f
    ldr r2, _LIT0
    mov r1, r6
    add r2, r2, #0xb00
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_11c:
    add r6, r6, #0x1
    cmp r6, #0xa
    add r7, r7, #0x14
    add r8, r8, #0x14
    blt .L_88
.L_130:
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_44
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
