; func_020aabac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020aabac
        .arm
func_020aabac:
    cmp r2, #0x0
    beq .L_1268
    cmp r2, #0x1
    beq .L_1298
    cmp r2, #0x2
    beq .L_12c0
    b .L_12c8
.L_1268:
    ldr r1, [r0]
    ldrsb r2, [r1]
    cmp r2, #0x0
    bne .L_1288
    mov r1, #0x1
    str r1, [r0, #0x4]
    sub r0, r1, #0x2
    bx lr
.L_1288:
    add r1, r1, #0x1
    str r1, [r0]
    and r0, r2, #0xff
    bx lr
.L_1298:
    ldr r2, [r0, #0x4]
    cmp r2, #0x0
    movne r2, #0x0
    strne r2, [r0, #0x4]
    bne .L_12b8
    ldr r2, [r0]
    sub r2, r2, #0x1
    str r2, [r0]
.L_12b8:
    mov r0, r1
    bx lr
.L_12c0:
    ldr r0, [r0, #0x4]
    bx lr
.L_12c8:
    mov r0, #0x0
    bx lr
