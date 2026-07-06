; func_ov002_022084b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0170
        .extern func_0202e1e0
        .extern func_ov002_021ff2cc
        .global func_ov002_022084b0
        .arm
func_ov002_022084b0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r0, [r5, #0x2]
    mov r4, r1
    mov r1, r0, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x16
    bne .L_bc
    ldr r1, [r5, #0x14]
    mov r0, r0, lsl #0x1f
    mov r2, r1, lsl #0x16
    mov r0, r0, lsr #0x1f
    mov r2, r2, lsr #0x1f
    rsb r0, r0, #0x1
    cmp r2, r0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r1, lsl #0x9
    mov r0, r0, lsr #0x1c
    cmp r0, #0xe
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r1, r1, lsl #0x17
    ldr r0, _LIT0
    mov r1, r1, lsr #0x15
    ldrh r0, [r0, r1]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e1e0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r5, #0x2]
    ldr r1, [r5, #0x14]
    mov r1, r1, lsl #0x17
    mov r0, r0, lsl #0x1f
    mov r1, r1, lsr #0x17
    mov r0, r0, lsr #0x1f
    and r1, r1, #0x1
    rsb r0, r0, #0x1
    cmp r1, r0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021ff2cc
    ldmia sp!, {r3, r4, r5, pc}
.L_bc:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022d0170
