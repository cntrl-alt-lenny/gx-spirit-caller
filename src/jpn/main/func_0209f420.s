; func_0209f420 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern Fill32
        .extern func_020927e4
        .extern func_0209da94
        .extern func_0209dbb4
        .extern func_0209dbc4
        .extern func_0209dd68
        .extern func_0209e534
        .extern func_0209e61c
        .global func_0209f420
        .arm
func_0209f420:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x34
    mov r9, r0
    mov r8, r1
    mov r7, r2
    mov r6, r3
    bl func_0209dbb4
    ldr r5, [r0, #0x4]
    mov r0, #0x2
    mov r1, #0x7
    mov r2, #0x8
    bl func_0209da94
    cmp r0, #0x0
    addne sp, sp, #0x34
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bxne lr
    add r0, r5, #0x188
    mov r1, #0x2
    bl func_020927e4
    add r0, r5, #0xc6
    mov r1, #0x2
    bl func_020927e4
    add r0, r5, #0x100
    ldrh r0, [r0, #0x88]
    cmp r0, #0x0
    beq .L_80
    ldrh r0, [r5, #0xc6]
    cmp r0, #0x1
    addne sp, sp, #0x34
    movne r0, #0x3
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bxne lr
.L_80:
    add r0, r5, #0xc
    mov r1, #0x4
    bl func_020927e4
    ldr r0, [r5, #0xc]
    cmp r0, #0x1
    addeq sp, sp, #0x34
    moveq r0, #0x3
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bxeq lr
    ands r0, r7, #0x3f
    addne sp, sp, #0x34
    movne r0, #0x6
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bxne lr
    ldrh r4, [sp, #0x50]
    ands r0, r4, #0x1f
    addne sp, sp, #0x34
    movne r0, #0x6
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bxne lr
    add r0, r5, #0x9c
    mov r1, #0x2
    bl func_020927e4
    ldrh r0, [r5, #0x9c]
    cmp r0, #0x0
    bne .L_118
    bl func_0209e534
    cmp r7, r0
    addlt sp, sp, #0x34
    movlt r0, #0x6
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bxlt lr
    bl func_0209e61c
    cmp r4, r0
    addlt sp, sp, #0x34
    movlt r0, #0x6
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bxlt lr
.L_118:
    mov r1, r9
    mov r0, #0xe
    bl func_0209dd68
    add r1, sp, #0x0
    mov r0, #0x0
    mov r2, #0x30
    bl Fill32
    ldrh r3, [sp, #0x50]
    mov r4, r7, lsr #0x1
    mov r5, #0xe
    ldr r0, [sp, #0x54]
    add r1, sp, #0x14
    mov r2, #0x1c
    strh r5, [sp]
    str r8, [sp, #0x4]
    str r4, [sp, #0x8]
    str r6, [sp, #0xc]
    str r3, [sp, #0x10]
    bl Copy32
    add r0, sp, #0x0
    mov r1, #0x30
    bl func_0209dbc4
    cmp r0, #0x0
    moveq r0, #0x2
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
