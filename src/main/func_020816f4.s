; func_020816f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207fff8
        .extern func_020817f0
        .global func_020816f4
        .arm
func_020816f4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x14
    mov sl, r0
    ldr r4, [sl, #0x4]
    ldr r0, [sp, #0x40]
    ldr r4, [r4]
    ldr r5, [sl, #0xc]
    ldrsb r4, [r4, #0x1]
    cmp r0, #0x0
    mov r9, r1
    str r0, [sp, #0xc]
    ldr r0, [sp, #0x38]
    mov r8, r2
    str r0, [sp, #0x38]
    mov r7, r3
    add r6, r5, r4
    addeq sp, sp, #0x14
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r0, r7, #0x1
    ldr r1, [sp, #0x3c]
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    and r5, r1, #0x800
    and fp, r1, #0x400
    str r0, [sp, #0x8]
    mov r4, #0x0
.L_2c4:
    mov r1, r9
    cmp r5, #0x0
    beq .L_2f0
    ldr r0, [sl, #0x4]
    ldr r1, [sl, #0x8]
    ldr r2, [sp, #0xc]
    mov r3, r4
    bl func_0207fff8
    sub r0, r7, r0
    add r1, r9, r0
    b .L_320
.L_2f0:
    cmp fp, #0x0
    beq .L_320
    ldr r0, [sl, #0x4]
    ldr r1, [sl, #0x8]
    ldr r2, [sp, #0xc]
    mov r3, r4
    bl func_0207fff8
    add r0, r0, #0x1
    add r1, r0, r0, lsr #0x1f
    ldr r0, [sp, #0x8]
    sub r0, r0, r1, asr #0x1
    add r1, r9, r0
.L_320:
    ldr r2, [sp, #0xc]
    add r3, sp, #0xc
    str r2, [sp]
    str r3, [sp, #0x4]
    ldr r3, [sp, #0x38]
    mov r0, sl
    mov r2, r8
    bl func_020817f0
    ldr r0, [sp, #0xc]
    add r8, r8, r6
    cmp r0, #0x0
    bne .L_2c4
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
