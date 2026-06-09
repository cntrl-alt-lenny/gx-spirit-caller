; func_ov002_0226d814 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_0226d814
        .arm
func_ov002_0226d814:
    ldr r1, _LIT0
    cmp r0, r1
    beq .L_304
    ldr r1, _LIT1
    cmp r0, r1
    beq .L_30c
    add r1, r1, #0xc0
    cmp r0, r1
    beq .L_314
    b .L_31c
.L_304:
    mov r0, #0x2
    bx lr
.L_30c:
    mov r0, #0x3
    bx lr
.L_314:
    mov r0, #0x3
    bx lr
.L_31c:
    mov r0, #0x1
    bx lr
_LIT0: .word 0x000017c6
_LIT1: .word 0x000019a5
