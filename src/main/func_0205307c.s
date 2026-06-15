; func_0205307c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02044c60
        .extern func_02053688
        .extern func_02053728
        .global func_0205307c
        .arm
func_0205307c:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x18
    mov r4, r0
    add r0, r4, #0x10
    bl func_02053688
    cmp r0, #0x0
    addeq sp, sp, #0x18
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
    add r0, sp, #0x0
    bl func_02044c60
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    addeq sp, sp, #0x18
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    add r0, r4, #0x10
    bl func_02053728
    ldr r2, [sp, #0x4]
    ldr r3, [sp]
    cmp r2, r1
    cmpeq r3, r0
    moveq r0, #0x1
    movne r0, #0x0
    add sp, sp, #0x18
    ldmia sp!, {r4, pc}
