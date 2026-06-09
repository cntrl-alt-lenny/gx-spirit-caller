; func_ov002_02259aec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021d5c50
        .extern func_ov002_021e30b4
        .global func_ov002_02259aec
        .arm
func_ov002_02259aec:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r0, r5, lsl #0x1f
    and r0, r0, #-2147483648
    mov r4, r2
    orr r2, r0, #0x4e0000
    mov r0, r1, lsl #0x10
    orr r2, r2, #0x46000000
    mov r1, r4, lsl #0x10
    orr r0, r2, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x0
    bl func_ov002_021e30b4
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r2, _LIT0
    mov r0, r5
    mov r3, r4
    mov r1, #0xb
    bl func_ov002_021d5c50
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00001a04
