; func_020a0da8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02093b08
        .extern func_020976cc
        .extern func_02097e1c
        .extern func_02097efc
        .extern func_02098010
        .extern func_02098294
        .global func_020a0da8
        .arm
func_020a0da8:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4c
    ldr r4, [r0, #0x14]
    ldr r5, [r0, #0x10]
    add r0, sp, #0x4
    bl func_02098294
    ldr r1, [r4, #0x14]
    add r0, r4, #0x10
    ldr r4, [r5]
    bl func_020976cc
    mvn r1, #0x0
    str r1, [sp]
    ldr r2, [r5, #0x4]
    mov r1, r0
    add r3, r4, r2
    add r0, sp, #0x4
    mov r2, r4
    bl func_02098010
    cmp r0, #0x0
    beq .L_4c8
    ldr r1, [r5, #0x8]
    ldr r2, [r5, #0x4]
    add r0, sp, #0x4
    bl func_02097e1c
    ldr r1, [r5, #0x4]
    cmp r1, r0
    moveq r0, #0x2
    streq r0, [r5, #0xc]
    add r0, sp, #0x4
    bl func_02097efc
.L_4c8:
    ldr r0, [r5, #0xc]
    cmp r0, #0x2
    addeq sp, sp, #0x4c
    ldmeqia sp!, {r4, r5, lr}
    bxeq lr
    bl func_02093b08
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, lr}
    bx lr
