; func_0206e33c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0206e33c
        .arm
func_0206e33c:
    ldr r2, [r0, #0x64]
    mov r3, #0x0
    cmp r2, #0x0
    beq .L_100
    ldrsb r1, [r0, #0x73]
    cmp r1, #0x1
    bne .L_e4
    ldr r0, [r2, #0x104]
    cmp r0, #0x0
    ldrneh r3, [r0, #0x4]
    b .L_100
.L_e4:
    cmp r1, #0x0
    beq .L_f4
    cmp r1, #0x4
    bne .L_100
.L_f4:
    ldr r1, [r0, #0x44]
    ldr r0, [r2, #0xf8]
    sub r3, r1, r0
.L_100:
    mov r0, r3
    bx lr
