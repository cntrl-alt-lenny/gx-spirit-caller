; func_ov002_0226d864 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd300
        .extern func_ov002_021bc288
        .extern func_ov002_021bc618
        .extern func_ov002_0226d814
        .extern func_ov002_022707b8
        .global func_ov002_0226d864
        .arm
func_ov002_0226d864:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r4, r1
    mov sl, r0
    mov r0, r4
    mov r8, #0x0
    bl func_ov002_0226d814
    ldr r2, _LIT0
    and r3, sl, #0x1
    ldr r5, [r2]
    ldr r1, _LIT1
    bic r5, r5, #0x1
    orr r3, r5, r3
    and r3, r3, r1
    mov r1, r4, lsl #0x11
    orr r1, r3, r1, lsr #0x9
    str r1, [r2]
    ldrh r1, [r2, #0x16]
    mov r9, r0
    mov r6, r8
    orr r0, r1, #0x2
    strh r0, [r2, #0x16]
    strb r6, [r2, #0x8]
    mov r4, #0x1
    mov r5, r8
    mov fp, r8
.L_64:
    mov r7, fp
.L_68:
    mov r0, r6
    mov r1, r7
    mov r2, r5
    bl func_ov002_022707b8
    cmp r0, #0x0
    beq .L_a8
    cmp r6, sl
    bne .L_a4
    cmp r7, #0x4
    bgt .L_a4
    mov r0, r6
    mov r1, r7
    bl func_ov002_021bc288
    cmp r0, #0x0
    movne r8, r4
.L_a4:
    sub r9, r9, #0x1
.L_a8:
    add r7, r7, #0x1
    cmp r7, #0x4
    ble .L_68
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_64
    cmp r9, #0x0
    movgt r0, #0x0
    ldmgtia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r8, #0x0
    bne .L_e8
    mov r0, sl
    bl func_ov002_021bc618
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_e8:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cd300
_LIT1: .word 0xff8000ff
