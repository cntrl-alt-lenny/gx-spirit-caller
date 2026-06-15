; func_020299c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0201e7e4
        .extern func_0201e7ec
        .extern func_0201e800
        .extern func_0201e80c
        .extern func_0207fd28
        .global func_020299c4
        .arm
func_020299c4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    mov r9, #0x0
    add r7, sl, #0x98
    mov fp, r9
    mov r4, #0x1000
    mov r5, #0x1
.L_314:
    ldrb r0, [sl, #0x79]
    cmp r9, r0
    bge .L_3a8
    ldr r0, [r7, #0xd0]
    tst r0, r5, lsl r9
    beq .L_3a8
    add r0, r7, r9, lsl #0x2
    ldr r6, [r0, #0x8]
    add r1, r7, r9, lsl #0x1
    cmp r6, #0x0
    ldrh r0, [r1, #0x70]
    ldrh r8, [r1, #0xa0]
    beq .L_3a8
    cmp r0, #0x0
    bne .L_3a8
    mov r0, r6
    mov r1, r4
    bl func_0207fd28
    mov r0, r6
    bl func_0201e7e4
    cmp r0, #0x0
    bne .L_3a8
    tst r8, #0x1
    mov r0, r6
    beq .L_390
    mov r1, fp
    bl func_0201e800
    mov r0, r6
    mov r1, #0x1
    bl func_0201e7ec
    b .L_3a8
.L_390:
    bl func_0201e80c
    sub r0, r0, #0x1
    mov r1, r0, lsl #0x10
    mov r0, r6
    mov r1, r1, lsr #0x10
    bl func_0201e800
.L_3a8:
    add r9, r9, #0x1
    cmp r9, #0x18
    blt .L_314
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
