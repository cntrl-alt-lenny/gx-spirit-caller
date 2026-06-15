; func_0208a09c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02089024
        .extern func_02089260
        .extern func_020892c4
        .extern func_020899c0
        .extern func_02089e70
        .extern func_0208a000
        .extern func_0209614c
        .global func_0208a09c
        .arm
func_0208a09c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    mov sl, r1
    mov r9, r2
    mov fp, r3
    bl func_020892c4
    movs r8, r0
    addeq sp, sp, #0xc
    moveq r0, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ands r0, sl, #0x2
    beq .L_47c
    ldr r0, [r8]
    mov r1, r9
    mov r2, fp
    bl func_02089e70
    movs r7, r0
    bne .L_488
    add sp, sp, #0xc
    mov r0, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_47c:
    ldr r0, [r8]
    bl func_02089024
    mov r7, r0
.L_488:
    and r5, sl, #0x4
    mov r6, #0x0
.L_490:
    add r0, r8, r6, lsl #0x1
    ldrh r0, [r0, #0x4]
    ldr r1, _LIT0
    cmp r0, r1
    beq .L_548
    bl func_02089260
    movs r4, r0
    addeq sp, sp, #0xc
    moveq r0, #0x5
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r0, sp, #0x4
    str r0, [sp]
    add r0, r8, r6, lsl #0x1
    ldrh r0, [r0, #0x4]
    mov r1, sl
    mov r2, r9
    mov r3, fp
    bl func_0208a000
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrb r0, [r4, #0x3]
    ands r0, r0, #0x1
    beq .L_528
    cmp r5, #0x0
    beq .L_528
    str r9, [sp]
    ldr r1, [r4]
    ldr r0, [sp, #0x4]
    mov r3, r1, lsl #0x8
    mov r1, r7
    mov r2, r6
    mov r3, r3, lsr #0x8
    bl func_020899c0
    cmp r0, #0x0
    addeq sp, sp, #0xc
    moveq r0, #0x9
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_528:
    cmp r7, #0x0
    beq .L_548
    ldr r2, [sp, #0x4]
    cmp r2, #0x0
    beq .L_548
    mov r0, r7
    mov r1, r6
    bl func_0209614c
.L_548:
    add r6, r6, #0x1
    cmp r6, #0x4
    blt .L_490
    ldr r0, [sp, #0x30]
    cmp r0, #0x0
    strne r7, [r0]
    mov r0, #0x0
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x0000ffff
