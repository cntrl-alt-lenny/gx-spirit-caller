; func_ov002_022ae9c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d1410
        .extern func_ov002_022a82c4
        .global func_ov002_022ae9c0
        .arm
func_ov002_022ae9c0:
    strh r1, [r0]
    mov r3, #0x0
    str r3, [r0, #0x44]
    str r3, [r0, #0x3c]
    ldrh r1, [r0, #0x2]
    mvn r2, #0x0
    bic r1, r1, #0x3e
    orr r1, r1, #0x3e
    strh r1, [r0, #0x2]
    ldrh r1, [r0]
    cmp r1, #0x0
    beq .L_2c4
.L_2ac:
    add r1, r0, r3, lsl #0x2
    add r3, r3, #0x1
    str r2, [r1, #0x1c]
    cmp r3, #0x3
    blt .L_2ac
    b .L_2d8
.L_2c4:
    add r1, r0, r3, lsl #0x2
    add r3, r3, #0x1
    str r2, [r1, #0x1c]
    cmp r3, #0x3
    blt .L_2c4
.L_2d8:
    ldr ip, _LIT0
    ldr r0, _LIT1
    bx ip
_LIT0: .word func_ov002_022a82c4
_LIT1: .word data_ov002_022d1410
