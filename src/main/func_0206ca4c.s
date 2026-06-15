; func_0206ca4c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_0219ecd8
        .extern data_0219ed40
        .extern func_02091a0c
        .extern func_02094688
        .global func_0206ca4c
        .arm
func_0206ca4c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    mov r7, r2
    ldr r6, [r7, #0x64]
    mov r9, r0
    mov r8, r1
    bl OS_DisableIrq
    add r1, r6, #0x100
    ldrh r2, [r1, #0x8]
    ldrh r1, [r1, #0xa]
    mov r4, r0
    add r0, r2, r8
    cmp r1, r0
    bcc .L_820
    ldr r1, _LIT0
    add r0, r8, #0xc
    ldr r1, [r1]
    ldr r1, [r1, #0x18]
    blx r1
    movs r5, r0
    beq .L_80c
    add r1, r6, #0x100
    ldrh r3, [r1, #0x8]
    mov r2, #0x0
    mov r0, r9
    add r3, r3, r8
    strh r3, [r1, #0x8]
    str r2, [r5]
    strh r8, [r5, #0x4]
    ldrh r3, [r7, #0x18]
    mov r2, r8
    add r1, r5, #0xc
    strh r3, [r5, #0x6]
    ldr r3, [r7, #0x1c]
    str r3, [r5, #0x8]
    bl func_02094688
    ldr r0, [r6, #0x100]
    cmp r0, #0x0
    ldrne r0, [r6, #0x100]
    strne r5, [r0]
    str r5, [r6, #0x100]
    ldr r0, [r6, #0x104]
    cmp r0, #0x0
    streq r5, [r6, #0x104]
    b .L_830
.L_80c:
    ldr r0, _LIT1
    ldr r1, [r0]
    add r1, r1, #0x1
    str r1, [r0]
    b .L_830
.L_820:
    ldr r0, _LIT1
    ldr r1, [r0, #0x4]
    add r1, r1, #0x1
    str r1, [r0, #0x4]
.L_830:
    ldrh r0, [r7, #0x74]
    cmp r0, #0x0
    ldreqh r0, [r7, #0xa]
    streqh r0, [r7, #0x74]
    ldrh r1, [r7, #0x1a]
    add r0, r6, #0x10c
    strh r1, [r7, #0x18]
    ldr r1, [r7, #0x20]
    str r1, [r7, #0x1c]
    bl func_02091a0c
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
_LIT0: .word data_0219ecd8
_LIT1: .word data_0219ed40
