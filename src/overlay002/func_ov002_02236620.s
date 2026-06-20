; func_ov002_02236620 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern func_ov002_021ca5bc
        .extern func_ov002_021d7c1c
        .extern func_ov002_021df818
        .global func_ov002_02236620
        .arm
func_ov002_02236620:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r2, [r1, #0x5a8]
    cmp r2, #0x7e
    beq .L_8e0
    cmp r2, #0x7f
    beq .L_844
    cmp r2, #0x80
    mov r0, #0x0
    bne .L_908
    str r0, [r1, #0x5ac]
.L_844:
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mul ip, r3, r1
    ldr r1, [r2, ip]
    cmp r1, #0x0
    beq .L_8d8
    ldr r1, _LIT3
    mov r2, #0x0
    add r1, r1, ip
    add r1, r1, #0x120
    bl func_ov002_021d7c1c
    ldrh r1, [r4, #0x2]
    ldr r2, _LIT3
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    and r1, r1, #0x1
    mla r0, r1, r0, r2
    ldr r1, [r0, #0x120]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    bl func_ov002_021ca5bc
    cmp r0, #0x0
    beq .L_8d0
    ldr r0, _LIT0
    ldr r1, [r0, #0x5ac]
    add r1, r1, #0x1
    str r1, [r0, #0x5ac]
.L_8d0:
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_8d8:
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_8e0:
    ldr r3, [r1, #0x5ac]
    mov r1, #0xc8
    ldrh r4, [r4, #0x2]
    mul r2, r3, r1
    mov r1, r4, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_021df818
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_908:
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf178
_LIT3: .word data_ov002_022cf16c
