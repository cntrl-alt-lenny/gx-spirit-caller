; func_ov002_022627ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cb96c
        .extern data_ov002_022d016c
        .global func_ov002_022627ac
        .arm
func_ov002_022627ac:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    ldr r2, _LIT1
    ldr r1, [r1, #0xd2c]
    ldr r1, [r2, r1, lsl #0x2]
    cmp r1, #0x0
    beq .L_6aa8
    blx r1
    cmp r0, #0x0
    beq .L_6aa0
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0xd30]
    ldr r1, [r0, #0xd2c]
    add r1, r1, #0x1
    str r1, [r0, #0xd2c]
.L_6aa0:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_6aa8:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word data_ov002_022cb96c
