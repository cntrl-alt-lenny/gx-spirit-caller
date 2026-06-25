; func_0206c280 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206c24c
        .extern func_0206e3f4
        .global func_0206c280
        .arm
func_0206c280:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldrh r0, [r5, #0x2]
    mov r4, #0x80
    cmp r0, #0x0
    beq .L_40
    add r4, r4, #0x114
    bl func_0206e3f4
    add r4, r4, r0
    ldrh r0, [r5, #0x8]
    bl func_0206e3f4
    add r4, r4, r0
    add r0, r5, #0x10
    bl func_0206c24c
    add r4, r4, r0
.L_40:
    ldrh r0, [r5, #0x6]
    cmp r0, #0x0
    beq .L_7c
    add r4, r4, #0x110
    bl func_0206e3f4
    add r4, r4, r0
    ldrh r0, [r5, #0xa]
    bl func_0206e3f4
    add r4, r4, r0
    ldrh r0, [r5, #0xc]
    bl func_0206e3f4
    add r4, r4, r0
    add r0, r5, #0x14
    bl func_0206c24c
    add r4, r4, r0
.L_7c:
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
