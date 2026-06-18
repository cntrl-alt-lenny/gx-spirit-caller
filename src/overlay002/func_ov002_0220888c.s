; func_ov002_0220888c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf1ac
        .global func_ov002_0220888c
        .arm
func_ov002_0220888c:
    ldrh r1, [r0, #0x2]
    ldr r0, _LIT0
    ldr r3, _LIT1
    mov r2, r1, lsl #0x1f
    mov r2, r2, lsr #0x1f
    mov r1, r1, lsl #0x1a
    and ip, r2, #0x1
    mov r2, r1, lsr #0x1b
    mov r1, #0x14
    mul r1, r2, r1
    mla r0, ip, r0, r3
    ldr r1, [r1, r0]
    mov r0, r1, lsr #0x10
    tst r0, #0x1
    bne .L_48
    mov r0, r1, lsr #0x11
    tst r0, #0x1
    beq .L_50
.L_48:
    mov r0, #0x1
    bx lr
.L_50:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1ac
