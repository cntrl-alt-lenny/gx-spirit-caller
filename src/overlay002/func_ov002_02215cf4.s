; func_ov002_02215cf4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cdc88
        .extern data_ov002_022ce288
        .extern data_ov002_022cf288
        .extern func_ov002_021ae400
        .extern func_ov002_021bc618
        .extern func_ov002_021ca0d4
        .extern func_ov002_021e286c
        .extern func_ov002_0225368c
        .extern func_ov002_0226b054
        .extern func_ov002_0227adb8
        .global func_ov002_02215cf4
        .arm
func_ov002_02215cf4:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5a8]
    sub r0, r0, #0x7d
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_144
    b .L_12c
    b .L_110
    b .L_ec
    b .L_30
.L_30:
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca0d4
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc618
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x23
    beq .L_ac
    mov r0, r0, lsl #0x1f
    mov r1, r0, lsr #0x1f
    ldr r0, _LIT1
    and r1, r1, #0x1
    mul r2, r1, r0
    ldr r0, _LIT2
    ldr r0, [r0, r2]
    mov r0, r0, lsr #0x10
    tst r0, #0x1
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
.L_ac:
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225368c
    cmp r0, #0x0
    movne r0, #0x7f
    ldmneia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r1, #0xd
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_ec:
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT3
    mov r2, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_0227adb8
    mov r0, #0x7d
    ldmia sp!, {r4, pc}
.L_110:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226b054
    mov r0, #0x7d
    ldmia sp!, {r4, pc}
.L_12c:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e286c
    mov r0, #0x7c
    ldmia sp!, {r4, pc}
.L_144:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf288
_LIT3: .word data_ov002_022cdc88
