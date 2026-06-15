; func_02022540 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02197434
        .global func_02022540
        .arm
func_02022540:
    ldr r2, _LIT0
    mov r3, #0x1
.L_8:
    add r1, r2, r3, lsl #0x4
    ldr r1, [r1, #0x48]
    cmp r1, #0x0
    blt .L_24
    add r3, r3, #0x1
    cmp r3, #0x100
    blt .L_8
.L_24:
    cmp r3, #0x100
    mvnge r0, #0x0
    addlt r1, r2, r3, lsl #0x4
    strlt r0, [r1, #0x48]
    movlt r0, r3
    bx lr
_LIT0: .word data_02197434
