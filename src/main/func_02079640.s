; func_02079640 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02078ebc
        .extern func_02078ec8
        .extern func_02078ed8
        .extern func_02078eec
        .extern func_02079984
        .extern func_02079b0c
        .extern func_02079bbc
        .extern func_02079e20
        .extern func_020945f4
        .extern func_02094688
        .extern func_020a7388
        .extern func_020b3808
        .global func_02079640
        .arm
func_02079640:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x24
    ldr r9, [sp, #0x48]
    ldr r6, [sp, #0x4c]
    str r1, [sp, #0x4]
    add r5, r6, r9, lsl #0x1
    str r0, [sp]
    mov sl, r2
    mov r0, r5
    mov r2, r9, lsl #0x2
    mov r1, #0x0
    str r3, [sp, #0x8]
    add r4, r5, r9, lsl #0x1
    bl func_020945f4
    ldr r0, [sp, #0x4]
    mov r1, r9
    bl func_02079e20
    mov fp, r0
    mov r0, sl
    mov r1, r9
    bl func_02079e20
    mov r7, r0
    cmp fp, #0x0
    ble .L_8e0
    cmp r7, #0x0
    ble .L_8e0
    sub r0, r9, fp
    add r0, r7, r0
    sub r8, r0, #0x1
    cmp r8, r9
    blt .L_7c8
    ldr r0, [sp, #0x4]
    mov r1, r4
    mov r2, r9, lsl #0x1
    bl func_02094688
    b .L_8e0
.L_7c8:
    ldr r0, [sp, #0x4]
    add r1, r5, r8, lsl #0x1
    mov r2, fp, lsl #0x1
    bl func_02094688
    cmp r7, #0x2
    ble .L_7fc
    add r0, sl, r7, lsl #0x1
    sub r0, r0, #0x2
    mov r7, r7, lsl #0x1
    bl func_02078ed8
    str r0, [sp, #0x14]
    str r1, [sp, #0x10]
    b .L_838
.L_7fc:
    cmp r7, #0x1
    ble .L_820
    add r0, sl, r7, lsl #0x1
    sub r0, r0, #0x2
    mov r7, r7, lsl #0x1
    bl func_02078ec8
    str r0, [sp, #0x14]
    str r1, [sp, #0x10]
    b .L_838
.L_820:
    add r0, sl, r7, lsl #0x1
    sub r0, r0, #0x2
    mov r7, r7, lsl #0x1
    bl func_02078ebc
    str r0, [sp, #0x14]
    str r1, [sp, #0x10]
.L_838:
    cmp r8, r9
    bge .L_8e0
    mov r0, r9, lsl #0x1
    sub r0, r0, #0x1
    mov fp, r0, lsl #0x1
    add r0, r4, r7
    str r0, [sp, #0x1c]
.L_854:
    mov r1, r5
    add r0, r5, #0x2
    mov r2, fp
    bl func_020a7388
    ldr r0, [sp, #0x1c]
    bl func_02078eec
    ldr r2, [sp, #0x14]
    ldr r3, [sp, #0x10]
    bl func_020b3808
    mov r7, r0
    ldr r0, _LIT0
    cmp r7, r0
    movhi r7, r0
.L_888:
    mov r2, r7, lsl #0x10
    mov r0, r6
    mov r1, sl
    mov r2, r2, lsr #0x10
    mov r3, r9
    bl func_02079984
    mov r0, r4
    mov r1, r6
    mov r2, r9
    bl func_02079b0c
    cmp r0, #0x0
    sublt r7, r7, #0x1
    blt .L_888
    mov r0, r4
    mov r1, r4
    mov r2, r6
    mov r3, r9
    bl func_02079bbc
    strh r7, [r5]
    add r8, r8, #0x1
    cmp r8, r9
    blt .L_854
.L_8e0:
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_8fc
    ldr r1, [sp]
    mov r0, r5
    mov r2, r9, lsl #0x1
    bl func_02094688
.L_8fc:
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    addeq sp, sp, #0x24
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxeq lr
    ldr r1, [sp, #0x8]
    mov r0, r4
    mov r2, r9, lsl #0x1
    bl func_02094688
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word 0x0000ffff
