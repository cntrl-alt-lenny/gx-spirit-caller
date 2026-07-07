; func_ov002_021dec9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021d46ac
        .extern func_ov002_021d9738
        .extern func_ov002_021dcb58
        .extern func_ov002_02244efc
        .global func_ov002_021dec9c
        .arm
func_ov002_021dec9c:
    stmdb sp!, {r0, r1, r2, r3}
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    add r4, sp, #0x24
    ldr r1, [r4]
    mov r9, r0
    mov r0, r1, lsl #0xd
    mov r2, r1, lsl #0x16
    mov r0, r0, lsr #0x1f
    cmp r0, r2, lsr #0x1f
    ldr r0, [r4]
    movne r7, #0x1
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x9
    mov r5, r2, lsr #0x1f
    mov r2, r0, lsr #0x1c
    ldr r0, [r9]
    moveq r7, #0x0
    cmp r2, #0xe
    moveq r8, #0x1
    mov r6, r1, lsr #0x1c
    movne r8, #0x0
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    addeq sp, sp, #0x10
    bxeq lr
    cmp r6, #0x5
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    addge sp, sp, #0x10
    bxge lr
    cmp r7, #0x0
    movne r3, #0x1
    moveq r3, #0x0
    cmp r5, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x32
    mov r0, r0, lsl #0x10
    mov r1, r6, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021d46ac
    mov r2, #0x0
    ldr r0, [r4]
    mov r1, r9
    mov r3, r2
    bl func_ov002_021d9738
    ldr r1, [sp, #0x24]
    mov r0, #0x16
    bl func_ov002_02244efc
    mov r3, #0x6
    cmp r7, #0x0
    orrne r3, r3, #0x1
    cmp r8, #0x0
    orrne r3, r3, #0x1000000
    mov r0, r9
    mov r1, r5
    mov r2, r6
    bl func_ov002_021dcb58
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    add sp, sp, #0x10
    bx lr
