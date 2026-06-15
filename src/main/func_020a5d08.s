; func_020a5d08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a9924
        .extern func_020945f4
        .global func_020a5d08
        .arm
func_020a5d08:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    ldr r1, [r1]
    cmp r1, #0x0
    ldmeqia sp!, {r4, lr}
    bxeq lr
    sub r4, r0, #0x1
    add r0, r1, r4, lsl #0x5
    mov r1, #0x0
    mov r2, #0x1e
    bl func_020945f4
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    add r0, r0, r4, lsl #0x2
    str r1, [r0, #0x1e0]
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_021a9924
