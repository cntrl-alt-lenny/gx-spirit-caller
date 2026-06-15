; func_020a6924 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020928e8
        .extern func_02094688
        .global func_020a6924
        .arm
func_020a6924:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    movs r4, r0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, lr}
    bxeq lr
    ldrh r0, [r4, #0x3c]
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, lr}
    bxeq lr
    add r1, sp, #0x0
    add r0, r4, #0x50
    mov r2, #0x8
    bl func_02094688
    add r0, sp, #0x0
    mov r1, #0x8
    bl func_020928e8
    ldr r0, [r4, #0x44]
    cmp r0, #0x0
    bne .L_2d0
    ldrh r1, [sp]
    ldr r0, _LIT0
    cmp r1, r0
    beq .L_2b8
    ldrh r1, [sp]
    ldr r0, _LIT1
    cmp r1, r0
    bne .L_2d0
.L_2b8:
    ldrh r0, [sp, #0x6]
    cmp r0, #0x4
    addeq sp, sp, #0x8
    moveq r0, #0x1
    ldmeqia sp!, {r4, lr}
    bxeq lr
.L_2d0:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word 0x00002348
_LIT1: .word 0x0000bd8a
