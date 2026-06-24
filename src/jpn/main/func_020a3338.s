; func_020a3338 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02097e1c
        .extern func_02097efc
        .extern func_02097f44
        .extern func_02098294
        .global func_020a3338
        .arm
func_020a3338:
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
    bl func_02098294
    add r0, sp, #0x0
    mov r1, r6
    bl func_02097f44
    cmp r0, #0x0
    addeq sp, sp, #0x48
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    ldr r1, [sp, #0x28]
    ldr r0, [sp, #0x24]
    sub r0, r1, r0
    cmp r4, r0
    beq .L_8c
    add r0, sp, #0x0
    bl func_02097efc
    add sp, sp, #0x48
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_8c:
    add r0, sp, #0x0
    mov r1, r5
    mov r2, r4
    bl func_02097e1c
    add r0, sp, #0x0
    bl func_02097efc
    mov r0, #0x1
    add sp, sp, #0x48
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
