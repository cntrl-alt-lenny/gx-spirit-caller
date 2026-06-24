; func_02038220 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02038220
        .arm
func_02038220:
    strb r2, [r0, #0x2e]
    ldr r2, [sp]
    strb r3, [r0, #0x30]
    strb r2, [r0, #0x2f]
    ldrh r2, [r0, #0x68]
    bic r2, r2, #0x18
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    tst r2, #0x400
    movne r0, #0x0
    bxne lr
    tst r1, #0x1
    beq .L_44
    orr r1, r2, #0x10
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    b .L_5c
.L_44:
    tst r2, #0x17
    moveq r0, #0x0
    bxeq lr
    orr r1, r2, #0x8
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
.L_5c:
    strh r1, [r0, #0x68]
    mov r0, #0x1
    bx lr
