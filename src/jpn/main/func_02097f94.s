; func_02097f94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02097754
        .global func_02097f94
        .arm
func_02097f94:
    stmdb sp!, {r0, r1, r2, r3}
    stmdb sp!, {r4, lr}
    ldr r1, [sp, #0xc]
    mov r4, r0
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, lr}
    addeq sp, sp, #0x10
    bxeq lr
    str r1, [r4, #0x8]
    ldr r3, [sp, #0xc]
    ldr r2, [sp, #0x10]
    mov r1, #0x6
    str r3, [r4, #0x30]
    str r2, [r4, #0x34]
    bl func_02097754
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, lr}
    addeq sp, sp, #0x10
    bxeq lr
    ldr r1, [r4, #0xc]
    mov r0, #0x1
    orr r1, r1, #0x10
    str r1, [r4, #0xc]
    ldr r1, [r4, #0xc]
    bic r1, r1, #0x20
    str r1, [r4, #0xc]
    ldmia sp!, {r4, lr}
    add sp, sp, #0x10
    bx lr
