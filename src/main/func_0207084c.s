; func_0207084c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219eec8
        .extern func_02072c78
        .extern func_020918d0
        .global func_0207084c
        .arm
func_0207084c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    mov r8, r2
    ldr fp, [r8, #0x34]
    mov sl, r0
    movs r0, r3
    mov r0, fp, lsl #0x1
    movne r6, #0x1
    add r5, r0, #0x4
    mov r0, #0x18
    str r3, [sp, #0x4]
    mov r9, r1
    ldreqh r6, [r8, #0x2c]
    mov r4, #0x0
    str r0, [sp, #0x8]
    b .L_c98
.L_c20:
    ldr r0, _LIT0
    ldrh r7, [r8, #0x2e]
    ldrh r0, [r0]
    ldr r1, [r8, #0x34]
    cmp r7, r6
    movcs r7, r6
    cmp r0, r7
    movcc r7, r0
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    biceq r7, r7, #0x1
    cmp r9, r7
    sub r0, r1, fp
    movcc r7, r9
    adds r0, r5, r0
    moveq r7, r4
    mov fp, r1
    sub r5, r0, #0x1
    cmp r7, #0x0
    beq .L_cac
    ldr r3, [sp, #0x8]
    mov r0, sl
    mov r1, r7
    mov r2, r8
    str r4, [sp]
    sub r6, r6, r7
    bl func_02072c78
    bl func_020918d0
    add sl, sl, r7
    sub r9, r9, r7
.L_c98:
    cmp r9, #0x0
    beq .L_cac
    ldrb r0, [r8, #0x8]
    cmp r0, #0x4
    beq .L_c20
.L_cac:
    mov r0, r7
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word data_0219eec8
