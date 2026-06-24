; func_02038624 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02038624
        .arm
func_02038624:
    ldrsh r2, [r0]
    ldrsh r3, [r0, #0x2]
    mov r1, r2, asr #0x8
    cmp r1, r3, asr #0x8
    ldreqsh r1, [r0, #0x6]
    cmpeq r1, #0x0
    beq .L_78
    ldrsh r1, [r0, #0x6]
    sub r1, r1, #0x1
    strh r1, [r0, #0x6]
    ldrsh r1, [r0, #0x6]
    cmp r1, #0x0
    bgt .L_44
    mov r1, #0x0
    strh r1, [r0, #0x6]
    strh r3, [r0]
    b .L_70
.L_44:
    ldrsh r1, [r0, #0x4]
    cmp r1, #0x0
    add r2, r2, r1
    blt .L_5c
    cmp r2, r3
    bgt .L_68
.L_5c:
    cmp r1, #0x0
    cmplt r2, r3
    bge .L_6c
.L_68:
    mov r2, r3
.L_6c:
    strh r2, [r0]
.L_70:
    mov r0, #0x1
    bx lr
.L_78:
    mov r0, #0x0
    bx lr
