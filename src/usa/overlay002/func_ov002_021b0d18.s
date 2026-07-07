; func_ov002_021b0d18 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd65c
        .extern func_0202df24
        .extern func_0202e2a4
        .extern func_ov002_021b0a74
        .extern func_ov002_021b0afc
        .extern func_ov002_021b9dec
        .extern func_ov002_021bc1a8
        .extern func_ov002_021c8390
        .global func_ov002_021b0d18
        .arm
func_ov002_021b0d18:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x14
    mov r8, #0x0
    ldr r4, _LIT0
    mov r5, r8
    mov r9, r8
    add r7, sp, #0x0
    mov r6, r8
.L_1c4:
    ldr r0, [r4, #0x4]
    mov r1, r9
    bl func_ov002_021b9dec
    cmp r0, #0x0
    beq .L_1f8
    str r0, [r7, r8, lsl #0x2]
    ldr r0, [r4, #0x4]
    mov r1, r9
    add r8, r8, #0x1
    bl func_ov002_021c8390
    mov r1, r0
    mov r0, r6
    bl func_ov002_021b0afc
.L_1f8:
    ldr r0, [r4, #0x4]
    mov r1, r9
    eor r0, r0, #0x1
    bl func_ov002_021bc1a8
    cmp r0, #0x0
    add r9, r9, #0x1
    addeq r5, r5, #0x1
    cmp r9, #0x4
    ble .L_1c4
    cmp r8, #0x3
    blt .L_298
    subs fp, r8, #0x3
    mov sl, #0x0
    bmi .L_298
    add r4, sp, #0x0
.L_234:
    ldr r9, [r4, sl, lsl #0x2]
    mov r0, r9
    bl func_0202e2a4
    cmp r0, #0x0
    bne .L_28c
    add r6, sl, #0x1
    mov r7, #0x0
    cmp r6, r8
    bge .L_278
.L_258:
    ldr r1, [r4, r6, lsl #0x2]
    mov r0, r9
    bl func_0202df24
    cmp r0, #0x0
    add r6, r6, #0x1
    addne r7, r7, #0x1
    cmp r6, r8
    blt .L_258
.L_278:
    cmp r7, #0x2
    blt .L_28c
    mov r0, #0x3b
    mov r1, #0x1
    bl func_ov002_021b0a74
.L_28c:
    add sl, sl, #0x1
    cmp sl, fp
    ble .L_234
.L_298:
    cmp r8, #0x5
    bne .L_2ac
    mov r0, #0x3c
    mov r1, #0x1
    bl func_ov002_021b0a74
.L_2ac:
    cmp r5, #0x5
    addne sp, sp, #0x14
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, #0x3d
    mov r1, #0x1
    bl func_ov002_021b0a74
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cd65c
