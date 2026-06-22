; func_ov002_02214738 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021d5f2c
        .extern func_ov002_0220e74c
        .extern func_ov002_0223de94
        .extern func_ov002_0223df38
        .extern func_ov002_0225764c
        .global func_ov002_02214738
        .arm
func_ov002_02214738:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldrh r2, [r4, #0xc]
    cmp r2, #0x1
    beq .L_20
    cmp r2, #0x2
    beq .L_28
    b .L_10c
.L_20:
    bl func_ov002_0220e74c
    ldmia sp!, {r3, r4, r5, pc}
.L_28:
    ldrh r1, [r4, #0x2]
    ldrh r3, [r4, #0x4]
    ldr ip, _LIT0
    mov r2, r1, lsl #0x1f
    mov r5, r2, lsr #0x1f
    mov r2, r1, lsl #0x1a
    ldr r1, _LIT1
    and r5, r5, #0x1
    mla ip, r5, r1, ip
    mov r2, r2, lsr #0x1b
    mov r1, #0x14
    mul r1, r2, r1
    add r2, ip, #0x30
    ldr r2, [r2, r1]
    mov r3, r3, lsl #0x11
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    mov r3, r3, lsr #0x17
    add r1, r1, r2, lsr #0x1f
    cmp r3, r1
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r1, #0x0
    mov r2, r1
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_104
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_0223de94
    mov r5, r0
    mov r0, r5, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r2, r0, asr #0x8
    mov r0, r4
    and r1, r5, #0xff
    and r2, r2, #0xff
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_104
    ldrh r1, [r4, #0x2]
    mov r0, r5, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r2, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    mov r2, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    and r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1, lsl #0x8
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021d5f2c
.L_104:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_10c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
