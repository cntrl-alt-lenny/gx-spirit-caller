; func_0205d688 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020544c8
        .extern func_0205d6bc
        .global func_0205d688
        .arm
func_0205d688:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    add r2, sp, #0x0
    ldr r4, [r0]
    bl func_0205d6bc
    cmp r0, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x428]
    ldr r1, [sp]
    bl func_020544c8
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
