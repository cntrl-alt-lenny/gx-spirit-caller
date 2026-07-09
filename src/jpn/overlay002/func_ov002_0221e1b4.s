; func_ov002_0221e1b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021ae320
        .extern func_ov002_021d864c
        .extern func_ov002_021de318
        .extern func_ov002_021e267c
        .extern func_ov002_021e7494
        .extern func_ov002_0225761c
        .extern func_ov002_022576f4
        .extern func_ov002_02257790
        .extern func_ov002_02259274
        .extern func_ov002_0225930c
        .extern func_ov002_0229ce00
        .global func_ov002_0221e1b4
        .arm
func_ov002_0221e1b4:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x100
    ldr r2, _LIT0
    mov r4, r0
    ldr r1, [r2, #0x5a8]
    sub r1, r1, #0x7c
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b .L_1d0
    b .L_1b4
    b .L_14c
    b .L_110
    b .L_84
    b .L_38
.L_38:
    ldr r1, _LIT1
    ldr r3, [r1, #0x14]
    ldr r1, [r1, #0x87c]
    add r1, r3, r1
    str r1, [r2, #0x5ac]
    bl func_ov002_0225761c
    mov r1, r0
    mov r0, r4
    bl func_ov002_021de318
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021e267c
    add sp, sp, #0x100
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_84:
    ldr r1, _LIT1
    mov r3, #0x0
    ldr lr, [r1, #0x14]
    ldr ip, [r1, #0x87c]
    ldr r1, [r2, #0x5ac]
    add ip, lr, ip
    sub r1, ip, r1
    str r1, [r2, #0x5ac]
    strh r3, [r4, #0xa]
    strh r3, [r4, #0x8]
    mov r1, #0x1
    strh r1, [r4, #0xc]
    ldr r1, [r2, #0x5ac]
    cmp r1, #0x0
    addle sp, sp, #0x100
    movle r0, r3
    ldmleia sp!, {r4, pc}
    bl func_ov002_022576f4
    cmp r0, #0x0
    addeq sp, sp, #0x100
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT0
    add r0, sp, #0x0
    ldr r2, [r1, #0x5ac]
    ldr r1, _LIT2
    bl func_ov002_0229ce00
    ldrh r0, [r4, #0x2]
    add r1, sp, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    add sp, sp, #0x100
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_110:
    ldr r1, _LIT3
    bl func_ov002_02257790
    cmp r0, #0x0
    addeq sp, sp, #0x100
    moveq r0, #0x7c
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    ldr r2, _LIT3
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02259274
    add sp, sp, #0x100
    mov r0, #0x7d
    ldmia sp!, {r4, pc}
.L_14c:
    bl func_ov002_0225930c
    cmp r0, #0x0
    beq .L_1a8
    ldr r1, _LIT4
    add ip, r4, #0x8
    ldr r0, [r1, #0xd70]
    ldr r2, [r1, #0xd74]
    mov r4, r0, lsl #0x1
    ldr r1, [r1, #0xd78]
    ldrh r3, [ip, r4]
    add r1, r2, r1
    mov r2, #0x1
    orr r2, r3, r2, lsl r1
    strh r2, [ip, r4]
    bl func_ov002_021d864c
    ldr r0, _LIT0
    add sp, sp, #0x100
    ldr r1, [r0, #0x5ac]
    subs r1, r1, #0x1
    str r1, [r0, #0x5ac]
    movne r0, #0x7e
    moveq r0, #0x7c
    ldmia sp!, {r4, pc}
.L_1a8:
    add sp, sp, #0x100
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_1b4:
    ldrh r2, [r4, #0x8]
    ldrh r1, [r4, #0xa]
    orr r1, r2, r1, lsl #0x10
    bl func_ov002_021de318
    add sp, sp, #0x100
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_1d0:
    mov r0, #0x0
    add sp, sp, #0x100
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x00000119
_LIT3: .word func_ov002_021e7494
_LIT4: .word data_ov002_022d008c
