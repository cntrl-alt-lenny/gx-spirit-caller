; func_02005b38 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103d6c
        .global func_02005b38
        .arm
func_02005b38:
    cmp r0, #0x1
    beq .L_220
    cmp r0, #0x2
    beq .L_22c
    b .L_238
.L_220:
    ldr r0, _LIT0
    ldr r0, [r0]
    b .L_23c
.L_22c:
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    b .L_23c
.L_238:
    mov r0, #0x0
.L_23c:
    add r0, r0, r1, lsl #0x5
    bx lr
_LIT0: .word data_02103d6c
