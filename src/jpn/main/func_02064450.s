; func_02064450 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02061e14
        .extern func_020624bc
        .extern func_02064a2c
        .global func_02064450
        .arm
func_02064450:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x18]
    cmp r1, #0x0
    ldmneia sp!, {r4, pc}
    mov r1, #0x1
    str r1, [r4, #0x18]
    bl func_020624bc
    mov r0, r4
    bl func_02061e14
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r0, r4
    bl func_02064a2c
    ldmia sp!, {r4, pc}
