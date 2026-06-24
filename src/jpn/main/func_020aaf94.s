; func_020aaf94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020aaf94
        .arm
func_020aaf94:
    ldrsb r2, [r0], #0x1
    mov r1, r1, lsl #0x18
    mov r1, r1, asr #0x18
    cmp r2, #0x0
    beq .L_2c
.L_14:
    cmp r2, r1
    subeq r0, r0, #0x1
    bxeq lr
    ldrsb r2, [r0], #0x1
    cmp r2, #0x0
    bne .L_14
.L_2c:
    cmp r1, #0x0
    movne r0, #0x0
    subeq r0, r0, #0x1
    bx lr
