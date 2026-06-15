; func_02097e18 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02097e5c
        .extern func_02098228
        .global func_02097e18
        .arm
func_02097e18:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    add r3, sp, #0x0
    mov r2, #0x0
    mov r4, r0
    bl func_02098228
    cmp r0, #0x0
    addeq sp, sp, #0x10
    moveq r0, #0x0
    ldmeqia sp!, {r4, lr}
    bxeq lr
    add r1, sp, #0x0
    mov r0, r4
    bl func_02097e5c
    add sp, sp, #0x10
    ldmia sp!, {r4, lr}
    bx lr
