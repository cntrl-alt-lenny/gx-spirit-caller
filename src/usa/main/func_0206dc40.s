; func_0206dc40 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_0219ebf8
        .extern func_0206db90
        .extern func_0206e478
        .extern func_0206e4dc
        .extern func_02091924
        .global func_0206dc40
        .arm
func_0206dc40:
    stmdb sp!, {r4, r5, r6, lr}
    movs r4, r0
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    mov r0, #0x0
    strh r0, [r4, #0x70]
    ldrsb r1, [r4, #0x73]
    mov r2, #0x1
    cmp r1, #0x0
    beq .L_30
    cmp r1, #0x4
    movne r2, r0
.L_30:
    cmp r2, #0x0
    beq .L_4c
    ldr r0, [r4, #0x68]
    bl func_0206db90
    ldr r0, [r4, #0x64]
    bl func_0206db90
    b .L_cc
.L_4c:
    cmp r1, #0x1
    bne .L_bc
    ldr r0, [r4, #0x64]
    ldr r0, [r0, #0x104]
    cmp r0, #0x0
    beq .L_84
    ldr r5, _LIT0
.L_68:
    ldr r1, [r5]
    ldr r6, [r0]
    ldr r1, [r1, #0x1c]
    blx r1
    mov r0, r6
    cmp r6, #0x0
    bne .L_68
.L_84:
    ldr r0, [r4, #0x64]
    mov r1, #0x0
    add r0, r0, #0x100
    strh r1, [r0, #0x8]
    ldr r0, [r4, #0x64]
    str r1, [r0, #0x100]
    ldr r0, [r4, #0x64]
    str r1, [r0, #0x104]
    ldr r0, [r4, #0x64]
    add r0, r0, #0x10c
    bl func_02091924
    ldr r0, [r4, #0x64]
    bl func_0206db90
    b .L_cc
.L_bc:
    cmp r1, #0x2
    bne .L_cc
    ldr r0, [r4, #0x68]
    bl func_0206db90
.L_cc:
    bl OS_DisableIrq
    mov r5, r0
    mov r0, r4
    bl func_0206e4dc
    mov r0, r4
    bl func_0206e478
    ldr r1, _LIT0
    mov r0, r4
    ldr r1, [r1]
    ldr r1, [r1, #0x1c]
    blx r1
    mov r0, r5
    bl OS_RestoreIrq
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_0219ebf8
