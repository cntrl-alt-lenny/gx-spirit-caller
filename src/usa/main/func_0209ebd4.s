; func_0209ebd4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0209da94
        .extern func_0209dbc4
        .extern func_0209dd68
        .global func_0209ebd4
        .arm
func_0209ebd4:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x14
    mov r5, r0
    mov r0, #0x3
    mov r4, r1
    mov r2, r0
    mov r1, #0x2
    mov r3, #0x5
    bl func_0209da94
    cmp r0, #0x0
    addne sp, sp, #0x14
    ldmneia sp!, {r4, r5, lr}
    bxne lr
    cmp r4, #0x0
    addeq sp, sp, #0x14
    moveq r0, #0x6
    ldmeqia sp!, {r4, r5, lr}
    bxeq lr
    ldr r0, [r4]
    cmp r0, #0x0
    addeq sp, sp, #0x14
    moveq r0, #0x6
    ldmeqia sp!, {r4, r5, lr}
    bxeq lr
    ldrh r0, [r4, #0x4]
    cmp r0, #0x1
    bcc .L_1f4
    cmp r0, #0xe
    bls .L_204
.L_1f4:
    add sp, sp, #0x14
    mov r0, #0x6
    ldmia sp!, {r4, r5, lr}
    bx lr
.L_204:
    mov r1, r5
    mov r0, #0xa
    bl func_0209dd68
    mov r0, #0xa
    strh r0, [sp]
    ldrh r2, [r4, #0x4]
    add r0, sp, #0x0
    mov r1, #0x10
    strh r2, [sp, #0x2]
    ldr r2, [r4]
    str r2, [sp, #0x4]
    ldrh r2, [r4, #0x6]
    strh r2, [sp, #0x8]
    ldrb r2, [r4, #0x8]
    strb r2, [sp, #0xa]
    ldrb r2, [r4, #0x9]
    strb r2, [sp, #0xb]
    ldrb r2, [r4, #0xa]
    strb r2, [sp, #0xc]
    ldrb r2, [r4, #0xb]
    strb r2, [sp, #0xd]
    ldrb r2, [r4, #0xc]
    strb r2, [sp, #0xe]
    ldrb r2, [r4, #0xd]
    strb r2, [sp, #0xf]
    bl func_0209dbc4
    cmp r0, #0x0
    moveq r0, #0x2
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, lr}
    bx lr
