; func_ov002_02234650 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern func_ov002_021ff3bc
        .extern func_ov002_02212e8c
        .extern func_ov002_022287c4
        .global func_ov002_02234650
        .arm
func_ov002_02234650:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, _LIT0
    mov r5, r0
    ldr r2, [r2, #0x5a8]
    mov r4, r1
    cmp r2, #0x7f
    beq .L_1d0
    cmp r2, #0x80
    bne .L_1dc
    bl func_ov002_021ff3bc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_022287c4
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, pc}
.L_1d0:
    bl func_ov002_02212e8c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_1dc:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce288
