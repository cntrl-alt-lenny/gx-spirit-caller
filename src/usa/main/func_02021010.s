; func_02021010 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_020c6798
        .extern data_02194260
        .extern func_02021ae4
        .global func_02021010
        .arm
func_02021010:
    stmdb sp!, {r4, lr}
    ldr r4, _LIT0
    ldr r2, _LIT1
    mov r1, r4
    mov r0, #0x0
    bl Fill32
    ldr r2, _LIT2
    mov r3, #0x0
.L_384:
    ldr r1, [r2, r3, lsl #0x2]
    add r0, r4, r3, lsl #0x2
    add r3, r3, #0x1
    str r1, [r0, #0x18]
    cmp r3, #0x7
    blt .L_384
    ldr r0, [r4, #0x18]
    bl func_02021ae4
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_02194260
_LIT1: .word 0x000030f4
_LIT2: .word data_020c6798
