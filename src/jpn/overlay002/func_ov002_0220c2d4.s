; func_ov002_0220c2d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf0c0
        .extern func_ov002_021b8614
        .global func_ov002_0220c2d4
        .arm
func_ov002_0220c2d4:
    stmdb sp!, {r4, lr}
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r3, [r0, #0x2]
    ldr r2, _LIT0
    ldr lr, _LIT1
    mov ip, r3, lsl #0x1f
    mov ip, ip, lsr #0x1f
    and r4, ip, #0x1
    mov r3, r3, lsl #0x1a
    mov ip, r3, lsr #0x1b
    mov r3, #0x14
    mul r3, ip, r3
    mla r2, r4, r2, lr
    ldrh r2, [r3, r2]
    cmp r2, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r2, [r0, #0x4]
    mov r0, r1
    mov r1, r2, lsl #0x11
    mov r1, r1, lsr #0x17
    bl func_ov002_021b8614
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0c0
