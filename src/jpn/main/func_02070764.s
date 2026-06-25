; func_02070764 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ede8
        .extern func_02072b90
        .extern func_020917e8
        .global func_02070764
        .arm
func_02070764:
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
    b .L_b8
.L_40:
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
    beq .L_cc
    ldr r3, [sp, #0x8]
    mov r0, sl
    mov r1, r7
    mov r2, r8
    str r4, [sp]
    sub r6, r6, r7
    bl func_02072b90
    bl func_020917e8
    add sl, sl, r7
    sub r9, r9, r7
.L_b8:
    cmp r9, #0x0
    beq .L_cc
    ldrb r0, [r8, #0x8]
    cmp r0, #0x4
    beq .L_40
.L_cc:
    mov r0, r7
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word data_0219ede8
