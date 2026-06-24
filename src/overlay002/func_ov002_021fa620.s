; func_ov002_021fa620 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern func_ov002_021ae400
        .extern func_ov002_021af9d0
        .extern func_ov002_021afb74
        .extern func_ov002_021e1870
        .extern func_ov002_021e286c
        .extern func_ov002_022536e8
        .extern func_ov002_0226b054
        .global func_ov002_021fa620
        .arm
func_ov002_021fa620:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5b4]
    cmp r0, #0x5
    bgt .L_38
    cmp r0, #0x0
    blt .L_150
    beq .L_44
    cmp r0, #0x1
    beq .L_bc
    cmp r0, #0x5
    beq .L_114
    b .L_150
.L_38:
    cmp r0, #0xa
    beq .L_140
    b .L_150
.L_44:
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022536e8
    cmp r0, #0x0
    ldrh r0, [r4, #0x2]
    bne .L_8c
    mov r0, r0, lsl #0x1f
    mov r1, #0xd
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    ldr r0, _LIT0
    mov r1, #0x5
    str r1, [r0, #0x5b4]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_8c:
    ldrh r2, [r4]
    mov r0, r0, lsl #0x1f
    mov r1, #0x6
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021af9d0
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, pc}
.L_bc:
    bl func_ov002_021afb74
    mov r5, r0
    bl func_ov002_021afb74
    ldr r0, [r0]
    ldrh r2, [r4, #0x2]
    mov r0, r0, lsl #0x2
    ldr r1, [r5]
    mov r3, r2, lsl #0x1f
    mov r0, r0, lsr #0x18
    mov r2, r1, lsl #0x12
    mov r1, r0, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r0, r3, lsr #0x1f
    mov r2, #0x0
    bl func_ov002_021e1870
    mov r1, #0x1f4
    strh r1, [r4, #0x8]
    ldr r0, _LIT0
    mov r1, #0xa
    str r1, [r0, #0x5b4]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_114:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226b054
    mov r0, #0x0
    ldr r1, _LIT0
    strh r0, [r4, #0x8]
    mov r2, #0xa
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, pc}
.L_140:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e286c
.L_150:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce288
