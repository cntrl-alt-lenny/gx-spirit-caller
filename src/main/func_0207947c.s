; func_0207947c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219eee0
        .extern data_0219ef0c
        .extern func_02079640
        .extern func_02079838
        .extern func_02079a08
        .extern func_02079e20
        .extern func_020945f4
        .extern func_02094688
        .global func_0207947c
        .arm
func_0207947c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x1c
    ldr r4, _LIT0
    mov r8, r3
    ldr r3, [r4]
    mov sl, r0
    mov r0, r8, lsl #0x3
    ldr r7, [sp, #0x40]
    str r1, [sp, #0x8]
    mov r9, r2
    blx r3
    movs r6, r0
    addeq sp, sp, #0x1c
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxeq lr
    sub r1, r8, #0x1
    add r0, sl, #0x2
    mov r2, r1, lsl #0x1
    mov r1, #0x0
    add fp, r6, r8, lsl #0x1
    bl func_020945f4
    mov r2, #0x1
    mov r0, r9
    mov r1, r8
    strh r2, [sl]
    bl func_02079e20
    sub r0, r8, r0
    mov r5, r0, lsl #0x4
    mov r4, r8, lsl #0x4
    cmp r5, r4
    bcs .L_638
    mov r0, #0x8000
.L_5f4:
    sub r1, r8, r5, asr #0x4
    sub r1, r1, #0x1
    mov r1, r1, lsl #0x1
    and r2, r5, #0xf
    ldrh r1, [r9, r1]
    mov r2, r0, lsr r2
    ands r1, r2, r1
    beq .L_62c
    ldr r0, [sp, #0x8]
    mov r1, sl
    mov r2, r8, lsl #0x1
    bl func_02094688
    add r5, r5, #0x1
    b .L_638
.L_62c:
    add r5, r5, #0x1
    cmp r5, r4
    bcc .L_5f4
.L_638:
    cmp r5, r4
    bcs .L_714
    mov r0, r8, lsl #0x1
    str r0, [sp, #0xc]
    mov r0, #0x0
    str r0, [sp, #0x10]
    mov r0, #0x8000
    str r0, [sp, #0x14]
.L_658:
    mov r0, r6
    mov r1, sl
    mov r2, r8
    bl func_02079838
    ldr r2, [sp, #0xc]
    mov r0, r6
    mov r1, sl
    bl func_02094688
    cmp r7, #0x0
    beq .L_69c
    ldr r0, [sp, #0x10]
    str r8, [sp]
    mov r1, sl
    mov r2, r7
    mov r3, sl
    str fp, [sp, #0x4]
    bl func_02079640
.L_69c:
    sub r0, r8, r5, asr #0x4
    sub r0, r0, #0x1
    mov r1, r0, lsl #0x1
    ldr r0, [sp, #0x14]
    and r2, r5, #0xf
    mov r2, r0, lsr r2
    ldrh r0, [r9, r1]
    ands r0, r2, r0
    beq .L_708
    ldr r2, [sp, #0x8]
    mov r0, r6
    mov r1, sl
    mov r3, r8
    bl func_02079a08
    ldr r2, [sp, #0xc]
    mov r0, r6
    mov r1, sl
    bl func_02094688
    cmp r7, #0x0
    beq .L_708
    ldr r0, [sp, #0x10]
    str r8, [sp]
    mov r1, sl
    mov r2, r7
    mov r3, sl
    str fp, [sp, #0x4]
    bl func_02079640
.L_708:
    add r5, r5, #0x1
    cmp r5, r4
    bcc .L_658
.L_714:
    ldr r1, _LIT1
    mov r0, r6
    ldr r1, [r1]
    blx r1
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word data_0219eee0
_LIT1: .word data_0219ef0c
