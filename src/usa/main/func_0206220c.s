; func_0206220c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020552bc
        .extern func_0206456c
        .global func_0206220c
        .arm
func_0206220c:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    str r2, [sp]
    mov r3, r1
    ldrh r2, [r4, #0x4]
    ldr r0, [r4, #0x8]
    ldr r1, [r4]
    bl func_0206456c
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_020552bc
    str r0, [r4, #0x88]
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
