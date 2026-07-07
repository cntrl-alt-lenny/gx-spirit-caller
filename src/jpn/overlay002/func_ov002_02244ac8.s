; func_ov002_02244ac8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern func_ov002_021ae320
        .extern func_ov002_021d8680
        .extern func_ov002_0223d9e0
        .extern func_ov002_02244a20
        .extern func_ov002_022592c0
        .extern func_ov002_0225930c
        .global func_ov002_02244ac8
        .arm
func_ov002_02244ac8:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5b8]
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_f0
    b .L_34
    b .L_78
    b .L_48
    b .L_78
    b .L_48
    b .L_78
.L_34:
    ldrh r0, [r4, #0x2]
    mov r1, #0x144
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
.L_48:
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    ldr r2, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022592c0
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, r5, r6, pc}
.L_78:
    bl func_ov002_0225930c
    cmp r0, #0x0
    beq .L_d8
    ldr r0, _LIT2
    ldr r2, [r0, #0xd74]
    ldr r1, [r0, #0xd78]
    ldr r5, [r0, #0xd70]
    add r6, r2, r1
    mov r0, r5
    mov r1, r6
    bl func_ov002_021d8680
    and r1, r5, #0xff
    and r0, r6, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r1, r0, lsl #0x10
    mov r0, r4
    mov r1, r1, lsr #0x10
    bl func_ov002_0223d9e0
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, r5, r6, pc}
.L_d8:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    sub r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, r5, r6, pc}
.L_f0:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word func_ov002_02244a20
_LIT2: .word data_ov002_022d008c
