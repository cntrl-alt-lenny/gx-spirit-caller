; func_02095c78 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c3204
        .global func_02095c78
        .arm
func_02095c78:
    ldr r1, _LIT0
    cmp r0, r1
    movlt r0, r1
    blt .L_18
    cmp r0, #0x0
    movgt r0, #0x0
.L_18:
    ldr r1, _LIT1
    ldr r2, _LIT2
    add r3, r0, r1
    mvn r1, #0xef
    cmp r0, r1
    ldrb r2, [r2, r3]
    movlt r0, #0x3
    blt .L_58
    mvn r1, #0x77
    cmp r0, r1
    movlt r0, #0x2
    blt .L_58
    mvn r1, #0x3b
    cmp r0, r1
    movlt r0, #0x1
    movge r0, #0x0
.L_58:
    orr r0, r2, r0, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bx lr
_LIT0: .word 0xfffffd2d
_LIT1: .word 0x000002d3
_LIT2: .word data_020c3204
