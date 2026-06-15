; func_0201bf80 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02018f80
        .extern func_02018f90
        .extern func_0201ad90
        .global func_0201bf80
        .arm
func_0201bf80:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    bl func_0201ad90
    bl func_02018f80
    mov r4, r0
    bl func_02018f90
    mov r2, r6
    mov r3, r5
    mov r1, r0
    mov r0, r4
    .word 0xeb065c5f
    ldmia sp!, {r4, r5, r6, pc}
