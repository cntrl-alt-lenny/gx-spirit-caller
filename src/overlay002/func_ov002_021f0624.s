; func_ov002_021f0624 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .global func_ov002_021f0624
        .arm
func_ov002_021f0624:
    stmdb sp!, {r3, lr}
    cmp r2, #0x5
    movge r0, #0x0
    ldmgeia sp!, {r3, pc}
    ldr r3, _LIT0
    ldr ip, _LIT1
    and lr, r1, #0x1
    mla ip, lr, r3, ip
    mov r3, #0x14
    mla r3, r2, r3, ip
    ldr r3, [r3, #0x30]
    mov r3, r3, lsl #0x13
    movs r3, r3, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldrh r3, [r0, #0x2]
    mov r3, r3, lsl #0x14
    mov r3, r3, lsr #0x1a
    cmp r3, #0xf
    ldreq r0, [r0, #0x14]
    moveq r3, r0, lsl #0xf
    cmpeq r1, r3, lsr #0x1f
    moveq r0, r0, lsl #0xb
    cmpeq r2, r0, lsr #0x1c
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
