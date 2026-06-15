; func_0206ddc0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_0206bef4
        .extern func_0206e550
        .extern func_0206e568
        .extern func_02070bac
        .extern func_02070c40
        .extern func_02070f24
        .extern func_02071010
        .extern func_02091af4
        .global func_0206ddc0
        .arm
func_0206ddc0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r4, [r0, #0x4]
    mov r1, #0x1
    ldrsb r0, [r4, #0x73]
    cmp r0, #0x0
    beq .L_624
    cmp r0, #0x4
    movne r1, #0x0
.L_624:
    cmp r1, #0x0
    beq .L_644
    ldr r0, [r4, #0x68]
    add r0, r0, #0x20
    bl func_02091af4
    bl func_02070c40
    bl func_02070bac
    bl func_02070f24
.L_644:
    bl func_02071010
    ldrsh r0, [r4, #0x70]
    mov r1, #0x0
    bic r0, r0, #0x6
    strh r0, [r4, #0x70]
    ldrsb r0, [r4, #0x73]
    cmp r0, #0x2
    ldreq r0, [r4, #0x68]
    ldrne r0, [r4, #0x64]
    bl func_0206bef4
    bl OS_DisableIrq
    mov r5, r0
    mov r0, r4
    bl func_0206e550
    mov r0, r4
    bl func_0206e568
    mov r0, r5
    bl OS_RestoreIrq
    ldrsh r1, [r4, #0x70]
    mov r0, #0x0
    orr r1, r1, #0x20
    strh r1, [r4, #0x70]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
