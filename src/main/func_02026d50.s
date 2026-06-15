; func_02026d50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02006e1c
        .extern func_0200af08
        .extern func_0200afc8
        .extern func_0202162c
        .extern func_02021660
        .global func_02026d50
        .arm
func_02026d50:
    stmdb sp!, {r4, r5, r6, lr}
    add r4, r0, #0x94
    ldrb r3, [r4, #0x16]
    mov r6, r1
    mov r0, r6, lsl #0x18
    mov r1, r3, lsl #0x1f
    mov r5, r2
    mov r6, r0, asr #0x18
    movs r0, r1, lsr #0x1f
    beq .L_db0
    bl func_0202162c
    ldrsh r2, [r4, #0x14]
    mov r1, #0x3
    bl func_02021660
    add r0, r0, r6, lsl #0x2
    ldr r0, [r0, #0x98]
    b .L_dc0
.L_db0:
    cmp r6, #0x0
    addge r0, r4, r6, lsl #0x2
    ldrge r0, [r0, #0x4]
    ldrlt r0, [r4]
.L_dc0:
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, pc}
    tst r5, #0x1
    ldrne r0, [r4, #0x10]
    ldrne r0, [r0, #0x80]
    cmpne r0, #0x0
    beq .L_df0
    bl func_0200af08
    ldr r0, [r4, #0x10]
    mov r1, #0x0
    str r1, [r0, #0x80]
.L_df0:
    tst r5, #0x4
    ldrne r0, [r4, #0x10]
    ldrne r0, [r0, #0x88]
    cmpne r0, #0x0
    beq .L_e14
    bl func_0200afc8
    ldr r0, [r4, #0x10]
    mov r1, #0x0
    str r1, [r0, #0x88]
.L_e14:
    ldrb r0, [r4, #0x16]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    bne .L_e4c
    cmp r6, #0x0
    blt .L_e4c
    add r0, r4, r6, lsl #0x2
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    beq .L_e4c
    bl func_02006e1c
    add r0, r4, r6, lsl #0x2
    mov r1, #0x0
    str r1, [r0, #0x4]
.L_e4c:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
