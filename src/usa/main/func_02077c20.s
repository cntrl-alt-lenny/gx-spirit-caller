; func_02077c20 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a063c
        .extern func_02092fc8
        .extern func_02094688
        .global func_02077c20
        .arm
func_02077c20:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    mov r7, r1
    mov r6, r2
    bl OS_DisableIrq
    mov r1, #0x0
    ldr r4, _LIT0
    mov r5, r0
    strb r1, [r8, #0x30]
.L_124:
    ldrb r0, [r4, #0x5a]
    cmp r0, #0x0
    beq .L_184
    ldr r0, [r4, #0x54]
    cmp r0, r7
    bne .L_184
    ldrh r0, [r4, #0x58]
    cmp r0, r6
    bne .L_184
    mov r0, r4
    add r1, r8, #0x74
    mov r2, #0x20
    bl func_02094688
    mov r1, r8
    add r0, r4, #0x20
    mov r2, #0x30
    bl func_02094688
    bl func_02092fc8
    mov r0, r0, lsr #0x10
    orr r0, r0, r1, lsl #0x10
    str r0, [r4, #0x50]
    mov r0, #0x1
    strb r0, [r8, #0x30]
    b .L_194
.L_184:
    add r1, r1, #0x1
    cmp r1, #0x4
    add r4, r4, #0x5c
    blt .L_124
.L_194:
    mov r0, r5
    bl OS_RestoreIrq
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
_LIT0: .word data_021a063c
