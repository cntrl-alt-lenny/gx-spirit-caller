; func_02038674 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02038674
        .arm
func_02038674:
    ldrsh r2, [r0]
    ldrsh r3, [r0, #0x2]
    mov r1, r2, asr #0x8
    cmp r1, r3, asr #0x8
    ldreqsh r1, [r0, #0x6]
    cmpeq r1, #0x0
    beq .L_f4
    ldrsh r1, [r0, #0x6]
    sub r1, r1, #0x1
    strh r1, [r0, #0x6]
    ldrsh r1, [r0, #0x6]
    cmp r1, #0x0
    bgt .L_c0
    mov r1, #0x0
    strh r1, [r0, #0x6]
    strh r3, [r0]
    b .L_ec
.L_c0:
    ldrsh r1, [r0, #0x4]
    cmp r1, #0x0
    add r2, r2, r1
    blt .L_d8
    cmp r2, r3
    bgt .L_e4
.L_d8:
    cmp r1, #0x0
    cmplt r2, r3
    bge .L_e8
.L_e4:
    mov r2, r3
.L_e8:
    strh r2, [r0]
.L_ec:
    mov r0, #0x1
    bx lr
.L_f4:
    mov r0, #0x0
    bx lr
