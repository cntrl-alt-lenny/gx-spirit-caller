; func_ov002_022079e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf26c
        .extern func_0202df78
        .extern func_ov002_021c23ac
        .global func_ov002_022079e4
        .arm
func_ov002_022079e4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT0
    ldr r2, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mul r1, r3, r1
    ldrh r1, [r2, r1]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r1, #0xa
    bl func_ov002_021c23ac
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r2, [r4, #0x2]
    ldr r0, _LIT0
    ldr r1, _LIT2
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mla r0, r2, r0, r1
    ldr r0, [r0, #0xf8]
    ldr r1, _LIT3
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202df78
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf26c
_LIT2: .word data_ov002_022cf16c
_LIT3: .word 0x000010f4
