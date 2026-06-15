; func_02055e28 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02056594
        .extern func_020586c8
        .global func_02055e28
        .arm
func_02055e28:
    stmdb sp!, {r4, lr}
    movs r4, r0
    ldmeqia sp!, {r4, pc}
    ldr r1, [r4]
    cmp r1, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, [r1, #0x108]
    cmp r1, #0x0
    ldmneia sp!, {r4, pc}
    mov r1, #0x1
    bl func_020586c8
    mov r0, r4
    bl func_02056594
    ldmia sp!, {r4, pc}
