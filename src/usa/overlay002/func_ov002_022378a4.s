; func_ov002_022378a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern func_ov002_021bc538
        .extern func_ov002_021bc5e4
        .extern func_ov002_021ca1d8
        .extern func_ov002_021ca310
        .extern func_ov002_021d58dc
        .extern func_ov002_0220e428
        .extern func_ov002_0221ff48
        .extern func_ov002_0227acc8
        .global func_ov002_022378a4
        .arm
func_ov002_022378a4:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldrh r2, [r4, #0xc]
    cmp r2, #0x1
    beq .L_2c
    cmp r2, #0x2
    beq .L_38
    cmp r2, #0x3
    beq .L_48
    b .L_20c
.L_2c:
    bl func_ov002_0221ff48
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
.L_38:
    bl func_ov002_0220e428
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_48:
    ldr r0, _LIT0
    ldr r1, [r0, #0x5a8]
    cmp r1, #0x7f
    beq .L_1c0
    cmp r1, #0x80
    bne .L_200
    ldrh ip, [r4, #0x2]
    ldr r1, _LIT1
    ldrh r3, [r4, #0x4]
    mov r0, ip, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mov lr, ip, lsl #0x1a
    mul r1, r2, r1
    ldr ip, _LIT2
    mov lr, lr, lsr #0x1b
    mov r2, #0x14
    mul r2, lr, r2
    add ip, ip, r1
    add ip, ip, #0x30
    mov lr, r3, lsl #0x11
    ldr ip, [ip, r2]
    mov lr, lr, lsr #0x17
    mov r3, ip, lsl #0x2
    mov r3, r3, lsr #0x18
    mov ip, ip, lsl #0x12
    mov r3, r3, lsl #0x1
    add r3, r3, ip, lsr #0x1f
    cmp lr, r3
    addne sp, sp, #0x8
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r3, _LIT3
    add r1, r3, r1
    ldrh r1, [r2, r1]
    cmp r1, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_ov002_021bc538
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca1d8
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca310
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r2, #0x0
    sub r0, r2, #0x2000
    and r0, r0, #0x0
    add r3, sp, #0x4
    orr r1, r0, #0xed
    orr r1, r1, #0x1900
    str r2, [r3]
    str r1, [sp, #0x4]
    ldrh r0, [r4, #0x2]
    bic r1, r1, #0x2000
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x12
    str r0, [sp, #0x4]
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc5e4
    ldr r2, _LIT0
    add r1, sp, #0x4
    str r0, [r2, #0x5ac]
    ldrh r3, [r4, #0x2]
    ldrh r0, [r4]
    mov r2, #0x1
    mov r4, r3, lsl #0x1f
    mov r3, r0, lsl #0x10
    mov r0, r4, lsr #0x1f
    orr r3, r3, #0x1
    bl func_ov002_0227acc8
    add sp, sp, #0x8
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_1c0:
    ldrh r2, [r4, #0x2]
    mov r1, #0x0
    mov r3, #0x6
    str r1, [sp]
    mov r2, r2, lsl #0x1f
    ldr r1, [r0, #0x5ac]
    mov r0, r2, lsr #0x1f
    ldrh r4, [r4, #0x2]
    and r2, r0, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1, lsl #0x8
    mov r4, r4, lsl #0x1a
    mov r2, r1, lsl #0x10
    mov r1, r4, lsr #0x1b
    mov r2, r2, lsr #0x10
    bl func_ov002_021d58dc
.L_200:
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_20c:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf08c
_LIT3: .word data_ov002_022cf0c4
_LIT4: .word 0x000019ed
