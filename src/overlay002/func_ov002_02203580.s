; func_ov002_02203580 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d016c
        .extern func_ov002_021b3ecc
        .extern func_ov002_021bc8c8
        .extern func_ov002_022536e8
        .global func_ov002_02203580
        .arm
func_ov002_02203580:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r3, [r4, #0x2]
    mov r0, r3, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    beq .L_48
    mov r0, r3, lsl #0x1f
    mov r2, r3, lsl #0x1a
    mov r1, r0, lsr #0x1f
    mov r0, r3, lsl #0x11
    eor r0, r1, r0, lsr #0x1f
    mov r2, r2, lsr #0x1b
    bl func_ov002_021bc8c8
    cmp r0, #0x0
    bne .L_bc
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_48:
    cmp r1, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r1, _LIT0
    mov r3, r3, lsl #0x1f
    ldr r2, [r1, #0xcec]
    mov r0, r3, lsr #0x1f
    cmp r2, r3, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r1, [r1, #0xd0]
    tst r1, #0x1
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldrh r2, [r4]
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022536e8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
.L_bc:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d016c
