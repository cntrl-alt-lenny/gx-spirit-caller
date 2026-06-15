; func_02064864 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020453b4
        .extern func_02054148
        .extern func_020541b8
        .extern func_02054568
        .extern func_02055330
        .extern func_02061540
        .extern func_02064a88
        .extern func_02064d10
        .extern func_020a73d4
        .global func_02064864
        .arm
func_02064864:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r4, r3
    mov r5, r2
    mov r6, r1
    mov r3, #0x0
    mov r1, r5
    mov r2, r4
    mov r7, r0
    str r3, [sp]
    bl func_02064d10
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x5
    ldmneia sp!, {r4, r5, r6, r7, pc}
    bl func_02064a88
    str r0, [sp]
    cmp r0, #0x0
    beq .L_540
    mov r1, #0x0
    mov r2, #0xa0
    bl func_020a73d4
    ldr r0, [sp]
    str r5, [r0]
    ldr r0, [sp]
    strh r4, [r0, #0x4]
    ldr r0, [sp]
    str r7, [r0, #0x8]
    bl func_02055330
    ldr r2, [sp]
    mov r1, #0x0
    str r0, [r2, #0x1c]
    ldr r2, [sp]
    ldr r0, [r2, #0x1c]
    str r0, [r2, #0x88]
    ldr r0, [sp]
    strh r1, [r0, #0x64]
    ldr r0, [sp]
    strh r1, [r0, #0x66]
    ldr r0, [sp]
    ldr r1, [r7, #0x3c]
    add r0, r0, #0x44
    bl func_02061540
    cmp r0, #0x0
    beq .L_540
    ldr r0, [sp]
    ldr r1, [r7, #0x38]
    add r0, r0, #0x50
    bl func_02061540
    cmp r0, #0x0
    beq .L_540
    mov r0, #0x10
    mov r1, #0x40
    mov r2, #0x0
    bl func_020541b8
    ldr r1, [sp]
    str r0, [r1, #0x5c]
    ldr r0, [sp]
    ldr r0, [r0, #0x5c]
    cmp r0, #0x0
    beq .L_540
    mov r0, #0x10
    mov r1, #0x40
    mov r2, #0x0
    bl func_020541b8
    ldr r1, [sp]
    str r0, [r1, #0x60]
    ldr r0, [sp]
    ldr r0, [r0, #0x60]
    cmp r0, #0x0
    beq .L_540
    mov r0, #0x4
    mov r1, #0x2
    mov r2, #0x0
    bl func_020541b8
    ldr r1, [sp]
    str r0, [r1, #0x98]
    ldr r0, [sp]
    ldr r0, [r0, #0x98]
    cmp r0, #0x0
    beq .L_540
    mov r0, #0x4
    mov r1, #0x2
    mov r2, #0x0
    bl func_020541b8
    ldr r1, [sp]
    str r0, [r1, #0x9c]
    ldr r0, [sp]
    ldr r0, [r0, #0x9c]
    cmp r0, #0x0
    beq .L_540
    ldr r0, [r7, #0xc]
    add r1, sp, #0x0
    bl func_02054568
    mov r0, r7
    mov r1, r5
    mov r2, r4
    bl func_02064d10
    str r0, [r6]
    ldr r0, [r6]
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, pc}
.L_540:
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_5b8
    ldr r0, [r0, #0x44]
    bl func_020453b4
    ldr r0, [sp]
    ldr r0, [r0, #0x50]
    bl func_020453b4
    ldr r0, [sp]
    ldr r0, [r0, #0x5c]
    cmp r0, #0x0
    beq .L_574
    bl func_02054148
.L_574:
    ldr r0, [sp]
    ldr r0, [r0, #0x60]
    cmp r0, #0x0
    beq .L_588
    bl func_02054148
.L_588:
    ldr r0, [sp]
    ldr r0, [r0, #0x98]
    cmp r0, #0x0
    beq .L_59c
    bl func_02054148
.L_59c:
    ldr r0, [sp]
    ldr r0, [r0, #0x9c]
    cmp r0, #0x0
    beq .L_5b0
    bl func_02054148
.L_5b0:
    ldr r0, [sp]
    bl func_020453b4
.L_5b8:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
