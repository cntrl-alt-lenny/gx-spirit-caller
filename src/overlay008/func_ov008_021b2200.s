; func_ov008_021b2200 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b270c
        .extern func_0202cca4
        .extern func_0202cdf8
        .extern func_0202ce24
        .extern func_0202d9a0
        .global func_ov008_021b2200
        .arm
func_ov008_021b2200:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1]
    ldr r0, [r1, #0x6c]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r1, #0xc]
    bl func_0202cca4
    bl func_0202cdf8
    cmp r0, #0x0
    cmpne r4, #0x0
    beq .L_38
    bl func_0202ce24
.L_38:
    bl func_0202d9a0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov008_021b270c
