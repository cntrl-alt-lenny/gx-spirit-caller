; func_ov002_021fa4d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern func_ov002_021ae400
        .extern func_ov002_021af9d0
        .extern func_ov002_021afb74
        .extern func_ov002_021ca698
        .extern func_ov002_021d8128
        .extern func_ov002_021ff400
        .global func_ov002_021fa4d8
        .arm
func_ov002_021fa4d8:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, _LIT0
    mov r4, r0
    ldr r0, [r2, #0x5b4]
    mov r5, r1
    cmp r0, #0x0
    beq .L_3e0
    cmp r0, #0x1
    beq .L_444
    cmp r0, #0x2
    beq .L_480
    b .L_4b4
.L_3e0:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, r0
    bl func_ov002_021ca698
    cmp r0, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r4
    mov r1, r5
    bl func_ov002_021ff400
    cmp r0, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4, #0x2]
    mov r1, #0x56
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, pc}
.L_444:
    ldrh r1, [r4, #0x2]
    ldrh r0, [r4, #0x4]
    ldrh r2, [r4]
    mov r3, r1, lsl #0x1f
    mov r1, r0, lsl #0x11
    mov r0, r3, lsr #0x1f
    mov r3, r1, lsr #0x17
    mov r1, #0x6
    bl func_ov002_021af9d0
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, pc}
.L_480:
    bl func_ov002_021afb74
    ldrh r3, [r4, #0x2]
    mov r1, r0
    mov r2, #0x0
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021d8128
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, pc}
.L_4b4:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce288
