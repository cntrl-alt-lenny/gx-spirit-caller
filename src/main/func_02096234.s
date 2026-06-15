; func_02096234 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a8288
        .global func_02096234
        .arm
func_02096234:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x8
    ldr sl, _LIT0
    ldr r5, _LIT1
    ldr r4, _LIT2
    mov r7, #0x4100000
    mov r6, #0x0
    mvn r8, #0x3
    mvn r9, #0x2
.L_24:
    ldrh r0, [sl]
    ands r0, r0, #0x4000
    ldrneh r0, [sl]
    movne r1, r9
    orrne r0, r0, #0xc000
    strneh r0, [sl]
    bne .L_6c
    bl OS_DisableIrq
    ldrh r1, [sl]
    ands r1, r1, #0x100
    beq .L_5c
    bl OS_RestoreIrq
    mov r1, r8
    b .L_6c
.L_5c:
    ldr r1, [r7]
    str r1, [sp]
    bl OS_RestoreIrq
    mov r1, r6
.L_6c:
    cmp r1, r8
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    bxeq lr
    mvn r0, #0x2
    cmp r1, r0
    beq .L_24
    ldr r1, [sp]
    mov r0, r1, lsl #0x1b
    movs r0, r0, lsr #0x1b
    beq .L_24
    ldr r3, [r5, r0, lsl #0x2]
    cmp r3, #0x0
    beq .L_b8
    mov r2, r1, lsl #0x1a
    mov r1, r1, lsr #0x6
    mov r2, r2, lsr #0x1f
    blx r3
    b .L_24
.L_b8:
    mov r0, r1, lsl #0x1a
    movs r0, r0, lsr #0x1f
    bne .L_24
    orr r0, r1, #0x20
    str r0, [sp]
    ldrh r0, [sl]
    ands r0, r0, #0x4000
    ldrneh r0, [sl]
    orrne r0, r0, #0xc000
    strneh r0, [sl]
    bne .L_24
    bl OS_DisableIrq
    ldrh r1, [sl]
    ands r1, r1, #0x2
    beq .L_fc
    bl OS_RestoreIrq
    b .L_24
.L_fc:
    ldr r1, [sp]
    str r1, [r4]
    bl OS_RestoreIrq
    b .L_24
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    bx lr
_LIT0: .word 0x04000184
_LIT1: .word data_021a8288
_LIT2: .word 0x04000188
