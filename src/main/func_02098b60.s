; func_02098b60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02097f10
        .extern func_02097ff0
        .extern func_02098088
        .extern func_02098104
        .extern func_02098388
        .extern func_02098c70
        .global func_02098b60
        .arm
func_02098b60:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x54
    movs r9, r1
    ldreq r5, [sp, #0x74]
    ldreq r6, [sp, #0x70]
    ldrne r5, [sp, #0x7c]
    ldrne r6, [sp, #0x78]
    mov r7, r2, lsl #0x5
    cmp r7, r5
    mov r4, r0
    mov r8, r3
    addcs sp, sp, #0x54
    movcs r0, #0x0
    ldmcsia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bxcs lr
    add r0, sp, #0xc
    bl func_02098388
    mvn ip, #0x0
    add r0, sp, #0xc
    mov r1, r8
    add r2, r6, r7
    add r3, r6, r5
    str ip, [sp]
    bl func_02098104
    cmp r0, #0x0
    addeq sp, sp, #0x54
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bxeq lr
    add r0, sp, #0xc
    mov r1, r4
    mov r2, #0x20
    bl func_02097f10
    cmp r0, #0x20
    beq .L_25c
    add r0, sp, #0xc
    bl func_02097ff0
    add sp, sp, #0x54
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
.L_25c:
    add r0, sp, #0xc
    bl func_02097ff0
    add r0, sp, #0x4
    mov r1, r4
    str r9, [r4, #0x20]
    bl func_02098c70
    add r1, sp, #0x4
    add r0, sp, #0xc
    ldmia r1, {r1, r2}
    bl func_02098088
    cmp r0, #0x0
    addeq sp, sp, #0x54
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bxeq lr
    ldr r1, [sp, #0x30]
    add r0, sp, #0xc
    str r1, [r4, #0x24]
    ldr r2, [sp, #0x34]
    ldr r1, [sp, #0x30]
    sub r1, r2, r1
    str r1, [r4, #0x28]
    bl func_02097ff0
    mov r0, #0x1
    add sp, sp, #0x54
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
