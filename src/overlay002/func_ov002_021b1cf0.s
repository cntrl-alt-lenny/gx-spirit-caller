; func_ov002_021b1cf0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022cd968
        .extern data_ov002_022d016c
        .global func_ov002_021b1cf0
        .arm
func_ov002_021b1cf0:
    ldr r0, _LIT0
    ldr r1, [r0, #0xd0c]
    cmp r1, #0x0
    beq .L_28
    ldr r1, [r0, #0xcec]
    ldr r0, _LIT1
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x2
    moveq r1, #0x1
    beq .L_2c
.L_28:
    mov r1, #0x0
.L_2c:
    ldr r0, _LIT2
    ldr r0, [r0, #0x300]
    mov r0, r0, lsl #0xd
    add r0, r1, r0, asr #0x1c
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    bx lr
_LIT0: .word data_ov002_022d016c
_LIT1: .word data_ov002_022cd744
_LIT2: .word data_ov002_022cd968
