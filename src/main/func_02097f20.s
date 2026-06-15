; func_02097f20 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_02091a8c
        .extern func_02097a04
        .global func_02097f20
        .arm
func_02097f20:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r6, r0
    mov r5, #0x0
    bl OS_DisableIrq
    ldr r1, [r6, #0xc]
    mov r4, r0
    ands r0, r1, #0x1
    movne r0, #0x1
    moveq r0, r5
    cmp r0, #0x0
    beq .L_90
    ldr r0, [r6, #0xc]
    ands r0, r0, #0x44
    moveq r5, #0x1
    movne r5, #0x0
    cmp r5, #0x0
    beq .L_70
    ldr r0, [r6, #0xc]
    orr r0, r0, #0x4
    str r0, [r6, #0xc]
    add r7, r6, #0x18
.L_58:
    mov r0, r7
    bl func_02091a8c
    ldr r0, [r6, #0xc]
    ands r0, r0, #0x40
    beq .L_58
    b .L_90
.L_70:
    add r0, r6, #0x18
    bl func_02091a8c
    ldr r0, [r6, #0xc]
    ands r0, r0, #0x1
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    bne .L_70
.L_90:
    mov r0, r4
    bl OS_RestoreIrq
    cmp r5, #0x0
    beq .L_b4
    mov r0, r6
    bl func_02097a04
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_b4:
    ldr r0, [r6, #0x14]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
