; func_0201d094 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0218feac
        .global func_0201d094
        .arm
func_0201d094:
    mov r0, #0x0
    ldr r2, _LIT0
    mov r3, r0
.L_78:
    ldr r1, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    cmp r1, #0x0
    addne r0, r0, #0x1
    cmp r3, #0x20
    blt .L_78
    bx lr
_LIT0: .word data_0218feac
