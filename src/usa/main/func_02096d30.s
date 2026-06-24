; func_02096d30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02096fb4
        .global func_02096d30
        .arm
func_02096d30:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r5, r0
    ldr r4, [r5, #0x30]
    ldr r1, [r5, #0x8]
    add r0, sp, #0x4
    str r1, [sp, #0x4]
    ldr r3, [r5, #0x28]
    add r1, sp, #0x0
    mov r2, #0x1
    str r3, [sp, #0x8]
    bl func_02096fb4
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, lr}
    bxne lr
    ldrb r1, [sp]
    and r2, r1, #0x7f
    mov r1, r1, asr #0x7
    str r2, [r4, #0x10]
    and r1, r1, #0x1
    str r1, [r4, #0xc]
    ldr r2, [r4, #0x10]
    cmp r2, #0x0
    addeq sp, sp, #0xc
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, lr}
    bxeq lr
    ldr r1, [r5, #0x34]
    cmp r1, #0x0
    bne .L_688
    add r0, sp, #0x4
    add r1, r4, #0x14
    bl func_02096fb4
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, lr}
    bxne lr
    ldr r1, [r4, #0x10]
    mov r2, #0x0
    add r1, r4, r1
    strb r2, [r1, #0x14]
    b .L_694
.L_688:
    ldr r1, [sp, #0x8]
    add r1, r1, r2
    str r1, [sp, #0x8]
.L_694:
    ldr r1, [r4, #0xc]
    cmp r1, #0x0
    beq .L_6e8
    add r0, sp, #0x4
    add r1, sp, #0x2
    mov r2, #0x2
    bl func_02096fb4
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, lr}
    bxne lr
    ldr r2, [r5, #0x8]
    ldr r1, _LIT0
    str r2, [r4]
    ldrh r3, [sp, #0x2]
    mov r2, #0x0
    and r1, r3, r1
    strh r1, [r4, #0x4]
    strh r2, [r4, #0x6]
    str r2, [r4, #0x8]
    b .L_704
.L_6e8:
    ldr r1, [r5, #0x8]
    str r1, [r4]
    ldrh r1, [r5, #0x26]
    str r1, [r4, #0x4]
    ldrh r1, [r5, #0x26]
    add r1, r1, #0x1
    strh r1, [r5, #0x26]
.L_704:
    ldr r1, [sp, #0x8]
    str r1, [r5, #0x28]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word 0x00000fff
