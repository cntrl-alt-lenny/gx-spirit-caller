; func_ov002_0228dc18 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_0202b89c
        .global func_ov002_0228dc18
        .arm
func_ov002_0228dc18:
    stmdb sp!, {r3, lr}
    ldr r2, _LIT0
    ldr r3, _LIT1
    and r0, r0, #0x1
    mla r2, r0, r2, r3
    mov r0, #0x14
    mla r0, r1, r0, r2
    ldr r1, [r0, #0x30]
    ldr r0, _LIT2
    mov r1, r1, lsl #0x13
    cmp r0, r1, lsr #0x13
    mov r0, r1, lsr #0x13
    ldreq r0, _LIT3
    ldmeqia sp!, {r3, pc}
    bl func_0202b89c
    ldr r1, _LIT4
    sub r0, r1, r0
    ldmia sp!, {r3, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x000017de
_LIT3: .word 0x00004e20
_LIT4: .word 0x00002710
