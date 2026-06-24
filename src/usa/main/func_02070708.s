; func_02070708 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02070764
        .global func_02070708
        .arm
func_02070708:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r2
    mov r4, r3
    ldr r2, [sp, #0x10]
    ldr r3, [sp, #0x14]
    bl func_02070764
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, lr}
    bxeq lr
    cmp r4, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, lr}
    bxeq lr
    ldr r2, [sp, #0x10]
    mov r0, r5
    mov r1, r4
    mov r3, #0x0
    bl func_02070764
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
