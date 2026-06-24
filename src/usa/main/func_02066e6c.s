; func_02066e6c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020670cc
        .extern func_020b377c
        .global func_02066e6c
        .arm
func_02066e6c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x104
    str r1, [sp]
    add r4, sp, #0x4
    mov sl, r0
    mov r9, r2
    mov r8, r3
    mov r1, #0x0
.L_20:
    add r0, r1, #0x1
    mov r0, r0, lsl #0x10
    strb r1, [r4], #0x1
    mov r1, r0, asr #0x10
    cmp r1, #0x100
    blt .L_20
    mov r7, #0x0
    add r5, sp, #0x4
    mov r6, r7
    mov r4, r7
    mov fp, r5
.L_4c:
    ldrb r3, [r5]
    ldrb r2, [sl, r7]
    ldr r1, [sp]
    add r0, r7, #0x1
    add r2, r3, r2
    add r2, r6, r2
    mov r3, r2, lsr #0x1f
    rsb r2, r3, r2, lsl #0x18
    add r2, r3, r2, ror #0x18
    and r6, r2, #0xff
    bl func_020b377c
    and r7, r1, #0xff
    mov r0, r5
    add r1, fp, r6
    bl func_020670cc
    add r0, r4, #0x1
    mov r0, r0, lsl #0x10
    mov r4, r0, asr #0x10
    cmp r4, #0x100
    add r5, r5, #0x1
    blt .L_4c
    mov r6, #0x0
    cmp r8, #0x0
    mov r5, r6
    mov r7, r6
    addle sp, sp, #0x104
    ldmleia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r4, sp, #0x4
.L_bc:
    ldrb r0, [r9, r7]
    add r0, r6, r0
    add r0, r0, #0x1
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x18
    add r0, r1, r0, ror #0x18
    and r6, r0, #0xff
    ldrb r1, [r4, r6]
    add r0, r4, r6
    add r1, r1, r5
    mov r2, r1, lsr #0x1f
    rsb r1, r2, r1, lsl #0x18
    add r1, r2, r1, ror #0x18
    and r5, r1, #0xff
    add r1, r4, r5
    bl func_020670cc
    ldrb r2, [r4, r6]
    ldrb r1, [r4, r5]
    add r3, r7, #0x1
    ldrb r0, [r9, r7]
    add r1, r2, r1
    mov r2, r1, lsr #0x1f
    rsb r1, r2, r1, lsl #0x18
    add r1, r2, r1, ror #0x18
    and r1, r1, #0xff
    ldrb r2, [r4, r1]
    mov r1, r3, lsl #0x10
    eor r0, r0, r2
    strb r0, [r9, r7]
    mov r7, r1, asr #0x10
    cmp r7, r8
    blt .L_bc
    add sp, sp, #0x104
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
