; func_ov002_0226c6a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .global func_ov002_0226c6a8
        .arm
func_ov002_0226c6a8:
    ldr r3, _LIT0
    add ip, r1, r2
    ldr r1, [r3, #0xd94]
    cmp r0, r1
    movne r0, #0x0
    bxne lr
    cmp ip, #0x4
    movgt r0, #0x0
    bxgt lr
    ldr r1, _LIT1
    ldr r2, _LIT2
    and r0, r0, #0x1
    mla r1, r0, r1, r2
    mov r0, #0x14
    mla r0, ip, r0, r1
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    movne r0, #0x800
    moveq r0, #0x0
    bx lr
_LIT0: .word data_ov002_022d016c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf16c
