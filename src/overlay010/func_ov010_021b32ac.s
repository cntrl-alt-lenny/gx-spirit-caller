; func_ov010_021b32ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov010_021b8a70
        .extern func_02006c0c
        .extern Task_Invoke
        .extern func_0201d47c
        .extern func_0201e5b8
        .global func_ov010_021b32ac
        .arm
func_ov010_021b32ac:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x28
    mov r6, r0
    mov r5, r1
    cmp r2, #0x5
    addls pc, pc, r2, lsl #0x2
    b .L_4c4
    b .L_4c4
    b .L_49c
    b .L_4a4
    b .L_4ac
    b .L_4b4
    b .L_4bc
.L_49c:
    mov r2, #0x1
    b .L_4c8
.L_4a4:
    mov r2, #0x2
    b .L_4c8
.L_4ac:
    mov r2, #0x3
    b .L_4c8
.L_4b4:
    mov r2, #0x4
    b .L_4c8
.L_4bc:
    mov r2, #0x5
    b .L_4c8
.L_4c4:
    mov r2, #0x0
.L_4c8:
    ldr r0, _LIT0
    mov r1, #0x4
    ldr r0, [r0, r2, lsl #0x2]
    mov r2, #0x0
    bl func_02006c0c
    mov r4, r0
    add r0, sp, #0x0
    bl func_0201d47c
    cmp r6, #0x7
    addls pc, pc, r6, lsl #0x2
    b .L_66c
    b .L_514
    b .L_544
    b .L_578
    b .L_59c
    b .L_5c0
    b .L_5f4
    b .L_628
    b .L_64c
.L_514:
    ldrh r0, [sp, #0x14]
    ldr r1, [sp, #0x18]
    cmp r5, #0x0
    bic r0, r0, #0xf
    strh r0, [sp, #0x14]
    moveq r0, #0x0
    movne r0, #0x2
    mov r0, r0, lsl #0x1d
    bic r1, r1, #0x1c000
    orr r0, r1, r0, lsr #0xf
    str r0, [sp, #0x18]
    b .L_66c
.L_544:
    ldrh r0, [sp, #0x14]
    ldr r1, [sp, #0x18]
    cmp r5, #0x0
    bic r0, r0, #0xf
    orr r0, r0, #0x1
    strh r0, [sp, #0x14]
    moveq r0, #0x1
    movne r0, #0x3
    mov r0, r0, lsl #0x1d
    bic r1, r1, #0x1c000
    orr r0, r1, r0, lsr #0xf
    str r0, [sp, #0x18]
    b .L_66c
.L_578:
    ldrh r1, [sp, #0x14]
    ldr r0, [sp, #0x18]
    bic r1, r1, #0xf
    bic r0, r0, #0x1c000
    orr r1, r1, #0x2
    orr r0, r0, #0x8000
    strh r1, [sp, #0x14]
    str r0, [sp, #0x18]
    b .L_66c
.L_59c:
    ldrh r1, [sp, #0x14]
    ldr r0, [sp, #0x18]
    bic r1, r1, #0xf
    bic r0, r0, #0x1c000
    orr r1, r1, #0x3
    orr r0, r0, #0xc000
    strh r1, [sp, #0x14]
    str r0, [sp, #0x18]
    b .L_66c
.L_5c0:
    ldrh r0, [sp, #0x14]
    ldr r1, [sp, #0x18]
    cmp r5, #0x0
    bic r0, r0, #0xf
    orr r0, r0, #0x5
    strh r0, [sp, #0x14]
    moveq r0, #0x0
    movne r0, #0x2
    mov r0, r0, lsl #0x1d
    bic r1, r1, #0x1c000
    orr r0, r1, r0, lsr #0xf
    str r0, [sp, #0x18]
    b .L_66c
.L_5f4:
    ldrh r0, [sp, #0x14]
    ldr r1, [sp, #0x18]
    cmp r5, #0x0
    bic r0, r0, #0xf
    orr r0, r0, #0x6
    strh r0, [sp, #0x14]
    moveq r0, #0x1
    movne r0, #0x3
    mov r0, r0, lsl #0x1d
    bic r1, r1, #0x1c000
    orr r0, r1, r0, lsr #0xf
    str r0, [sp, #0x18]
    b .L_66c
.L_628:
    ldrh r1, [sp, #0x14]
    ldr r0, [sp, #0x18]
    bic r1, r1, #0xf
    bic r0, r0, #0x1c000
    orr r1, r1, #0x7
    orr r0, r0, #0x8000
    strh r1, [sp, #0x14]
    str r0, [sp, #0x18]
    b .L_66c
.L_64c:
    ldrh r1, [sp, #0x14]
    ldr r0, [sp, #0x18]
    bic r1, r1, #0xf
    bic r0, r0, #0x1c000
    orr r1, r1, #0x8
    orr r0, r0, #0xc000
    strh r1, [sp, #0x14]
    str r0, [sp, #0x18]
.L_66c:
    ldrh r1, [sp, #0x14]
    add r0, sp, #0x0
    str r4, [sp]
    orr r1, r1, #0x10
    strh r1, [sp, #0x14]
    bl func_0201e5b8
    mov r0, r4
    bl Task_Invoke
    add sp, sp, #0x28
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov010_021b8a70
