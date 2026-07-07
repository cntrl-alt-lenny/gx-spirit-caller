; func_ov002_02244da4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern func_ov002_021ae320
        .extern func_ov002_021d8680
        .extern func_ov002_0223d9e0
        .extern func_ov002_0223f4cc
        .extern func_ov002_02244d3c
        .extern func_ov002_02259274
        .extern func_ov002_0225930c
        .global func_ov002_02244da4
        .arm
func_ov002_02244da4:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r2, _LIT0
    mov r4, r0
    ldr r0, [r2, #0x5b8]
    cmp r0, #0xa
    bgt .L_38
    bge .L_64
    cmp r0, #0x1
    bgt .L_120
    cmp r0, #0x0
    blt .L_120
    cmpne r0, #0x1
    beq .L_44
    b .L_120
.L_38:
    cmp r0, #0xb
    beq .L_a8
    b .L_120
.L_44:
    mov r0, r4
    bl func_ov002_0223f4cc
    cmp r0, #0x0
    ldrne r0, _LIT0
    movne r1, #0xa
    strne r1, [r0, #0x5b8]
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_64:
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02259274
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, r5, r6, pc}
.L_a8:
    bl func_ov002_0225930c
    cmp r0, #0x0
    beq .L_108
    ldr r0, _LIT3
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
.L_108:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    sub r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, r5, r6, pc}
.L_120:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000145
_LIT2: .word func_ov002_02244d3c
_LIT3: .word data_ov002_022d008c
