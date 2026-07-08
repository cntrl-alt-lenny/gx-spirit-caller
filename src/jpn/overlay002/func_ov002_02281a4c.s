; func_ov002_02281a4c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern func_0202b824
        .extern func_0202e1e0
        .extern func_ov002_021afff0
        .extern func_ov002_021c3c10
        .global func_ov002_02281a4c
        .arm
func_ov002_02281a4c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r6, #0x0
    mov r5, r0
    mov r4, r1
    mov r7, r6
    bl func_ov002_021c3c10
    cmp r0, #0x0
    ldr r0, _LIT0
    beq .L_60
    ldr r1, _LIT1
    and r2, r5, #0x1
    mla r0, r2, r0, r1
    add r0, r0, r4, lsl #0x2
    ldr r0, [r0, #0x120]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b824
    cmp r0, #0x16
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r0, #0x17
    moveq r0, #0x2
    movne r0, r6
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_60:
    and r1, r5, #0x1
    mul fp, r1, r0
    ldr r0, _LIT2
    mov r5, r6
    ldr r0, [r0, fp]
    cmp r0, #0x0
    bls .L_f8
    ldr r0, _LIT1
    mov r4, #0x2
    add sl, r0, fp
    add r9, sl, #0x120
.L_8c:
    ldr r0, [sl, #0xc]
    add r0, r0, #0x1
    cmp r5, r0, lsr #0x1
    bcs .L_d0
    ldr r0, [r9]
    mov r0, r0, lsl #0x13
    mov r8, r0, lsr #0x13
    mov r0, r8
    bl func_0202e1e0
    cmp r0, #0x0
    addne r6, r6, #0x1
    bne .L_e4
    mov r0, r8
    bl func_0202b824
    cmp r0, #0x16
    addeq r7, r7, #0x1
    b .L_e4
.L_d0:
    mov r0, r4
    bl func_ov002_021afff0
    cmp r0, #0x0
    addne r6, r6, #0x1
    addeq r7, r7, #0x1
.L_e4:
    ldr r0, [sl, #0xc]
    add r5, r5, #0x1
    cmp r5, r0
    add r9, r9, #0x4
    bcc .L_8c
.L_f8:
    ldr r0, _LIT2
    ldr r0, [r0, fp]
    bl func_ov002_021afff0
    cmp r0, r6
    movge r2, #0x1
    add r1, r6, r7
    movlt r2, #0x0
    cmp r0, r1
    movge r0, #0x1
    movlt r0, #0x0
    add r0, r2, r0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf098
