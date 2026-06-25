; func_ov002_021bbe70 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .global func_ov002_021bbe70
        .arm
func_ov002_021bbe70:
    ldr r2, _LIT0
    ldr r1, _LIT1
    and r0, r0, #0x1
    mla r1, r0, r1, r2
    mov r0, #0x0
    mov r2, r0
    add r3, r1, #0x30
.L_c0:
    ldr r1, [r3]
    add r2, r2, #0x1
    mov r1, r1, lsl #0x13
    movs r1, r1, lsr #0x13
    addne r0, r0, #0x1
    cmp r2, #0x5
    add r3, r3, #0x14
    blt .L_c0
    bx lr
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
