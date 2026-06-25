; func_02070898 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_0207229c
        .extern func_020a7294
        .global func_02070898
        .arm
func_02070898:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r4, r1
    mov r7, r0
    bl OS_DisableIrq
    ldr r2, [r4, #0x44]
    ldr r1, [r4, #0x3c]
    mov r6, r0
    cmp r2, r1
    mov r5, #0x0
    bne .L_34
    cmp r7, #0x0
    movne r5, #0x1
.L_34:
    cmp r7, r2
    movcs r0, #0x0
    strcs r0, [r4, #0x44]
    bcs .L_58
    ldr r0, [r4, #0x40]
    sub r2, r2, r7
    add r1, r0, r7
    str r2, [r4, #0x44]
    bl func_020a7294
.L_58:
    mov r0, r6
    bl OS_RestoreIrq
    ldrb r0, [r4, #0x8]
    cmp r0, #0xa
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    cmp r0, #0xb
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    ldr r0, [r4, #0x44]
    cmp r0, #0x0
    beq .L_a0
    cmp r5, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
.L_a0:
    mov r0, r4
    mov r1, #0x1b
    bl func_0207229c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
