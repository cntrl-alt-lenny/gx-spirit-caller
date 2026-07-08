; func_ov002_021f8258 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern func_ov002_021ae320
        .extern func_ov002_021d90f0
        .extern func_ov002_021f40a4
        .extern func_ov002_021f81c8
        .extern func_ov002_022592c0
        .extern func_ov002_0225930c
        .extern func_ov002_0229ce00
        .global func_ov002_021f8258
        .arm
func_ov002_021f8258:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x100
    mov r4, r0
    ldrh r2, [r4, #0x2]
    mov r1, r2, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x23
    addeq sp, sp, #0x100
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT0
    ldr r1, [r1, #0x5b4]
    cmp r1, #0x0
    beq .L_4c
    cmp r1, #0x1
    beq .L_9c
    cmp r1, #0x2
    beq .L_cc
    b .L_130
.L_4c:
    bl func_ov002_021f40a4
    mov r2, r0
    add r0, sp, #0x0
    mov r1, #0x11c
    bl func_ov002_0229ce00
    ldrh r0, [r4, #0x2]
    add r1, sp, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    mov r0, r4
    bl func_ov002_021f40a4
    strh r0, [r4, #0xc]
    ldr r1, _LIT0
    add sp, sp, #0x100
    ldr r2, [r1, #0x5b4]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, pc}
.L_9c:
    ldrh r1, [r4]
    mov r0, r2, lsl #0x1f
    ldr r2, _LIT1
    mov r0, r0, lsr #0x1f
    bl func_ov002_022592c0
    ldr r1, _LIT0
    add sp, sp, #0x100
    ldr r2, [r1, #0x5b4]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, pc}
.L_cc:
    bl func_ov002_0225930c
    cmp r0, #0x0
    beq .L_114
    ldr r0, _LIT2
    mvn r2, #0x0
    ldr r3, [r0, #0xd74]
    ldr r1, [r0, #0xd78]
    ldr r0, [r0, #0xd70]
    add r1, r3, r1
    bl func_ov002_021d90f0
    ldrh r0, [r4, #0xc]
    sub r0, r0, #0x1
    strh r0, [r4, #0xc]
    ldrh r0, [r4, #0xc]
    cmp r0, #0x0
    addeq sp, sp, #0x100
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
.L_114:
    ldr r1, _LIT0
    add sp, sp, #0x100
    ldr r2, [r1, #0x5b4]
    mov r0, #0x0
    sub r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, pc}
.L_130:
    mov r0, #0x0
    add sp, sp, #0x100
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word func_ov002_021f81c8
_LIT2: .word data_ov002_022d008c
