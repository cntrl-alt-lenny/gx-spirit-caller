; func_02092f2c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a6550
        .extern data_021a6558
        .extern func_02092da8
        .global func_02092f2c
        .arm
func_02092f2c:
    ldr r0, _LIT0
    ldr r1, [r0]
    cmp r1, #0x2600000
    bcc .L_20
    cmp r1, #0x2800000
    ldrcc r0, _LIT1
    strcc r1, [r0]
    bcc .L_2c
.L_20:
    ldr r0, _LIT1
    mov r1, #0x0
    str r1, [r0]
.L_2c:
    ldr r0, _LIT1
    ldr r0, [r0]
    cmp r0, #0x0
    ldreq r2, _LIT2
    ldreq r1, _LIT0
    ldreq r0, _LIT3
    streq r2, [r1]
    streq r2, [r0, #0xfdc]
    ldr r0, _LIT4
    mov r1, #0x0
    str r1, [r0]
    bx lr
_LIT0: .word 0x027ffd9c
_LIT1: .word data_021a6558
_LIT2: .word func_02092da8
_LIT3: .word 0x027e3000
_LIT4: .word data_021a6550
