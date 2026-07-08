; func_ov002_02287524 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_0202e21c
        .extern func_0202f994
        .global func_ov002_02287524
        .arm
func_ov002_02287524:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r8, #0x0
    ldr r5, _LIT0
    ldr r4, _LIT1
    mov sl, r0
    mov r6, r8
    mov fp, r8
.L_1c:
    and r0, r6, #0x1
    mla r1, r0, r4, r5
    mov r7, fp
    add r9, r1, #0x30
.L_2c:
    ldr r0, [r9]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_48
    bl func_0202e21c
    cmp r0, #0x0
    addne r8, r8, #0x1
.L_48:
    add r7, r7, #0x1
    cmp r7, #0x5
    add r9, r9, #0x14
    blt .L_2c
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_1c
    ldrh r1, [sl, #0x2]
    mov r0, #0x1f4
    ldr r4, _LIT1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    and r1, r1, #0x1
    mul r2, r1, r4
    ldr r5, _LIT0
    mul r0, r8, r0
    ldr r1, [r5, r2]
    cmp r1, r0
    movle r0, #0x1
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r7, #0x0
    mov r8, r7
    mov r6, r7
.L_a8:
    ldrh r0, [sl, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r1, r0, #0x1
    and r1, r1, #0x1
    mla r2, r1, r4, r5
    add r2, r2, r6
    ldr r1, [r2, #0x30]
    mov r1, r1, lsl #0x13
    movs r1, r1, lsr #0x13
    beq .L_e0
    ldrh r1, [r2, #0x38]
    cmp r1, #0x0
    addeq r7, r7, #0x1
.L_e0:
    and r0, r0, #0x1
    mla r1, r0, r4, r5
    add r1, r1, r6
    ldr r0, [r1, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_118
    ldrh r1, [r1, #0x38]
    cmp r1, #0x0
    bne .L_118
    bl func_0202f994
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_118:
    add r8, r8, #0x1
    cmp r8, #0x5
    add r6, r6, #0x14
    blt .L_a8
    cmp r7, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
