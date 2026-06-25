; func_0209f9f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_02094398
        .extern func_020943b0
        .extern func_0209f7d4
        .global func_0209f9f0
        .arm
func_0209f9f0:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    mov r3, r1
    mov r0, #0x1
    mov r0, r0, lsl r3
    add ip, r7, #0x800
    mov r0, r0, lsl #0x10
    ldrh r1, [ip, #0xe]
    mov r5, r0, lsr #0x10
    mov r6, r2
    ands r0, r1, r5
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    ldrh r4, [ip, #0x8]
    mov r0, r4, lsl #0x9
    ldrh r0, [r7, r0]
    ands r0, r5, r0
    bne .L_200
    ldrh r0, [ip, #0x18]
    cmp r0, #0x1
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, r6, r7, lr}
    bxne lr
    add r0, r4, #0x1
    and r0, r0, #0x3
    mov r0, r0, lsl #0x10
    mov r4, r0, lsr #0x10
    mov r0, r4, lsl #0x9
    ldrh r0, [r7, r0]
    ands r0, r5, r0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
.L_200:
    add r2, r7, r4, lsl #0x9
    mov r0, r7
    add r2, r2, #0x4
    bl func_0209f7d4
    mov r1, r0
    cmp r6, #0x0
    beq .L_230
    add r0, r7, #0x800
    ldrh r2, [r0, #0x10]
    mov r0, r6
    bl func_020943b0
    b .L_240
.L_230:
    add r0, r7, #0x800
    ldrh r2, [r0, #0x10]
    mov r0, #0x0
    bl func_02094398
.L_240:
    bl OS_DisableIrq
    mov r4, r4, lsl #0x9
    ldrh r3, [r7, r4]
    mvn r1, r5
    add r2, r7, #0x2
    and r1, r3, r1
    strh r1, [r7, r4]
    ldrh r1, [r2, r4]
    orr r1, r1, r5
    strh r1, [r2, r4]
    bl OS_RestoreIrq
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
