; func_02054ad0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02054b1c
        .extern func_020b3870
        .global func_02054ad0
        .arm
func_02054ad0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    subs r4, r1, r5
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
    bl func_02054b1c
    mov r1, r4
    bl func_020b3870
    add r0, r1, r5
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
