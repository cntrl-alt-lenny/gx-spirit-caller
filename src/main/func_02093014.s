; func_02093014 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a6630
        .extern data_021a6638
        .extern func_02092e90
        .global func_02093014
        .arm
func_02093014:
    ldr r0, _LIT0
    ldr r1, [r0]
    cmp r1, #0x2600000
    bcc .L_11c
    cmp r1, #0x2800000
    ldrcc r0, _LIT1
    strcc r1, [r0]
    bcc .L_128
.L_11c:
    ldr r0, _LIT1
    mov r1, #0x0
    str r1, [r0]
.L_128:
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
_LIT1: .word data_021a6638
_LIT2: .word func_02092e90
_LIT3: .word 0x027e3000
_LIT4: .word data_021a6630
