; func_02080198 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bede8
        .extern func_02080198
        .extern func_02081394
        .global func_02080198
        .arm
func_02080198:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x3c
    mov r7, r0
    mov r0, r1
    cmp r0, #0x8
    ldr r0, [sp, #0x60]
    str r1, [sp, #0x10]
    str r0, [sp, #0x60]
    ldr r0, [sp, #0x6c]
    str r2, [sp, #0x14]
    str r0, [sp, #0x6c]
    ldrlt r0, [sp, #0x10]
    mov fp, r3
    ldr r6, [sp, #0x64]
    ldr r5, [sp, #0x68]
    movge r2, #0x3
    clzlt r0, r0
    rsblt r2, r0, #0x1f
    ldr r0, [sp, #0x14]
    cmp r0, #0x8
    ldrlt r0, [sp, #0x14]
    movge r1, #0x3
    clzlt r0, r0
    rsblt r1, r0, #0x1f
    ldr r0, _LIT0
    mvn r3, #0x0
    add r1, r0, r1, lsl #0x3
    add r0, r1, r2, lsl #0x1
    ldrb r4, [r1, r2, lsl #0x1]
    ldrb r1, [r0, #0x1]
    ldr r2, [sp, #0x14]
    cmp r6, #0x0
    str r1, [sp, #0x18]
    ldr r1, [sp, #0x10]
    and r1, r1, r3, lsl r4
    str r1, [sp, #0x1c]
    ldr r1, [sp, #0x18]
    and r1, r2, r3, lsl r1
    str r1, [sp, #0x20]
    moveq r1, #0x1
    streq r1, [sp, #0x24]
    movne r1, #0x2
    strne r1, [sp, #0x24]
    mov r1, #0x0
    str r1, [sp, #0x28]
    bl func_02081394
    ldr r1, [sp, #0x10]
    ldr r2, [sp, #0x14]
    mov sl, r1, asr r4
    ldr r1, [sp, #0x18]
    mov r1, r2, asr r1
    str r1, [sp, #0x2c]
    ldr r1, [sp, #0x24]
    mov r2, r1, lsl r4
    ldr r1, [sp, #0x18]
    mov r2, r2, lsl r1
    ldr r1, [sp, #0x6c]
    mov r9, r2, asr r1
    mov r1, #0x0
    str r1, [sp, #0x30]
    str r1, [sp, #0x34]
    b .L_198
.L_f8:
    ldr r2, [sp, #0x30]
    ldr r1, [sp, #0x18]
    ldr r8, [sp, #0x34]
    mov r2, r2, lsl r1
    ldr r1, [sp, #0x60]
    add lr, r1, r2, lsl #0x3
    b .L_184
.L_114:
    mov r1, r8, lsl r4
    add r2, fp, r1, lsl #0x3
    ldr r1, _LIT1
    ldr r3, [r7]
    and ip, r2, r1
    ldr r1, _LIT2
    and r2, lr, #0xff
    and r1, r3, r1
    orr r1, r1, r2
    orr r1, r1, ip, lsl #0x10
    str r1, [r7]
    ldr r3, [r7]
    ldr r1, _LIT3
    mov r2, #0x400
    and r1, r3, r1
    orr r1, r1, r0
    str r1, [r7]
    rsb r1, r2, #0x0
    ldrh r2, [r7, #0x4]
    add r8, r8, #0x1
    and r1, r2, r1
    orr r1, r1, r5
    strh r1, [r7, #0x4]
    ldr r1, [r7]
    add r5, r5, r9
    bic r1, r1, #0x2000
    orr r1, r1, r6, lsl #0xd
    str r1, [r7], #0x8
.L_184:
    cmp r8, sl
    blt .L_114
    ldr r1, [sp, #0x30]
    add r1, r1, #0x1
    str r1, [sp, #0x30]
.L_198:
    ldr r2, [sp, #0x30]
    ldr r1, [sp, #0x2c]
    cmp r2, r1
    blt .L_f8
    ldr r0, [sp, #0x28]
    mla r0, sl, r1, r0
    str r0, [sp, #0x28]
    ldr r1, [sp, #0x1c]
    ldr r0, [sp, #0x10]
    cmp r1, r0
    bcs .L_228
    ldr r0, [sp, #0x60]
    ldr r1, [sp, #0x10]
    str r0, [sp]
    ldr r0, [sp, #0x1c]
    str r6, [sp, #0x4]
    sub r4, r1, r0
    ldr r1, [sp, #0x6c]
    str r5, [sp, #0x8]
    str r1, [sp, #0xc]
    ldr r1, [sp, #0x1c]
    ldr r2, [sp, #0x20]
    add r3, fp, r1, lsl #0x3
    mov r0, r7
    mov r1, r4
    bl func_02080198
    ldr r1, [sp, #0x24]
    add r7, r7, r0, lsl #0x3
    mul r2, r1, r4
    ldr r1, [sp, #0x20]
    mul r2, r1, r2
    ldr r1, [sp, #0x6c]
    add r5, r5, r2, lsr r1
    ldr r1, [sp, #0x28]
    add r0, r1, r0
    str r0, [sp, #0x28]
.L_228:
    ldr r1, [sp, #0x20]
    ldr r0, [sp, #0x14]
    cmp r1, r0
    bcs .L_2a0
    ldr r1, [sp, #0x60]
    ldr r0, [sp, #0x20]
    mov r3, fp
    add r0, r1, r0, lsl #0x3
    str r0, [sp]
    str r6, [sp, #0x4]
    ldr r1, [sp, #0x14]
    ldr r0, [sp, #0x20]
    str r5, [sp, #0x8]
    sub r4, r1, r0
    ldr r1, [sp, #0x6c]
    mov r0, r7
    str r1, [sp, #0xc]
    ldr r1, [sp, #0x1c]
    mov r2, r4
    bl func_02080198
    ldr r2, [sp, #0x24]
    ldr r1, [sp, #0x1c]
    add r7, r7, r0, lsl #0x3
    mul r1, r2, r1
    mul r2, r4, r1
    ldr r1, [sp, #0x6c]
    add r5, r5, r2, lsr r1
    ldr r1, [sp, #0x28]
    add r0, r1, r0
    str r0, [sp, #0x28]
.L_2a0:
    ldr r1, [sp, #0x1c]
    ldr r0, [sp, #0x10]
    cmp r1, r0
    bcs .L_314
    ldr r1, [sp, #0x20]
    ldr r0, [sp, #0x14]
    cmp r1, r0
    bcs .L_314
    ldr r1, [sp, #0x60]
    ldr r0, [sp, #0x20]
    ldr r2, [sp, #0x10]
    add r0, r1, r0, lsl #0x3
    ldr r1, [sp, #0x1c]
    ldr r3, [sp, #0x14]
    str r0, [sp]
    sub r1, r2, r1
    ldr r2, [sp, #0x20]
    str r6, [sp, #0x4]
    sub r2, r3, r2
    ldr r3, [sp, #0x1c]
    ldr r4, [sp, #0x6c]
    str r5, [sp, #0x8]
    mov r0, r7
    add r3, fp, r3, lsl #0x3
    str r4, [sp, #0xc]
    bl func_02080198
    ldr r1, [sp, #0x28]
    add r0, r1, r0
    str r0, [sp, #0x28]
.L_314:
    ldr r0, [sp, #0x28]
    add sp, sp, #0x3c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_020bede8
_LIT1: .word 0x000001ff
_LIT2: .word 0xfe00ff00
_LIT3: .word 0x3fff3fff
