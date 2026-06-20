; func_ov002_02209340 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf1ac
        .extern func_ov002_02208bfc
        .global func_ov002_02209340
        .arm
func_ov002_02209340:
    stmdb sp!, {r4, lr}
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
    ldr r3, [r3, r2]
    mov r2, r3, lsr #0x10
    tst r2, #0x1
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r2, r3, lsr #0x12
    tst r2, #0x1
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r2, r3, lsr #0x11
    tst r2, #0x1
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r2, r3, lsr #0x13
    tst r2, #0x1
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    bl func_ov002_02208bfc
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1ac
