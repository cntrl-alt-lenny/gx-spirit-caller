; func_020385a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020385a8
        .arm
func_020385a8:
    ldmia r0, {r2, r3}
    mov r1, r2, asr #0x8
    cmp r1, r3, asr #0x8
    ldreqsh r1, [r0, #0xa]
    cmpeq r1, #0x0
    beq .L_74
    ldrsh r1, [r0, #0xa]
    sub r1, r1, #0x1
    strh r1, [r0, #0xa]
    ldrsh r1, [r0, #0xa]
    cmp r1, #0x0
    bgt .L_40
    mov r1, #0x0
    strh r1, [r0, #0xa]
    str r3, [r0]
    b .L_6c
.L_40:
    ldrsh r1, [r0, #0x8]
    cmp r1, #0x0
    add r2, r2, r1
    blt .L_58
    cmp r2, r3
    bgt .L_64
.L_58:
    cmp r1, #0x0
    cmplt r2, r3
    bge .L_68
.L_64:
    mov r2, r3
.L_68:
    str r2, [r0]
.L_6c:
    mov r0, #0x1
    bx lr
.L_74:
    mov r0, #0x0
    bx lr
