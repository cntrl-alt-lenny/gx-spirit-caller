; func_02073df0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ee08
        .extern data_0219ee3c
        .global func_02073df0
        .arm
func_02073df0:
    mvn r1, #0x0
    cmp r0, r1
    mov ip, #0x1
    beq .L_3c
    ldr r1, _LIT0
    cmp r0, r1
    beq .L_3c
    ldr r2, _LIT1
    ldr r1, _LIT2
    ldr r3, [r2]
    ldr r1, [r1]
    and r2, r0, r3
    and r0, r1, r3
    cmp r2, r0
    movne ip, #0x0
.L_3c:
    mov r0, ip
    bx lr
_LIT0: .word 0x7f000001
_LIT1: .word data_0219ee08
_LIT2: .word data_0219ee3c
