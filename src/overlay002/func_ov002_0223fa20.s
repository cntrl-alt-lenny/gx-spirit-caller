; func_ov002_0223fa20 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern func_ov002_021ae400
        .extern func_ov002_021af9d0
        .extern func_ov002_021afb74
        .extern func_ov002_021afba0
        .extern func_ov002_0223de04
        .extern func_ov002_0223f6c4
        .extern func_ov002_022536e8
        .global func_ov002_0223fa20
        .arm
func_ov002_0223fa20:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r0
    ldrh r2, [r4, #0x2]
    mov r1, r2, lsl #0x11
    mov r2, r2, lsl #0x1f
    mov r1, r1, lsr #0x1f
    eor r5, r1, r2, lsr #0x1f
    bl func_ov002_0223f6c4
    ldr r1, _LIT0
    mov r3, r0
    ldr r0, [r1, #0x5b8]
    cmp r0, #0x0
    beq .L_3a4
    cmp r0, #0x1
    beq .L_3fc
    cmp r0, #0x2
    beq .L_424
    b .L_478
.L_3a4:
    ldrh r1, [r4]
    mov r0, r5
    mov r2, r3
    bl func_ov002_022536e8
    cmp r0, #0x0
    bne .L_3d8
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    mvneq r0, #0x0
    movne r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_3d8:
    mov r0, r5
    mov r1, #0x5e
    bl func_ov002_021ae400
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_3fc:
    ldrh r2, [r4]
    mov r0, r5
    mov r1, #0x6
    bl func_ov002_021af9d0
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_424:
    bl func_ov002_021afb74
    mov r7, r0
    bl func_ov002_021afba0
    mov r6, r0
    bl func_ov002_021afb74
    mov r5, r0
    bl func_ov002_021afb74
    ldr r1, [r7]
    mov r2, r6
    mov r1, r1, lsl #0x12
    mov r1, r1, lsr #0x1f
    ldr r3, [r5]
    mov ip, r0
    mov r0, r4
    mov r4, r3, lsl #0x12
    ldr r3, [ip]
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    add r3, r3, r4, lsr #0x1f
    bl func_ov002_0223de04
.L_478:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022ce288
