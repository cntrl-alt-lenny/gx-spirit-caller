; func_0203a150 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0203a150
        .arm
func_0203a150:
    cmp r0, #0x0
    bxeq lr
    mov r3, #0x0
    str r3, [r0]
    mov r3, #0x2
    strb r3, [r0, #0x58]
    ldr ip, [r0, #0x14]
    ldr r3, _LIT0
    cmp ip, r3
    beq .L_14e8
    tst r2, #0x8000
    beq .L_14f0
.L_14e8:
    mov r3, #0x1
    strb r3, [r0, #0x58]
.L_14f0:
    stmib r0, {r1, r2}
    bx lr
_LIT0: .word 0x0000ffff
