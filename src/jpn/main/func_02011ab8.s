; func_02011ab8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020117b0
        .extern func_02011a60
        .extern func_02018f4c
        .extern func_02018f5c
        .extern func_020191dc
        .global func_02011ab8
        .arm
func_02011ab8:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    bl func_020191dc
    mov r6, r0
    bl func_02018f4c
    bl func_02011a60
    mov r5, r0
    bl func_02018f4c
    mov r4, r0
    bl func_02018f5c
    mov r1, r5
    mov r2, r4
    mov r3, r0
    mov r0, r6
    mov ip, #0x0
    str ip, [sp]
    bl func_020117b0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
