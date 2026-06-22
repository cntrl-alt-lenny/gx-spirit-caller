; func_0201bf40 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02018f4c
        .extern func_02018f5c
        .extern func_0201ad50
        .global func_0201bf40
        .arm
func_0201bf40:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    bl func_0201ad50
    bl func_02018f4c
    mov r4, r0
    bl func_02018f5c
    mov r2, r6
    mov r3, r5
    mov r1, r0
    mov r0, r4
    .word 0xeb065c34
    ldmia sp!, {r4, r5, r6, pc}
