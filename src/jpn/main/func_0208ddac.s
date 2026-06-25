; func_0208ddac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0208ddac
        .arm
func_0208ddac:
    mov r0, #0x4000000
    ldr r1, [r0]
    ldr r0, _LIT0
    and r1, r1, #0x7
    cmp r1, #0x5
    ldrh r2, [r0]
    blt .L_24
    ands r0, r2, #0x80
    bne .L_4c
.L_24:
    mov r0, #0x4000000
    ldr r1, [r0]
    and r0, r2, #0x3c
    and r1, r1, #0x7000000
    mov r1, r1, lsr #0x18
    mov r1, r1, lsl #0x10
    add r1, r1, #0x6000000
    mov r0, r0, lsr #0x2
    add r0, r1, r0, lsl #0xe
    bx lr
.L_4c:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x0400000c
