; func_ov002_022441fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern func_ov002_021afa94
        .extern func_ov002_021afac0
        .extern func_ov002_021c2d54
        .extern func_ov002_0220af14
        .extern func_ov002_0223dd14
        .extern func_ov002_0223f938
        .global func_ov002_022441fc
        .arm
func_ov002_022441fc:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r2, _LIT0
    mov r4, r0
    ldr r2, [r2, #0x5b8]
    mov r5, r1
    cmp r2, #0x0
    beq .L_30
    cmp r2, #0x1
    beq .L_40
    cmp r2, #0x2
    beq .L_50
    b .L_108
.L_30:
    bl func_ov002_0220af14
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
.L_40:
    mov r0, r4
    mov r1, r5
    bl func_ov002_0223f938
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_50:
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c2d54
    cmp r0, #0x0
    blt .L_108
    ldrh r1, [r4, #0x2]
    ldr r5, _LIT2
    ldr r2, _LIT3
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    and r3, r1, #0x1
    mla r2, r3, r2, r5
    add r2, r2, #0x18
    add r2, r2, #0x400
    ldr r3, [r2, r0, lsl #0x2]
    mov r0, r4
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r3, r2, r3, lsr #0x1f
    mov r2, #0xe
    bl func_ov002_0223dd14
    bl func_ov002_021afa94
    mov r7, r0
    bl func_ov002_021afac0
    mov r6, r0
    bl func_ov002_021afa94
    mov r5, r0
    bl func_ov002_021afa94
    ldr r1, [r7]
    mov r2, r6
    mov r1, r1, lsl #0x12
    mov r1, r1, lsr #0x1f
    ldr r3, [r5]
    mov ip, r0
    mov r0, r4
    mov r4, r3, lsl #0x12
    ldr r3, [ip]
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    add r3, r3, r4, lsr #0x1f
    bl func_ov002_0223dd14
.L_108:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x000012e5
_LIT2: .word data_ov002_022cf08c
_LIT3: .word 0x00000868
