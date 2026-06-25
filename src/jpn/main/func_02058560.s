; func_02058560 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021001a0
        .extern data_021001d4
        .extern data_021001e8
        .extern data_02100200
        .extern func_02045398
        .extern func_020584b4
        .extern func_020a6c60
        .global func_02058560
        .arm
func_02058560:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x14
    mov r4, r0
    ldr r5, [r4]
    mov r7, r1
    mov r6, r2
    cmp r5, #0x0
    bne .L_34
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x23
    bl func_020a6c60
.L_34:
    cmp r7, #0x0
    bne .L_50
    ldr r0, _LIT2
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x24
    bl func_020a6c60
.L_50:
    cmp r6, #0x1
    beq .L_74
    cmp r6, #0x0
    beq .L_74
    ldr r0, _LIT3
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x25
    bl func_020a6c60
.L_74:
    cmp r6, #0x1
    moveq r0, #0x1
    streq r0, [r5, #0x41c]
    ldr r1, [r5, #0x1a4]
    ldr r0, [r5, #0x1a8]
    cmp r1, #0x0
    str r1, [sp, #0x8]
    str r0, [sp, #0xc]
    addeq sp, sp, #0x14
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    mov r0, #0x10
    bl func_02045398
    movs r3, r0
    strne r7, [r3]
    strne r6, [r3, #0xc]
    ldrne r0, [r5, #0x418]
    add r1, sp, #0x8
    strne r0, [r3, #0x4]
    strne r5, [r3, #0x8]
    mov r0, #0x0
    str r0, [sp]
    mov r0, #0x1
    str r0, [sp, #0x4]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_020584b4
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_021001d4
_LIT1: .word data_021001a0
_LIT2: .word data_021001e8
_LIT3: .word data_02100200
