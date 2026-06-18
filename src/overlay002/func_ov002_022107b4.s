; func_ov002_022107b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern func_ov002_022536e8
        .global func_ov002_022107b4
        .arm
func_ov002_022107b4:
    stmdb sp!, {r3, lr}
    ldr r3, _LIT0
    ldr lr, [r3, #0x48c]
    ldrh ip, [lr, #0x2]
    mov r3, ip, lsl #0x11
    mov ip, ip, lsl #0x1f
    mov r3, r3, lsr #0x1f
    eor r3, r3, ip, lsr #0x1f
    cmp r0, r3
    cmpeq r1, #0xb
    bne .L_6fc
    ldrh r1, [lr]
    ldr r3, _LIT1
    cmp r1, r3
    ldreqh r1, [lr, #-24]
    bl func_ov002_022536e8
    cmp r0, #0x0
    movne r0, #0x800
    ldmneia sp!, {r3, pc}
.L_6fc:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x0000183e
