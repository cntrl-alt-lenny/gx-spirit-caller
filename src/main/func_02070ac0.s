; func_02070ac0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_020918d0
        .extern func_02091a8c
        .global func_02070ac0
        .arm
func_02070ac0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r4, r1
    ldr r1, [r4, #0x44]
    mov r5, r0
    cmp r1, #0x0
    bne .L_ebc
    ldrb r0, [r4, #0x8]
    cmp r0, #0x4
    bne .L_ebc
    bl OS_DisableIrq
    mov r8, r0
    mov r7, #0x2
    mov r6, #0x0
    b .L_e98
.L_e8c:
    mov r0, r6
    str r7, [r4, #0x4]
    bl func_02091a8c
.L_e98:
    ldr r0, [r4, #0x44]
    cmp r0, #0x0
    bne .L_eb0
    ldrb r0, [r4, #0x8]
    cmp r0, #0x4
    beq .L_e8c
.L_eb0:
    mov r0, r8
    bl OS_RestoreIrq
    b .L_ec0
.L_ebc:
    bl func_020918d0
.L_ec0:
    ldr r0, [r4, #0x44]
    str r0, [r5]
    ldr r0, [r5]
    cmp r0, #0x0
    ldrne r0, [r4, #0x40]
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
