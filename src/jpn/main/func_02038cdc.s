; func_02038cdc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219c3c0
        .global func_02038cdc
        .arm
func_02038cdc:
    ldrb r0, [r0, #0x1f]
    mov r2, #0x0
    ldr r1, _LIT0
    add r2, r2, r0, lsl #0x1
    mov r0, #0xc
    mla r0, r2, r0, r1
    mov r2, #0x2
.L_b0:
    ldr r1, [r0, #0x4]
    cmp r1, #0x0
    bxeq lr
    sub r2, r2, #0x1
    cmp r2, #0x0
    add r0, r0, #0xc
    bgt .L_b0
    mov r0, #0x0
    bx lr
_LIT0: .word data_0219c3c0
