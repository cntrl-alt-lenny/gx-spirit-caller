; func_02018d58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_02011a7c
        .extern func_02011aec
        .global func_02018d58
        .arm
func_02018d58:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GetSystemWork
    mov r0, r4
    mov r1, #0x0
    bl func_02011aec
    bl func_02011a7c
    mov r0, r0, lsl #0x2
    add r1, r0, #0x14
    ldr r2, _LIT0
    mov r0, r1, lsr #0x1f
    smull r1, r3, r2, r1
    add r3, r0, r3, asr #0x4
    add r0, r3, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word 0x66666667
