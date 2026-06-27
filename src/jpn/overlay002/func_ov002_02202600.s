; func_ov002_02202600 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern func_ov002_021b3ef8
        .global func_ov002_02202600
        .arm
func_ov002_02202600:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r1, [r4, #0x2]
    mov r0, r1, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0xd
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldrh r2, [r4]
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r3, #0x0
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldrh r2, [r4, #0x2]
    ldr r0, _LIT0
    ldr r1, [r0]
    mov r3, r2, lsl #0x1f
    cmp r1, r3, lsr #0x1f
    ldreq r1, [r0, #0x1c]
    moveq r0, r2, lsl #0x1a
    cmpeq r1, r0, lsr #0x1b
    beq .L_90
    ldr r0, _LIT0
    ldr r1, [r0, #0x4]
    cmp r1, r3, lsr #0x1f
    bne .L_98
    ldrh r1, [r4, #0x2]
    ldr r2, [r0, #0x20]
    mov r0, r1, lsl #0x1a
    cmp r2, r0, lsr #0x1b
    bne .L_98
.L_90:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_98:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cd314
