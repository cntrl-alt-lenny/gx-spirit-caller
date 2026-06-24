; func_0200ee8c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern Fill32
        .extern func_0200ed2c
        .extern func_0200ed9c
        .global func_0200ee8c
        .arm
func_0200ee8c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl func_0200ed2c
    movs r4, r0
    mov r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    cmp r5, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r1, r4
    mov r2, #0x284
    bl Fill32
    mov r0, r5
    mov r1, r4
    mov r2, #0x34
    bl Copy32
    mov r0, r4
    bl func_0200ed9c
    ldmia sp!, {r3, r4, r5, pc}
