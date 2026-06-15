; func_0209bf34 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021026a4
        .global func_0209bf34
        .arm
func_0209bf34:
    ldr r3, [r0]
    cmp r3, #0x64
    bcs .L_50
    ldr r2, [r0, #0x4]
    cmp r2, #0x1
    bcc .L_50
    cmp r2, #0xc
    bhi .L_50
    ldr r1, [r0, #0x8]
    cmp r1, #0x1
    bcc .L_50
    cmp r1, #0x1f
    bhi .L_50
    ldr r0, [r0, #0xc]
    cmp r0, #0x7
    bge .L_50
    cmp r2, #0x1
    bcc .L_50
    cmp r2, #0xc
    bls .L_58
.L_50:
    mvn r0, #0x0
    bx lr
.L_58:
    ldr r0, _LIT0
    sub r1, r1, #0x1
    ldr r0, [r0, r2, lsl #0x2]
    cmp r2, #0x3
    add r2, r1, r0
    bcc .L_78
    ands r0, r3, #0x3
    addeq r2, r2, #0x1
.L_78:
    ldr r0, _LIT1
    add r1, r3, #0x3
    mla r0, r3, r0, r2
    add r0, r0, r1, lsr #0x2
    bx lr
_LIT0: .word data_021026a4
_LIT1: .word 0x0000016d
