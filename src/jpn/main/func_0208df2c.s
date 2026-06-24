; func_0208df2c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0208df2c
        .arm
func_0208df2c:
    ldr r0, _LIT0
    mov r2, #0x4000000
    ldr r1, [r2]
    ldrh r3, [r0]
    ldr r0, [r2]
    and ip, r1, #0x7
    and r0, r0, #0x38000000
    mov r1, r0, lsr #0x1b
    and r0, r3, #0x1f00
    mov r2, r1, lsl #0x10
    cmp ip, #0x6
    mov r1, r0, lsr #0x8
    addls pc, pc, ip, lsl #0x2
    b .L_80
    b .L_54
    b .L_54
    b .L_54
    b .L_60
    b .L_60
    b .L_60
    b .L_78
.L_54:
    add r0, r2, #0x6000000
    add r0, r0, r1, lsl #0xb
    bx lr
.L_60:
    ands r0, r3, #0x80
    movne r0, r1, lsl #0xe
    addne r0, r0, #0x6000000
    addeq r0, r2, #0x6000000
    addeq r0, r0, r1, lsl #0xb
    bx lr
.L_78:
    mov r0, #0x0
    bx lr
.L_80:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x0400000e
