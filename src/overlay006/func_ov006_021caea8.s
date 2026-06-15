; func_ov006_021caea8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern func_0201d738
        .extern func_0201d760
        .extern func_0202be4c
        .extern func_0208de4c
        .extern func_0208e0a0
        .extern func_0208f2a8
        .extern func_0208f2f4
        .extern func_0208f368
        .extern func_02092904
        .extern func_02094688
        .global func_ov006_021caea8
        .arm
func_ov006_021caea8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r6, r0
    mov r0, #0x0
    bl func_0202be4c
    mov r5, r0
    bl func_0201d760
    mov r4, r0
    mov r1, #0x200
    bl func_02092904
    bl func_0208f368
    mov r0, r4
    mov r1, #0x4400
    mov r2, #0x200
    bl func_0208f2f4
    bl func_0208f2a8
    mov r0, r5
    bl Task_InvokeLocked
    ldr r0, [r6, #0x20]
    bl func_0202be4c
    str r0, [sp]
    bl func_0201d738
    mov sl, r0
    mov fp, #0x0
.L_e0:
    subs r4, fp, #0x1
    bmi .L_1a0
    cmp r4, #0x20
    bge .L_1a0
    mov r0, fp, asr #0x2
    mov r2, fp, lsr #0x1f
    mov r3, r4, asr #0x2
    add r0, fp, r0, lsr #0x1d
    rsb r1, r2, fp, lsl #0x1d
    add r3, r4, r3, lsr #0x1d
    mov r8, r4, lsr #0x1f
    rsb r4, r8, r4, lsl #0x1d
    add r4, r8, r4, ror #0x1d
    mov r7, r0, asr #0x3
    add r6, r2, r1, ror #0x1d
    mov r5, r3, asr #0x3
    mov r8, #0x0
.L_124:
    adds r9, r8, #0x2
    bmi .L_194
    cmp r9, #0x20
    bge .L_194
    bl func_0208de4c
    mov r1, r8, asr #0x2
    add r1, r8, r1, lsr #0x1d
    mov r1, r1, asr #0x3
    add r1, r1, r7, lsl #0x5
    add r1, r1, #0x1
    add r0, r0, r1, lsl #0x6
    mov r1, r8, lsr #0x1f
    add r2, r0, r6, lsl #0x3
    rsb r0, r1, r8, lsl #0x1d
    add r0, r1, r0, ror #0x1d
    add r1, r0, r2
    mov r2, r9, lsr #0x1f
    rsb r0, r2, r9, lsl #0x1d
    add r0, r2, r0, ror #0x1d
    mov r2, r9, asr #0x2
    add r2, r9, r2, lsr #0x1d
    mov r2, r2, asr #0x3
    add r2, r2, r5, lsl #0x2
    add r2, sl, r2, lsl #0x6
    add r2, r2, r4, lsl #0x3
    add r0, r0, r2
    mov r2, #0x1
    bl func_02094688
.L_194:
    add r8, r8, #0x1
    cmp r8, #0x18
    blt .L_124
.L_1a0:
    add fp, fp, #0x1
    cmp fp, #0x20
    blt .L_e0
    ldr r0, [sp]
    bl Task_InvokeLocked
    mov r6, #0x0
    mov r7, r6
    mov r4, r6
.L_1c0:
    mov r5, r4
.L_1c4:
    bl func_0208e0a0
    add r1, r5, r7
    add r2, r1, #0x1
    mov r1, r5, lsl #0x1
    add r5, r5, #0x1
    orr r2, r2, #0x2000
    add r0, r0, r6, lsl #0x6
    strh r2, [r1, r0]
    cmp r5, #0x3
    blt .L_1c4
    add r6, r6, #0x1
    cmp r6, #0x4
    add r7, r7, #0x20
    blt .L_1c0
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
