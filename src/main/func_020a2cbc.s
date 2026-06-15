; func_020a2cbc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02092904
        .extern func_02092928
        .extern func_020a36dc
        .global func_020a2cbc
        .arm
func_020a2cbc:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r4, r2
    add r2, r6, #0x1f
    mov r5, r1
    mov r0, r4
    bic r1, r2, #0x1f
    bl func_02092904
    bl func_02092928
    mov r0, r4
    mov r1, r6
    mov r2, r5
    bl func_020a36dc
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
