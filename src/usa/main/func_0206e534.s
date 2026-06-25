; func_0206e534 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206e318
        .extern func_02091680
        .global func_0206e534
        .arm
func_0206e534:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    mov r9, r2
    str r0, [sp]
    mov r0, #0x1
    str r0, [sp, #0x8]
    mov r0, #0x0
    mov r8, r3
    mvn r2, #0x0
    cmp r8, r2
    cmpeq r9, r2
    movne fp, #0x1
    mov sl, r1
    moveq fp, #0x0
    str r0, [sp, #0x4]
.L_3c:
    ldr r5, [sp, #0x4]
    ldr r7, [sp]
    mov r6, r5
    cmp sl, #0x0
    bls .L_7c
.L_50:
    ldrsh r1, [r7, #0x4]
    ldr r0, [r7]
    orr r4, r1, #0xe0
    bl func_0206e318
    ands r0, r4, r0
    strh r0, [r7, #0x6]
    add r6, r6, #0x1
    addne r5, r5, #0x1
    cmp r6, sl
    add r7, r7, #0x8
    bcc .L_50
.L_7c:
    cmp r5, #0x0
    bgt .L_b4
    cmp fp, #0x0
    beq .L_9c
    mov r1, #0x0
    subs r0, r1, r9
    sbcs r0, r1, r8
    bge .L_b4
.L_9c:
    ldr r0, [sp, #0x8]
    bl func_02091680
    ldr r0, _LIT0
    subs r9, r9, r0
    sbc r8, r8, #0x0
    b .L_3c
.L_b4:
    mov r0, r5
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word 0x0000020b
