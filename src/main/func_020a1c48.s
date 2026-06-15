; func_020a1c48 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a98fc
        .extern func_020a099c
        .global func_020a1c48
        .arm
func_020a1c48:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r5, r1
    mov r7, r0
    bl OS_DisableIrq
    mov r4, r0
    cmp r5, #0x3
    addls pc, pc, r5, lsl #0x2
    b .L_12e4
    b .L_12b4
    b .L_12c0
    b .L_12cc
    b .L_12d8
.L_12b4:
    mov r5, #0xa
    mov r6, #0x4
    b .L_12fc
.L_12c0:
    mov r5, #0xa
    mov r6, #0x3
    b .L_12fc
.L_12cc:
    mov r5, #0xe
    mov r6, #0x2
    b .L_12fc
.L_12d8:
    mov r5, #0x7
    mov r6, #0x5
    b .L_12fc
.L_12e4:
    mov r0, r4
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_12fc:
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    beq .L_1360
    mov r0, r7
    bl func_020a099c
    cmp r0, #0x0
    beq .L_1360
    ldr r0, _LIT0
    sub r2, r7, #0x1
    ldr r1, [r0]
    add r0, r1, r2, lsl #0x2
    add r0, r0, #0x1000
    ldr r0, [r0, #0x4e8]
    cmp r5, r0
    bne .L_1360
    add r0, r1, r2, lsl #0x1
    add r1, r0, #0x1700
    mov r0, r4
    strh r6, [r1, #0x54]
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_1360:
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word data_021a98fc
