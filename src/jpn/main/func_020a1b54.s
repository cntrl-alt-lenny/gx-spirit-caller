; func_020a1b54 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a981c
        .extern func_020a08a8
        .global func_020a1b54
        .arm
func_020a1b54:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r5, r1
    mov r7, r0
    bl OS_DisableIrq
    mov r4, r0
    cmp r5, #0x3
    addls pc, pc, r5, lsl #0x2
    b .L_64
    b .L_34
    b .L_40
    b .L_4c
    b .L_58
.L_34:
    mov r5, #0xa
    mov r6, #0x4
    b .L_7c
.L_40:
    mov r5, #0xa
    mov r6, #0x3
    b .L_7c
.L_4c:
    mov r5, #0xe
    mov r6, #0x2
    b .L_7c
.L_58:
    mov r5, #0x7
    mov r6, #0x5
    b .L_7c
.L_64:
    mov r0, r4
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_7c:
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    beq .L_e0
    mov r0, r7
    bl func_020a08a8
    cmp r0, #0x0
    beq .L_e0
    ldr r0, _LIT0
    sub r2, r7, #0x1
    ldr r1, [r0]
    add r0, r1, r2, lsl #0x2
    add r0, r0, #0x1000
    ldr r0, [r0, #0x4e8]
    cmp r5, r0
    bne .L_e0
    add r0, r1, r2, lsl #0x1
    add r1, r0, #0x1700
    mov r0, r4
    strh r6, [r1, #0x54]
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_e0:
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word data_021a981c
