; func_ov002_022203e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022d0e6c
        .extern func_ov002_021b99b4
        .extern func_ov002_021bc618
        .extern func_ov002_021ca2b8
        .extern func_ov002_0225368c
        .extern func_ov002_0226b094
        .extern func_ov002_0226b174
        .extern func_ov002_0227adb8
        .global func_ov002_022203e4
        .arm
func_ov002_022203e4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, _LIT0
    ldr r0, [r0, #0x5a8]
    cmp r0, #0x7e
    beq .L_fc
    cmp r0, #0x7f
    beq .L_c4
    cmp r0, #0x80
    bne .L_150
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0225368c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bc618
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021ca2b8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226b094
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_c4:
    ldr r0, _LIT1
    ldrh r0, [r0, #0xb0]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226b174
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_fc:
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r4, r1, #0x1
    ldrh r1, [r0, #0xb0]
    mov r0, r4
    bl func_ov002_021b99b4
    ldr r3, _LIT2
    ldr r1, _LIT3
    and r2, r4, #0x1
    mla r1, r2, r1, r3
    add r1, r1, #0x18
    add r1, r1, #0x400
    add r1, r1, r0, lsl #0x2
    mov r0, r4
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov002_0227adb8
    mov r0, #0x7d
    ldmia sp!, {r4, pc}
.L_150:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022d0e6c
_LIT2: .word data_ov002_022cf16c
_LIT3: .word 0x00000868
