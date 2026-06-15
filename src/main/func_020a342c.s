; func_020a342c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02097f10
        .extern func_02097ff0
        .extern func_02098038
        .extern func_02098388
        .global func_020a342c
        .arm
func_020a342c:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x48
    cmp r2, #0x0
    movne r4, #0x200
    moveq r4, #0x20
    mov r6, r0
    mov r5, r1
    cmp r2, #0x0
    addne r5, r5, #0x20
    cmp r6, #0x0
    addeq sp, sp, #0x48
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    add r0, sp, #0x0
    bl func_02098388
    add r0, sp, #0x0
    mov r1, r6
    bl func_02098038
    cmp r0, #0x0
    addeq sp, sp, #0x48
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    ldr r1, [sp, #0x28]
    ldr r0, [sp, #0x24]
    sub r0, r1, r0
    cmp r4, r0
    beq .L_110
    add r0, sp, #0x0
    bl func_02097ff0
    add sp, sp, #0x48
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_110:
    add r0, sp, #0x0
    mov r1, r5
    mov r2, r4
    bl func_02097f10
    add r0, sp, #0x0
    bl func_02097ff0
    mov r0, #0x1
    add sp, sp, #0x48
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
