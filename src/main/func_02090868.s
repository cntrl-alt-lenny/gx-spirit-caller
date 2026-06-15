; func_02090868 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02090868
        .arm
func_02090868:
    ldr r3, _LIT0
    ldr r1, [r3]
    clz r2, r1
    cmp r2, #0x20
    movne r0, #0x40
    bne .L_34
    add r3, r3, #0x4
    ldr r1, [r3]
    clz r2, r1
    cmp r2, #0x20
    ldr r0, _LIT1
    bxeq lr
    mov r0, #0x60
.L_34:
    add r0, r0, r2
    mov r1, #-2147483648
    mov r1, r1, lsr r2
    ldr r2, [r3]
    bic r2, r2, r1
    str r2, [r3]
    bx lr
_LIT0: .word 0x027fffb0
_LIT1: .word 0xfffffffd
