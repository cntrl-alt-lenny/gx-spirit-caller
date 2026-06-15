; func_0201083c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0200fb18
        .extern func_0200fd1c
        .extern func_0200fdfc
        .extern func_02010408
        .global func_0201083c
        .arm
func_0201083c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    movs sl, r0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r5, [sl, #0x18]
    cmp r5, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [sl, #0x24]
    mov r4, #0x0
    cmp r0, #0x0
    ble .L_b34
    mov r6, r4
    mov r7, r4
    mov r8, #0x1
.L_ab8:
    ldr r0, [r5, #0x8]
    cmp r0, #0x0
    beq .L_b20
    ldr r0, [sl, #0x26c]
    tst r0, r8, lsl r4
    bne .L_b20
    mov r0, r5
    bl func_0200fb18
    movs r1, r0
    mov r0, r5
    beq .L_b04
    mov r2, r7
    mov r3, r7
    str r7, [sp]
    bl func_0200fdfc
    cmp r0, #0x0
    bne .L_b20
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_b04:
    mov r1, sl
    mov r2, r6
    mov r3, r6
    bl func_02010408
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_b20:
    ldr r0, [sl, #0x24]
    add r4, r4, #0x1
    cmp r4, r0
    add r5, r5, #0x20
    blt .L_ab8
.L_b34:
    ldr r8, [sl, #0x1c]
    cmp r8, #0x0
    beq .L_be0
    ldr r0, [sl, #0x28]
    mov r9, #0x0
    cmp r0, #0x0
    ble .L_be0
    mov r4, #0x1
    mov fp, r9
    mov r6, r9
    mov r5, r4
    mov r7, r4
.L_b64:
    ldr r0, [r8]
    cmp r0, #0x0
    beq .L_bcc
    ldr r0, [sl, #0x270]
    tst r0, r7, lsl r9
    bne .L_bcc
    mov r0, r8
    bl func_0200fd1c
    movs r1, r0
    mov r0, r8
    beq .L_bb0
    mov r2, r5
    mov r3, r6
    str r6, [sp]
    bl func_0200fdfc
    cmp r0, #0x0
    bne .L_bcc
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_bb0:
    mov r1, sl
    mov r2, r4
    mov r3, fp
    bl func_02010408
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_bcc:
    ldr r0, [sl, #0x28]
    add r9, r9, #0x1
    cmp r9, r0
    add r8, r8, #0xc
    blt .L_b64
.L_be0:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
