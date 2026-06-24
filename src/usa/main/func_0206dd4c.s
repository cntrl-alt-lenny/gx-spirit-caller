; func_0206dd4c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_0206be80
        .extern func_0206e4dc
        .extern func_0206e4f4
        .extern func_02070ac4
        .extern func_02070b58
        .extern func_02070e3c
        .extern func_02070f28
        .extern func_02091a0c
        .global func_0206dd4c
        .arm
func_0206dd4c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r4, [r0, #0x4]
    mov r1, #0x1
    ldrsb r0, [r4, #0x73]
    cmp r0, #0x0
    beq .L_1e0
    cmp r0, #0x4
    movne r1, #0x0
.L_1e0:
    cmp r1, #0x0
    beq .L_200
    ldr r0, [r4, #0x68]
    add r0, r0, #0x20
    bl func_02091a0c
    bl func_02070b58
    bl func_02070ac4
    bl func_02070e3c
.L_200:
    bl func_02070f28
    ldrsh r0, [r4, #0x70]
    mov r1, #0x0
    bic r0, r0, #0x6
    strh r0, [r4, #0x70]
    ldrsb r0, [r4, #0x73]
    cmp r0, #0x2
    ldreq r0, [r4, #0x68]
    ldrne r0, [r4, #0x64]
    bl func_0206be80
    bl OS_DisableIrq
    mov r5, r0
    mov r0, r4
    bl func_0206e4dc
    mov r0, r4
    bl func_0206e4f4
    mov r0, r5
    bl OS_RestoreIrq
    ldrsh r1, [r4, #0x70]
    mov r0, #0x0
    orr r1, r1, #0x20
    strh r1, [r4, #0x70]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
