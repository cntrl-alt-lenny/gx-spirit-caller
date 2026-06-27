; func_ov002_021f14b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern func_ov002_021c1e10
        .global func_ov002_021f14b8
        .arm
func_ov002_021f14b8:
    stmdb sp!, {r3, lr}
    ldr r3, _LIT0
    and lr, r1, #0x1
    mov ip, #0x14
    mul r3, lr, r3
    ldr lr, _LIT1
    mul ip, r2, ip
    add lr, lr, r3
    add lr, lr, ip
    ldr lr, [lr, #0x30]
    mov lr, lr, lsl #0x13
    movs lr, lr, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldrh lr, [r0, #0x2]
    mov lr, lr, lsl #0x1f
    cmp r1, lr, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr lr, _LIT2
    add r3, lr, r3
    ldrh r3, [ip, r3]
    cmp r3, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    bl func_ov002_021c1e10
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
