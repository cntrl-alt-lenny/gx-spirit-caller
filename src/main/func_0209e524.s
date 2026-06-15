; func_0209e524 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020928cc
        .extern func_0209dc8c
        .extern func_0209dca8
        .global func_0209e524
        .arm
func_0209e524:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x40
    mov r5, r0
    mov r4, r1
    bl func_0209dca8
    mov r6, r0
    bl func_0209dc8c
    cmp r0, #0x0
    addne sp, sp, #0x40
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, lr}
    bxne lr
    cmp r4, #0x1
    bcc .L_40
    cmp r4, #0xf
    bls .L_50
.L_40:
    add sp, sp, #0x40
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_50:
    ldr r2, [r6, #0x4]
    ldr r0, _LIT0
    mov r1, #0x2
    add r0, r2, r0
    bl func_020928cc
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    add r0, r0, #0x100
    ldrh r2, [r0, #0x82]
    mov r0, r1, lsl r4
    ands r0, r2, r0
    addeq sp, sp, #0x40
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    ldrh r0, [r5, #0x4]
    cmp r0, #0x0
    addeq sp, sp, #0x40
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    add r0, r5, #0xa
    str r0, [sp]
    mov r3, #0x0
    add r2, sp, #0x0
.L_b4:
    ldr r0, [r2, r3, lsl #0x2]
    ldrh r1, [r0, #0x4]
    cmp r4, r1
    addeq sp, sp, #0x40
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    add r3, r3, #0x1
    sub r0, r3, #0x1
    ldrh r1, [r5, #0x6]
    ldr r0, [r2, r0, lsl #0x2]
    add r0, r1, r0
    str r0, [r2, r3, lsl #0x2]
    ldrh r0, [r5, #0x4]
    cmp r3, r0
    blt .L_b4
    mov r0, #0x0
    add sp, sp, #0x40
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word 0x00000182
