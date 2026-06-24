; func_0202b4a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b4674
        .extern data_020be6a0
        .extern data_0219a85c
        .extern func_0202b08c
        .extern func_0202bacc
        .global func_0202b4a0
        .arm
func_0202b4a0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x94
    ldr r2, _LIT0
    mov r8, #0x0
    ldr r2, [r2]
    ldr r4, _LIT1
    ldr r6, [r2, #0x38]
    mov fp, r0
    mov sl, r1
    mov r5, r8
    add r7, sp, #0x4
.L_2c:
    ldr r1, [r4, r5, lsl #0x2]
    mov r0, fp
    blx r1
    str r0, [r7, r5, lsl #0x2]
    add r5, r5, #0x1
    cmp r5, #0x23
    bcc .L_2c
    ldr r1, _LIT2
    mov r0, #0x0
    ldr r9, [r1]
    str r0, [sp]
.L_58:
    ldr r0, [sp]
    mov r0, r0, lsl #0x2
    ldrh r4, [r6, r0]
    add r0, r6, r0
    cmp fp, r4
    bne .L_114
    ldrh r4, [r0, #0x2]
    cmp r4, #0x24
    bcs .L_e4
    ldr r0, _LIT1
    cmp r9, #0x1
    ldr r7, [r0, r4, lsl #0x2]
    mov r5, #0x1
    ble .L_194
.L_90:
    mov r0, r5
    bl func_0202b08c
    mov r4, r0
    bl func_0202bacc
    cmp r0, #0x0
    beq .L_d4
    mov r0, r4
    blx r7
    cmp r0, #0x0
    beq .L_d4
    cmp sl, #0x0
    addeq sp, sp, #0x94
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r8, lsl #0x1
    strh r4, [sl, r0]
    add r8, r8, #0x1
.L_d4:
    add r5, r5, #0x1
    cmp r5, r9
    blt .L_90
    b .L_194
.L_e4:
    mov r0, r4
    bl func_0202bacc
    cmp r0, #0x0
    beq .L_194
    cmp sl, #0x0
    addeq sp, sp, #0x94
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r8, lsl #0x1
    strh r4, [sl, r0]
    add r8, r8, #0x1
    b .L_194
.L_114:
    ldrh r1, [r0, #0x2]
    cmp fp, r1
    bne .L_150
    mov r0, r4
    bl func_0202bacc
    cmp r0, #0x0
    beq .L_194
    cmp sl, #0x0
    addeq sp, sp, #0x94
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r8, lsl #0x1
    strh r4, [sl, r0]
    add r8, r8, #0x1
    b .L_194
.L_150:
    cmp r1, #0x24
    bcs .L_194
    add r0, sp, #0x4
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x0
    beq .L_194
    mov r0, r4
    bl func_0202bacc
    cmp r0, #0x0
    beq .L_194
    cmp sl, #0x0
    addeq sp, sp, #0x94
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r8, lsl #0x1
    strh r4, [sl, r0]
    add r8, r8, #0x1
.L_194:
    ldr r0, [sp]
    add r0, r0, #0x1
    str r0, [sp]
    cmp r0, #0x19c
    blt .L_58
    mov r0, r8
    add sp, sp, #0x94
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_0219a85c
_LIT1: .word data_020be6a0
_LIT2: .word data_020b4674
