; func_ov002_0226dbb0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022c85e0
        .extern data_ov002_022cf16c
        .extern func_ov002_021b9ecc
        .extern func_ov002_021bb068
        .extern func_ov002_021bc288
        .extern func_ov002_021bc618
        .extern func_ov002_021bc8c8
        .global func_ov002_0226dbb0
        .arm
func_ov002_0226dbb0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x14
    mov sl, r0
    bl func_ov002_021bc618
    ldr r1, _LIT0
    mov r4, r0
    add r3, sp, #0x8
    ldmia r1, {r0, r1, r2}
    stmia r3, {r0, r1, r2}
    ldr r0, _LIT1
    bl func_ov002_021bb068
    cmp r0, #0x0
    addgt sp, sp, #0x14
    movgt r0, #0x0
    ldmgtia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    rsb r7, sl, #0x1
    ldr r0, _LIT2
    and r1, r7, #0x1
    mul r0, r1, r0
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp]
    mov fp, #0x1
.L_5c:
    ldr r0, [sp]
    add r1, sp, #0x8
    mov r6, #0x0
    ldr r5, [r1, r0, lsl #0x2]
    mov r8, r6
.L_70:
    mov r0, sl
    mov r1, r8
    bl func_ov002_021b9ecc
    cmp r5, r0
    bne .L_b4
    mov r0, sl
    mov r1, sl
    mov r2, r8
    bl func_ov002_021bc8c8
    cmp r0, #0x0
    beq .L_b4
    mov r0, sl
    mov r1, r8
    mov r6, fp
    bl func_ov002_021bc288
    cmp r0, #0x0
    addne r4, r4, #0x1
.L_b4:
    add r8, r8, #0x1
    cmp r8, #0x4
    ble .L_70
    ldr r1, _LIT3
    ldr r0, [sp, #0x4]
    mov r9, #0x0
    add r8, r1, r0
.L_d0:
    mov r0, r7
    mov r1, r9
    bl func_ov002_021b9ecc
    cmp r5, r0
    bne .L_108
    mov r0, sl
    mov r1, r7
    mov r2, r9
    bl func_ov002_021bc8c8
    cmp r0, #0x0
    ldrneh r0, [r8, #0x38]
    cmpne r0, #0x0
    movne r6, #0x1
    bne .L_118
.L_108:
    add r8, r8, #0x14
    add r9, r9, #0x1
    cmp r9, #0x4
    ble .L_d0
.L_118:
    cmp r6, #0x0
    addeq sp, sp, #0x14
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [sp]
    add r0, r0, #0x1
    str r0, [sp]
    cmp r0, #0x3
    blt .L_5c
    cmp r4, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022c85e0
_LIT1: .word 0x000013f2
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf16c
