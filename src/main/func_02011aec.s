; func_02011aec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020117e4
        .extern func_02011a94
        .extern func_02018f80
        .extern func_02018f90
        .extern func_02019210
        .global func_02011aec
        .arm
func_02011aec:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    bl func_02019210
    mov r6, r0
    bl func_02018f80
    bl func_02011a94
    mov r5, r0
    bl func_02018f80
    mov r4, r0
    bl func_02018f90
    mov r1, r5
    mov r2, r4
    mov r3, r0
    mov r0, r6
    mov ip, #0x0
    str ip, [sp]
    bl func_020117e4
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
