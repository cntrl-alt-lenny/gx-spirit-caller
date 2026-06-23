; func_02068cb0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206b5fc
        .extern func_0206b704
        .global func_02068cb0
        .arm
func_02068cb0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x4c
    bl func_0206b704
    mov r1, r0
    mvn r0, #0x0
    cmp r1, r0
    ldmeqia sp!, {r4, pc}
    add r0, r4, #0x4c
    bl func_0206b5fc
    ldmia sp!, {r4, pc}
