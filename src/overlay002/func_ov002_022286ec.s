; func_ov002_022286ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022d0250
        .extern func_0202e234
        .extern func_ov002_021b947c
        .extern func_ov002_021c33e4
        .extern func_ov002_021ff3bc
        .extern func_ov002_0227adb8
        .global func_ov002_022286ec
        .arm
func_ov002_022286ec:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    bl func_ov002_021ff3bc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, [r6, #0x14]
    bl func_ov002_021b947c
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r3, r0, lsr #0x10
    mov r2, r1, asr #0x8
    mov r1, r3, lsl #0x10
    and r2, r2, #0xff
    cmp r2, #0xe
    and r4, r0, #0xff
    mov r5, r1, lsr #0x10
    bne .L_2fc
    ldr r1, [r6, #0x14]
    ldr r0, _LIT0
    mov r1, r1, lsl #0x2
    ldrh r0, [r0, r1]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e234
    cmp r0, #0x0
    beq .L_2fc
    ldrh r0, [r6, #0x2]
    mov r1, r4
    mov r2, r5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c33e4
    cmp r0, #0x0
    beq .L_2fc
    ldr r2, _LIT1
    ldr r0, _LIT2
    and r1, r4, #0x1
    mla r0, r1, r0, r2
    ldrh r1, [r6, #0x2]
    ldrh r2, [r6]
    add r0, r0, #0x18
    mov r3, r1, lsl #0x1f
    add r1, r0, #0x400
    mov r0, r3, lsr #0x1f
    add r1, r1, r5, lsl #0x2
    mov r3, r2, lsl #0x10
    mov r2, #0x1
    bl func_ov002_0227adb8
.L_2fc:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022d0250
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00000868
