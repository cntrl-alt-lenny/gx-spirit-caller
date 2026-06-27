; func_ov002_021ff480 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d008c
        .global func_ov002_021ff480
        .arm
func_ov002_021ff480:
    stmdb sp!, {r3, lr}
    cmp r1, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    ldrh r3, [r0, #0x2]
    ldr r1, _LIT0
    mov ip, r3, lsl #0x1f
    ldr r2, [r1, #0xcec]
    mov lr, ip, lsr #0x1f
    cmp r2, ip, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r1, [r1, #0xcf8]
    cmp r1, #0x3
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    mov r1, r3, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0xe
    bne .L_68
    ldr r0, [r0, #0x14]
    mov r0, r0, lsl #0xa
    cmp lr, r0, lsr #0x1f
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_68:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d008c
