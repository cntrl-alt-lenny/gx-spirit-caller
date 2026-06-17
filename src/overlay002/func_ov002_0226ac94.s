; func_ov002_0226ac94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd73c
        .extern data_ov002_022cd968
        .extern data_ov002_022d016c
        .global func_ov002_0226ac94
        .arm
func_ov002_0226ac94:
    ldr r1, _LIT0
    mov r0, #0x1
    str r0, [r1, #0xd90]
    mov r0, #0x0
    str r0, [r1, #0xd9c]
    str r0, [r1, #0xd8c]
    ldr r0, _LIT1
    ldr r2, [r1, #0xd94]
    ldr r0, [r0, #0x4]
    eor r0, r0, #0x1
    cmp r2, r0
    bxne lr
    ldr r0, [r1, #0xd0c]
    cmp r0, #0x0
    bxeq lr
    ldr r0, _LIT2
    mov r2, #0x2
    ldr r3, [r0, #0x300]
    bic r3, r3, #0x200
    str r3, [r0, #0x300]
    str r2, [r1, #0xd8c]
    bx lr
_LIT0: .word data_ov002_022d016c
_LIT1: .word data_ov002_022cd73c
_LIT2: .word data_ov002_022cd968
