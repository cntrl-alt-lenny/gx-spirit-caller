; func_02061f30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02054008
        .extern func_02054454
        .global func_02061f30
        .arm
func_02061f30:
    stmdb sp!, {r0, r1, r2, r3}
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, [sp, #0x8]
    ldr r0, [r1, #0xc]
    cmp r0, #0x7
    addeq sp, sp, #0x4
    ldmeqfd sp!, {lr}
    addeq sp, sp, #0x10
    bxeq lr
    mov r0, #0x7
    str r0, [r1, #0xc]
    ldr r0, [sp, #0x8]
    add r1, sp, #0x8
    ldr r0, [r0, #0x8]
    ldr r0, [r0, #0xc]
    bl func_02054454
    ldr r0, [sp, #0x8]
    add r1, sp, #0x8
    ldr r0, [r0, #0x8]
    ldr r0, [r0, #0x10]
    bl func_02054008
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    add sp, sp, #0x10
    bx lr
