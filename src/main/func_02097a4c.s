; func_02097a4c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_02091a0c
        .extern func_020965ac
        .extern func_02097af0
        .global func_02097a4c
        .arm
func_02097a4c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    movs r6, r0
    ldr r5, [r6, #0x8]
    ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
    bxeq lr
    mov r7, #0x0
    mov r8, #0x1
.L_220:
    bl OS_DisableIrq
    ldr r1, [r6, #0xc]
    mov r4, r0
    orr r0, r1, #0x40
    str r0, [r6, #0xc]
    ldr r0, [r6, #0xc]
    ands r0, r0, #0x4
    movne r0, r8
    moveq r0, r7
    cmp r0, #0x0
    beq .L_264
    add r0, r6, #0x18
    bl func_02091a0c
    mov r0, r4
    bl OS_RestoreIrq
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_264:
    ldr r1, [r6, #0xc]
    mov r0, r4
    orr r1, r1, #0x8
    str r1, [r6, #0xc]
    bl OS_RestoreIrq
    ldr r1, [r6, #0x10]
    mov r0, r6
    bl func_020965ac
    cmp r0, #0x6
    ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
    bxeq lr
    mov r0, r5
    bl func_02097af0
    movs r6, r0
    bne .L_220
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
