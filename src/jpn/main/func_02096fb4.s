; func_02096fb4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_020919a4
        .global func_02096fb4
        .arm
func_02096fb4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r0
    ldr r5, [r7]
    mov r6, r2
    ldr r2, [r5, #0x1c]
    mov r0, r5
    orr r2, r2, #0x200
    str r2, [r5, #0x1c]
    ldr r2, [r7, #0x4]
    ldr r4, [r5, #0x50]
    mov r3, r6
    blx r4
    cmp r0, #0x0
    beq .L_4c
    cmp r0, #0x1
    beq .L_4c
    cmp r0, #0x6
    beq .L_5c
    b .L_98
.L_4c:
    ldr r1, [r5, #0x1c]
    bic r1, r1, #0x200
    str r1, [r5, #0x1c]
    b .L_98
.L_5c:
    bl OS_DisableIrq
    ldr r1, [r5, #0x1c]
    mov r4, r0
    ands r0, r1, #0x200
    beq .L_88
    add r8, r5, #0xc
.L_74:
    mov r0, r8
    bl func_020919a4
    ldr r0, [r5, #0x1c]
    ands r0, r0, #0x200
    bne .L_74
.L_88:
    mov r0, r4
    bl OS_RestoreIrq
    ldr r0, [r5, #0x24]
    ldr r0, [r0, #0x14]
.L_98:
    ldr r1, [r7, #0x4]
    add r1, r1, r6
    str r1, [r7, #0x4]
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
