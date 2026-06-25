; func_ov002_02264470 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b3dec
        .extern func_ov002_021d5a90
        .extern func_ov002_021e2fc4
        .global func_ov002_02264470
        .arm
func_ov002_02264470:
    stmdb sp!, {r4, lr}
    mov r1, #0xb
    rsb r2, r1, #0x1400
    mov r4, r0
    bl func_ov002_021b3dec
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
    mov r2, r4, lsl #0x1f
    ldr r0, _LIT0
    and r3, r2, #-2147483648
    mov r1, #0x0
    mov r2, r1
    orr r0, r3, r0
    bl func_ov002_021e2fc4
    mov r1, #0xb
    mov r0, r4
    rsb r2, r1, #0x1400
    mov r3, #0x0
    bl func_ov002_021d5a90
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x0a5013f5
