; func_02064ae4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020453b4
        .extern func_020453e8
        .extern func_02054148
        .extern func_020541b8
        .extern func_02054684
        .extern func_02054700
        .extern func_02054c30
        .extern func_02054dfc
        .extern func_02054e70
        .extern func_02054e8c
        .extern func_02055320
        .extern func_02064d48
        .extern func_02064d58
        .extern func_02064d88
        .extern func_02064dfc
        .extern func_020a73d4
        .global func_02064ae4
        .arm
func_02064ae4:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x1c
    mov r4, r1
    mov r6, r3
    mov r5, r0
    mov r7, r2
    bl func_02055320
    cmp r6, #0x0
    moveq r6, #0x10000
    cmp r7, #0x0
    add r1, sp, #0x14
    add r2, sp, #0x8
    mov r0, r4
    moveq r7, #0x10000
    bl func_02064dfc
    cmp r0, #0x0
    addeq sp, sp, #0x1c
    moveq r0, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    mov r0, #0x44
    bl func_020453e8
    movs r4, r0
    addeq sp, sp, #0x1c
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    mov r1, #0x0
    mov r2, #0x44
    bl func_020a73d4
    mvn r0, #0x0
    str r0, [r4]
    str r6, [r4, #0x3c]
    ldr r1, [sp, #0x30]
    str r7, [r4, #0x38]
    ldr r0, _LIT0
    str r1, [r4, #0x24]
    str r0, [sp]
    mov r0, #0x0
    ldr r3, _LIT1
    str r0, [sp, #0x4]
    mov r0, #0x4
    mov r1, #0x20
    mov r2, #0x2
    bl func_02054700
    str r0, [r4, #0xc]
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    bne .L_114
    mov r0, r4
    bl func_020453b4
    add sp, sp, #0x1c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_114:
    mov r0, #0x4
    ldr r2, _LIT2
    mov r1, r0
    bl func_020541b8
    str r0, [r4, #0x10]
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    bne .L_150
    ldr r0, [r4, #0xc]
    bl func_02054684
    mov r0, r4
    bl func_020453b4
    add sp, sp, #0x1c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_150:
    mov r0, #0x2
    mov r1, r0
    mov r2, #0x0
    bl func_02054e8c
    str r0, [r4]
    ldr r1, [r4]
    mvn r0, #0x0
    cmp r1, r0
    bne .L_198
    ldr r0, [r4, #0xc]
    bl func_02054684
    ldr r0, [r4, #0x10]
    bl func_02054148
    mov r0, r4
    bl func_020453b4
    add sp, sp, #0x1c
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_198:
    add r1, sp, #0xc
    mov r0, #0x0
    str r0, [r1]
    str r0, [r1, #0x4]
    ldrh r0, [sp, #0x8]
    ldr r3, [sp, #0x14]
    mov ip, #0x2
    mov r2, r0, asr #0x8
    mov r0, r0, lsl #0x8
    and r2, r2, #0xff
    and r0, r0, #0xff00
    orr r0, r2, r0
    strb ip, [sp, #0xd]
    str r3, [sp, #0x10]
    strh r0, [sp, #0xe]
    ldr r0, [r4]
    mov r2, #0x8
    bl func_02054dfc
    mvn r1, #0x0
    cmp r0, r1
    bne .L_218
    ldr r0, [r4]
    bl func_02054e70
    ldr r0, [r4, #0xc]
    bl func_02054684
    ldr r0, [r4, #0x10]
    bl func_02054148
    mov r0, r4
    bl func_020453b4
    add sp, sp, #0x1c
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_218:
    mov r0, #0x8
    str r0, [sp, #0x18]
    ldr r0, [r4]
    add r1, sp, #0xc
    add r2, sp, #0x18
    bl func_02054c30
    ldr r1, [sp, #0x10]
    mov r0, #0x0
    str r1, [r4, #0x4]
    ldrh r1, [sp, #0xe]
    mov r2, r1, asr #0x8
    mov r1, r1, lsl #0x8
    and r2, r2, #0xff
    and r1, r1, #0xff00
    orr r1, r2, r1
    strh r1, [r4, #0x8]
    str r4, [r5]
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word func_02064d58
_LIT1: .word func_02064d88
_LIT2: .word func_02064d48
