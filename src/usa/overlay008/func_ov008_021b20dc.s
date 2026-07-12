; func_ov008_021b20dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b25ec
        .extern func_0202cc50
        .extern func_0202cda4
        .extern func_0202cdd0
        .extern func_0202d94c
        .global func_ov008_021b20dc
        .arm
func_ov008_021b20dc:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1]
    ldr r0, [r1, #0x6c]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r1, #0xc]
    bl func_0202cc50
    bl func_0202cda4
    cmp r0, #0x0
    cmpne r4, #0x0
    beq .L_38
    bl func_0202cdd0
.L_38:
    bl func_0202d94c
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov008_021b25ec
