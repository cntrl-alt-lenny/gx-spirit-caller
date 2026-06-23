; func_ov006_021c8f24 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202160c
        .extern func_0202165c
        .extern func_020b377c
        .extern func_ov006_021c9b48
        .global func_ov006_021c8f24
        .arm
func_ov006_021c8f24:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r9, r0
    ldr r0, _LIT0
    mov r6, #0x0
    orr fp, r0, #0x4
.L_14:
    ldr r5, [r9, #0x78]
    ldr r0, [r9, #0x7c]
    mul r0, r5, r0
    cmp r6, r0
    bge .L_fc
    mov r0, r6
    mov r1, r5
    bl func_020b377c
    mov r4, r1
    mov r1, r5
    mov r0, r6
    bl func_020b377c
    mov r2, r0
    ldr r0, [r9, #0x88]
    ldr r1, [r9, #0x8c]
    add r3, r0, #0x9
    mov r0, #0x14
    add r1, r1, #0x9
    mla r8, r2, r0, r1
    mla r7, r4, r0, r3
    mov r1, r4
    mov r0, r9
    bl func_ov006_021c9b48
    movs sl, r0
    bmi .L_f0
    ldr r0, [r9, #0x74]
    ldr r5, _LIT0
    sub r0, r0, #0x16
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    b .L_c0
    b .L_b0
    b .L_c0
    b .L_b0
    b .L_b0
    b .L_b0
    b .L_b0
    b .L_b0
    b .L_b0
.L_b0:
    add r0, r9, r6, lsl #0x1
    ldrsh r0, [r0, #0xac]
    cmp r0, #0x0
    movlt r5, fp
.L_c0:
    mov r1, r6, lsr #0x1f
    rsb r0, r1, r6, lsl #0x1b
    add r0, r1, r0, ror #0x1b
    mov r1, r6, asr #0x4
    add r1, r6, r1, lsr #0x1b
    mov r1, r1, asr #0x5
    add r1, r9, r1, lsl #0x2
    ldr r2, [r1, #0x64]
    mov r1, #0x1
    tst r2, r1, lsl r0
    orrne r5, r5, #0x4
    b .L_108
.L_f0:
    mov sl, #0x0
    mov r5, sl
    b .L_108
.L_fc:
    mov r7, #0x0
    mov r8, r7
    mov r5, r7
.L_108:
    ldr r0, [r9]
    mov r1, #0x5
    add r2, r6, #0x1
    bl func_0202160c
    mov r4, r0
    mov r1, #0x2
    mov r2, r6
    bl func_0202165c
    mov r2, r7
    mov r0, r4
    mov r1, #0x3
    bl func_0202165c
    mov r2, r8
    mov r0, r4
    mov r1, #0x4
    bl func_0202165c
    mov r0, r4
    mov r1, #0x11
    mov r2, #0x1
    bl func_0202165c
    mov r0, r4
    mov r1, #0x12
    mov r2, #0x1
    bl func_0202165c
    mov r0, r4
    mov r1, #0xc
    mov r2, #0x0
    bl func_0202165c
    mov r0, r4
    mov r1, #0xd
    mov r2, sl
    bl func_0202165c
    mov r0, r4
    mov r2, r5
    mov r1, #0x0
    bl func_0202165c
    add r6, r6, #0x1
    cmp r6, #0x23
    blt .L_14
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x000008c1
