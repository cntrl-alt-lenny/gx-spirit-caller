; func_ov002_022576d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_02257464
        .extern func_ov002_02257750
        .global func_ov002_022576d8
        .arm
func_ov002_022576d8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov002_02257464
    cmp r0, #0x0
    ldrne r1, [r0, #0x8]
    cmpne r1, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r0, r4
    bl func_ov002_02257750
    ldmia sp!, {r4, pc}
