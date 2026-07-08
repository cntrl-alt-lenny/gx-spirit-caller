; func_ov002_02214d68 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern func_ov002_021c4bbc
        .extern func_ov002_021d8fd0
        .extern func_ov002_0223de48
        .global func_ov002_02214d68
        .arm
func_ov002_02214d68:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x30
    mov r4, r0
    ldrh ip, [r4, #0x2]
    ldr r1, _LIT0
    ldrh r3, [r4, #0x4]
    mov r2, ip, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mov lr, ip, lsl #0x1a
    mul r1, r2, r1
    ldr ip, _LIT1
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
    addne sp, sp, #0x30
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r3, _LIT2
    add r1, r3, r1
    ldrh r1, [r2, r1]
    cmp r1, #0x0
    addeq sp, sp, #0x30
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    add r2, sp, #0x0
    mov r1, #0x0
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_154
    ldr ip, [sp]
    ldr r1, _LIT0
    and r0, ip, #0xff
    and r3, r0, #0x1
    mul r2, r3, r1
    mov r1, ip, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    ldr ip, _LIT1
    and r1, r1, #0xff
    mov r3, #0x14
    smulbb lr, r1, r3
    add r3, ip, r2
    add r3, r3, lr
    ldr r3, [r3, #0x30]
    mov r3, r3, lsl #0x13
    movs r3, r3, lsr #0x13
    beq .L_154
    ldr r3, _LIT2
    add r2, r3, r2
    ldrh r2, [lr, r2]
    cmp r2, #0x0
    beq .L_154
    add r2, sp, #0x4
    bl func_ov002_021c4bbc
    ldrh r1, [r4, #0x2]
    ldr r2, [sp, #0x24]
    ldr r0, _LIT3
    mov r4, r1, lsl #0x1f
    cmp r2, r0
    movgt r2, r0
    mov r1, r1, lsl #0x1a
    ldr r3, [sp, #0x20]
    ldr r0, _LIT3
    mov r1, r1, lsr #0x1b
    cmp r3, r0
    movgt r3, r0
    mov r0, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r2, r3, lsl #0x10
    mov r3, r0, lsl #0x10
    mov r0, r4, lsr #0x1f
    orr r2, r3, r2, lsr #0x10
    bl func_ov002_021d8fd0
.L_154:
    mov r0, #0x0
    add sp, sp, #0x30
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
_LIT3: .word 0x0000ffff
