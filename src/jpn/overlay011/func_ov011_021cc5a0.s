; func_ov011_021cc5a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov011_021c9fb4
        .extern func_ov011_021cc500
        .global func_ov011_021cc5a0
        .arm
func_ov011_021cc5a0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x14
    mov r2, #0xa8
    mul r2, r0, r2
    cmp r1, r0
    movge r0, r1
    mov r1, #0xa8
    mul r1, r0, r1
    mov r2, r2, asr #0x8
    mov r0, r1, asr #0x8
    add r0, r0, #0x38
    add r5, r2, #0x38
    str r0, [sp, #0x8]
    sub r0, r0, r5
    mov r6, r0, asr #0x3
    and r0, r0, #0x7
    str r0, [sp, #0x4]
    bl func_ov011_021c9fb4
    mov r8, r0
    cmp r6, #0x0
    mov r7, #0x0
    ble .L_9c
    mov r9, r5
    add sl, r8, #0x8000
    add r4, sp, #0xc
    mov fp, #0x6
.L_68:
    mov r0, r9, lsl #0xc
    str r0, [sp, #0xc]
    str sl, [sp, #0x10]
    mov r0, fp
    mov r1, #0x7
    mov r2, #0x0
    mov r3, #0x10
    str r4, [sp]
    bl func_ov011_021cc500
    add r7, r7, #0x1
    cmp r7, r6
    add r9, r9, #0x8
    blt .L_68
.L_9c:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_dc
    add r0, r5, r6, lsl #0x3
    mov r1, r0, lsl #0xc
    add r0, r8, #0x8000
    str r0, [sp, #0x10]
    ldr r0, [sp, #0x4]
    str r1, [sp, #0xc]
    add r4, sp, #0xc
    sub r1, r0, #0x1
    mov r0, #0x6
    mov r2, #0x0
    mov r3, #0x10
    str r4, [sp]
    bl func_ov011_021cc500
.L_dc:
    ldr r0, [sp, #0x8]
    add r4, sp, #0xc
    sub r0, r0, #0x3
    mov r1, r0, lsl #0xc
    mov r0, #0x5
    str r1, [sp, #0xc]
    str r8, [sp, #0x10]
    sub r1, r0, #0x6
    mov r2, #0x0
    mov r3, #0x10
    str r4, [sp]
    bl func_ov011_021cc500
    sub r1, r5, #0x3
    mov r0, #0x0
    mov r1, r1, lsl #0xc
    str r1, [sp, #0xc]
    str r8, [sp, #0x10]
    mov r2, r0
    sub r1, r0, #0x1
    mov r3, #0x10
    str r4, [sp]
    bl func_ov011_021cc500
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
