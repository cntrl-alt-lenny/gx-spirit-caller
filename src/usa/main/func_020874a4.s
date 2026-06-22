; func_020874a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02094f3c
        .global func_020874a4
        .arm
func_020874a4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4]
    mov r2, #0x1
    mov r1, #0x0
    mov r0, r2, lsl r0
    mov r2, r1
    mov r3, r1
    bl func_02094f3c
    mov r0, #0x0
    str r0, [r4, #0x8]
    ldmia sp!, {r4, pc}
