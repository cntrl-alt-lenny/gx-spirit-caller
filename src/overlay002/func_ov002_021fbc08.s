; func_ov002_021fbc08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_021c84e0
        .extern func_ov002_021ded30
        .extern func_ov002_021e7584
        .extern func_ov002_02257878
        .extern func_ov002_0225935c
        .extern func_ov002_022593f4
        .global func_ov002_021fbc08
        .arm
func_ov002_021fbc08:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, _LIT0
    mov r5, r0
    ldr r1, [r1, #0x5b4]
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_174
    b .L_2c
    b .L_60
    b .L_90
    b .L_14c
.L_2c:
    mov r0, #0x0
    strh r0, [r5, #0xa]
    strh r0, [r5, #0x8]
    strh r0, [r5, #0xc]
    ldrh r0, [r5, #0x2]
    mov r1, #0x3a
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    ldr r0, _LIT0
    ldr r1, [r0, #0x5b4]
    add r1, r1, #0x1
    str r1, [r0, #0x5b4]
.L_60:
    ldrh r0, [r5, #0x2]
    ldrh r1, [r5]
    ldr r2, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225935c
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, r5, r6, pc}
.L_90:
    bl func_ov002_022593f4
    cmp r0, #0x0
    beq .L_120
    ldr r0, _LIT2
    ldr r2, [r0, #0xd74]
    ldr r1, [r0, #0xd78]
    ldr r6, [r0, #0xd70]
    add r4, r2, r1
    mov r0, r6
    mov r1, r4
    bl func_ov002_021c84e0
    ldrh r1, [r5, #0xc]
    add ip, r5, #0x8
    mov r3, r6, lsl #0x1
    add r0, r1, r0
    strh r0, [r5, #0xc]
    ldrh r2, [ip, r3]
    mov r0, #0x1
    ldr r1, _LIT1
    orr r2, r2, r0, lsl r4
    mov r0, r5
    strh r2, [ip, r3]
    bl func_ov002_02257878
    cmp r0, #0x0
    mov r0, #0x0
    bne .L_10c
    ldr r1, _LIT0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, r5, r6, pc}
.L_10c:
    ldr r1, _LIT0
    ldr r2, [r1, #0x5b4]
    sub r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, r5, r6, pc}
.L_120:
    ldrh r0, [r5, #0xc]
    cmp r0, #0x0
    ldreq r1, _LIT0
    mov r0, #0x0
    streq r0, [r1, #0x5b4]
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r1, _LIT0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, r5, r6, pc}
.L_14c:
    ldrh r2, [r5, #0x8]
    ldrh r1, [r5, #0xa]
    orr r1, r2, r1, lsl #0x10
    bl func_ov002_021ded30
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, r5, r6, pc}
.L_174:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word func_ov002_021e7584
_LIT2: .word data_ov002_022d016c
