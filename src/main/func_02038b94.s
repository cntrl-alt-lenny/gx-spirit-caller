; func_02038b94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02038ad4
        .extern func_02097ff0
        .extern func_02098088
        .extern func_02098388
        .extern func_020988a8
        .extern FS_LoadOverlayInfo
        .extern func_02098c70
        .extern func_02098c98
        .global func_02038b94
        .arm
func_02038b94:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x7c
    add r5, sp, #0x8
    mov r2, r0
    mov r0, r5
    mov r1, #0x0
    bl FS_LoadOverlayInfo
    cmp r0, #0x0
    addeq sp, sp, #0x7c
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, pc}
    add r0, sp, #0x34
    bl func_02098388
    add r0, sp, #0x0
    mov r1, r5
    bl func_02098c70
    add r1, sp, #0x0
    add r0, sp, #0x34
    ldmia r1, {r1, r2}
    bl func_02098088
    cmp r0, #0x0
    addeq sp, sp, #0x7c
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, pc}
    ldr r0, [r5, #0x1c]
    mov r1, r0, lsr #0x18
    tst r1, #0x1
    movne r0, r0, lsl #0x8
    movne r6, r0, lsr #0x8
    ldreq r6, [r5, #0x8]
    mov r0, r5
    bl func_02098c98
    ldr r1, [r5, #0x4]
    add r0, sp, #0x34
    mov r2, r6
    bl func_02038ad4
    mov r4, r0
    add r0, sp, #0x34
    bl func_02097ff0
    cmp r4, r6
    addne sp, sp, #0x7c
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, pc}
    mov r0, r5
    bl func_020988a8
    mov r0, #0x1
    add sp, sp, #0x7c
    ldmia sp!, {r3, r4, r5, r6, pc}
