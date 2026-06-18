; func_ov002_0222c524 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf26c
        .extern func_ov002_0220e75c
        .global func_ov002_0222c524
        .arm
func_ov002_0222c524:
    stmdb sp!, {r3, lr}
    ldrh ip, [r0, #0x2]
    ldr r2, _LIT0
    ldr r3, _LIT1
    mov ip, ip, lsl #0x1f
    mov ip, ip, lsr #0x1f
    and ip, ip, #0x1
    mul lr, ip, r2
    ldrh r2, [r3, lr]
    cmp r2, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r3, _LIT2
    ldr r2, _LIT3
    add r3, r3, lr
    ldr r3, [r3, #0xf8]
    mov r3, r3, lsl #0x13
    mov r3, r3, lsr #0x13
    cmp r3, r2
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    bl func_ov002_0220e75c
    ldmia sp!, {r3, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf26c
_LIT2: .word data_ov002_022cf16c
_LIT3: .word 0x0000175e
