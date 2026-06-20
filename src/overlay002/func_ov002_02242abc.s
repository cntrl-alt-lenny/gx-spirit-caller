; func_ov002_02242abc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022d0e6c
        .extern func_ov002_021ca698
        .extern func_ov002_0223de04
        .extern func_ov002_022536e8
        .extern func_ov002_0226b194
        .global func_ov002_02242abc
        .arm
func_ov002_02242abc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r1, [r4, #0xc]
    cmp r1, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT0
    ldr r1, [r1, #0x5b8]
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b .L_330
    b .L_1fc
    b .L_304
    b .L_278
    b .L_304
    b .L_2fc
.L_1fc:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r1, r0, #0x1
    bl func_ov002_021ca698
    cmp r0, #0x0
    beq .L_268
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022536e8
    cmp r0, #0x0
    beq .L_268
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0226b194
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, pc}
.L_268:
    ldr r0, _LIT0
    ldr r1, [r0, #0x5b8]
    add r1, r1, #0x2
    str r1, [r0, #0x5b8]
.L_278:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, r0
    bl func_ov002_021ca698
    cmp r0, #0x0
    beq .L_2ec
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_022536e8
    cmp r0, #0x0
    beq .L_2ec
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226b194
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, pc}
.L_2ec:
    ldr r0, _LIT0
    ldr r1, [r0, #0x5b8]
    add r1, r1, #0x2
    str r1, [r0, #0x5b8]
.L_2fc:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_304:
    ldr r1, _LIT1
    mov r2, #0xe
    ldrh r3, [r1, #0xb2]
    and r1, r3, #0x1
    bl func_ov002_0223de04
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, pc}
.L_330:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022d0e6c
