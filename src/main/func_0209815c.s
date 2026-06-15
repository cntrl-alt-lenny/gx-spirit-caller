; func_0209815c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02098228
        .extern func_02098388
        .global func_0209815c
        .arm
func_0209815c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4c
    mov r5, r0
    add r0, sp, #0x0
    mov r4, r1
    bl func_02098388
    add r0, sp, #0x0
    mov r1, r4
    mov r2, r5
    mov r3, #0x0
    bl func_02098228
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, lr}
    bx lr
