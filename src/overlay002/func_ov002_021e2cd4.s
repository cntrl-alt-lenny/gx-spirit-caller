; func_ov002_021e2cd4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d016c
        .extern func_ov002_021c9af0
        .extern func_ov002_021d479c
        .global func_ov002_021e2cd4
        .arm
func_ov002_021e2cd4:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, _LIT0
    mov r5, r0
    ldr r2, [r2, #0xd0]
    mov r4, r1
    mov r2, r2, lsr r5
    and r2, r2, #0x1
    cmp r4, r2
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_ov002_021c9af0
    mov r0, r5, lsl #0x10
    mov r2, r4, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r0, #0x9
    mov r3, #0x0
    bl func_ov002_021d479c
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022d016c
