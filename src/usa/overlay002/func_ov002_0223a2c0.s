; func_ov002_0223a2c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern func_ov002_021bc47c
        .extern func_ov002_021d46ac
        .global func_ov002_0223a2c0
        .arm
func_ov002_0223a2c0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r4, [r5, #0x2]
    ldr r1, _LIT0
    ldrh r3, [r5, #0x4]
    mov r0, r4, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mov ip, r4, lsl #0x1a
    mul r1, r2, r1
    ldr r4, _LIT1
    mov ip, ip, lsr #0x1b
    mov r2, #0x14
    mul r2, ip, r2
    add r4, r4, r1
    add r4, r4, #0x30
    mov ip, r3, lsl #0x11
    ldr r4, [r4, r2]
    mov ip, ip, lsr #0x17
    mov r3, r4, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r4, r4, lsl #0x12
    mov r3, r3, lsl #0x1
    add r3, r3, r4, lsr #0x1f
    cmp ip, r3
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r3, _LIT2
    add r1, r3, r1
    ldrh r1, [r2, r1]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r1, [r5, #0x6]
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x18
    beq .L_108
    ldrh r1, [r5, #0x8]
    mov r1, r1, asr #0x8
    and r4, r1, #0xff
    mov r1, r4
    bl func_ov002_021bc47c
    cmp r0, #0x0
    beq .L_108
    ldrh r0, [r5, #0x2]
    ldrh r1, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    movs r2, r0, lsr #0x1f
    mov r1, r1, lsl #0x1a
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x3d
    mov r0, r0, lsl #0x10
    mov r1, r1, lsr #0x1b
    and r5, r2, #0xff
    and r2, r1, #0xff
    and r1, r4, #0xff
    orr r3, r5, r2, lsl #0x8
    orr r2, r5, r1, lsl #0x8
    mov r1, r3, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, #0x0
    bl func_ov002_021d46ac
.L_108:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
