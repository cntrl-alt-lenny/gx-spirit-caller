; func_0209e930 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02092800
        .extern func_02094500
        .extern func_02094688
        .extern func_0209da94
        .extern func_0209dbb4
        .extern func_0209dbc4
        .extern func_0209dd68
        .global func_0209e930
        .arm
func_0209e930:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x2c
    mov r7, r0
    mov r6, r1
    mov r0, #0x1
    mov r1, #0x2
    mov r5, r2
    mov r4, r3
    bl func_0209da94
    cmp r0, #0x0
    addne sp, sp, #0x2c
    ldmneia sp!, {r4, r5, r6, r7, lr}
    bxne lr
    cmp r6, #0x0
    addeq sp, sp, #0x2c
    moveq r0, #0x6
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    ldrh r1, [r6]
    mov r0, r6
    mov r1, r1, lsl #0x1
    bl func_02092800
    bl func_0209dbb4
    add r1, r0, #0x100
    mov r2, #0x0
    strh r2, [r1, #0x50]
    str r2, [r0, #0x14c]
    mov r1, r7
    mov r0, #0xc
    bl func_0209dd68
    mov r0, #0xc
    strh r0, [sp]
    str r6, [sp, #0x4]
    cmp r5, #0x0
    beq .L_1a8
    add r1, sp, #0x8
    mov r0, r5
    mov r2, #0x18
    bl func_02094688
    b .L_1b8
.L_1a8:
    add r0, sp, #0x8
    mov r1, #0x0
    mov r2, #0x18
    bl func_02094500
.L_1b8:
    ldrh r2, [sp, #0x40]
    add r0, sp, #0x0
    mov r1, #0x28
    str r4, [sp, #0x20]
    strh r2, [sp, #0x26]
    bl func_0209dbc4
    cmp r0, #0x0
    moveq r0, #0x2
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
