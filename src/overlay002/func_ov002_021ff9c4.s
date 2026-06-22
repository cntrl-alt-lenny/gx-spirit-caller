; func_ov002_021ff9c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a2
        .extern func_ov002_021c1ef0
        .global func_ov002_021ff9c4
        .arm
func_ov002_021ff9c4:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r1, [r5, #0x2]
    mov r1, r1, lsl #0x14
    mov r1, r1, lsr #0x1a
    add r1, r1, #0xee
    add r1, r1, #0xff00
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    cmp r1, #0x1
    bhi .L_a4
    ldr r1, _LIT0
    ldr r3, _LIT1
    ldr r4, [r1]
    ldr r2, [r1, #0x1c]
    and ip, r4, #0x1
    mov r1, #0x14
    mul lr, ip, r3
    ldr r3, _LIT2
    mul r1, r2, r1
    add r3, r3, lr
    add r3, r3, r1
    ldr r3, [r3, #0x30]
    mov r3, r3, lsl #0x13
    movs r3, r3, lsr #0x13
    beq .L_a4
    ldr r3, _LIT3
    add r3, r3, lr
    ldrh r1, [r1, r3]
    cmp r1, #0x0
    bne .L_a4
    mov r1, r4
    bl func_ov002_021c1ef0
    cmp r0, #0x0
    beq .L_a4
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r4
    movne r0, #0x2
    ldmneia sp!, {r3, r4, r5, pc}
.L_a4:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cd3f4
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf16c
_LIT3: .word data_ov002_022cf1a2
