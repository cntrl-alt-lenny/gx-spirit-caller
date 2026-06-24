; func_02094ba0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02095744
        .extern func_0209578c
        .global func_02094ba0
        .arm
func_02094ba0:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    mov r0, #0x1
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl func_0209578c
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    str r7, [r0, #0x4]
    str r6, [r0, #0x8]
    str r5, [r0, #0xc]
    ldr r1, [sp, #0x18]
    str r4, [r0, #0x10]
    str r1, [r0, #0x14]
    bl func_02095744
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
