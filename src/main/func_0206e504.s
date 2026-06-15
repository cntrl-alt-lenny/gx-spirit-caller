; func_0206e504 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0206e504
        .arm
func_0206e504:
    ldr r2, [r0]
    cmp r2, #0x0
    beq .L_24
.L_c:
    cmp r2, r1
    bxeq lr
    add r0, r2, #0x7c
    ldr r2, [r2, #0x7c]
    cmp r2, #0x0
    bne .L_c
.L_24:
    mov r0, #0x0
    bx lr
