; func_ov002_0223a94c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern func_ov002_021de910
        .extern func_ov002_021de9d4
        .extern func_ov002_021e286c
        .extern func_ov002_021e2bd4
        .extern func_ov002_021e2c5c
        .extern func_ov002_02210104
        .global func_ov002_0223a94c
        .arm
func_ov002_0223a94c:
    stmdb sp!, {r4, lr}
    ldr r2, _LIT0
    mov r4, r0
    ldr r3, [r2, #0x5a8]
    cmp r3, #0x7f
    beq .L_2c
    cmp r3, #0x80
    bne .L_108
    bl func_ov002_02210104
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_2c:
    ldrh r0, [r4, #0x2]
    ldrh r3, [r4, #0x4]
    ldr lr, _LIT1
    mov r1, r0, lsl #0x1f
    mov ip, r1, lsr #0x1f
    mov r1, r0, lsl #0x1a
    ldr r0, _LIT2
    and ip, ip, #0x1
    mla lr, ip, r0, lr
    mov r1, r1, lsr #0x1b
    mov r0, #0x14
    mul r0, r1, r0
    add r1, lr, #0x30
    ldr r1, [r1, r0]
    mov r3, r3, lsl #0x11
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    mov r3, r3, lsr #0x17
    add r0, r0, r1, lsr #0x1f
    cmp r3, r0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, [r2, #0x484]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_ov002_021e2bd4
    ldr r0, _LIT0
    ldrh r1, [r4, #0x2]
    ldr r0, [r0, #0x484]
    add r0, r0, #0x1
    cmp r0, #0x4
    mov r0, r4
    blt .L_d4
    mov r2, r1, lsl #0x1a
    mov r3, r1, lsl #0x1f
    mov r1, r3, lsr #0x1f
    mov r2, r2, lsr #0x1b
    bl func_ov002_021de910
    b .L_fc
.L_d4:
    mov r2, r1, lsl #0x1a
    mov r3, r1, lsl #0x1f
    mov r1, r3, lsr #0x1f
    mov r2, r2, lsr #0x1b
    bl func_ov002_021de9d4
    ldrh r0, [r4, #0x4]
    mov r0, r0, lsl #0x11
    mov r0, r0, lsr #0x17
    and r0, r0, #0x1
    bl func_ov002_021e286c
.L_fc:
    bl func_ov002_021e2c5c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_108:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00000868
