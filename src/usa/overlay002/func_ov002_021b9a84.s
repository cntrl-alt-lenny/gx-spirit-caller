; func_ov002_021b9a84 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b939c
        .extern func_ov002_021c9310
        .global func_ov002_021b9a84
        .arm
func_ov002_021b9a84:
    stmdb sp!, {r3, lr}
    bl func_ov002_021b939c
    cmp r0, #0x1000
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    mov r1, r0, lsl #0x10
    mov r2, r1, lsr #0x10
    mov r1, r0, lsr #0x10
    mov r3, r2, asr #0x8
    mov r2, r1, lsl #0x10
    and r0, r0, #0xff
    and r1, r3, #0xff
    mov r2, r2, lsr #0x10
    bl func_ov002_021c9310
    ldmia sp!, {r3, pc}
