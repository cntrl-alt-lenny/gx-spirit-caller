; func_ov002_02280594 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd444
        .extern data_ov002_022d008c
        .extern func_ov002_021afa84
        .extern func_ov002_021afe6c
        .extern func_ov002_022535a4
        .extern func_ov002_0227ef2c
        .global func_ov002_02280594
        .arm
func_ov002_02280594:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl func_ov002_022535a4
    cmp r0, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r3, _LIT0
    mov r0, r6
    mov r1, r5
    mov r2, r4
    str r6, [r3]
    bl func_ov002_0227ef2c
    movs r4, r0
    mvnmi r0, #0x0
    ldmmiia sp!, {r4, r5, r6, pc}
    bl func_ov002_021afa84
    mov r0, r4
    mov r1, #0x1
    bl func_ov002_021afe6c
    ldr r1, _LIT1
    mov r2, #0x1
    mov r0, r4
    str r2, [r1, #0xd44]
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cd444
_LIT1: .word data_ov002_022d008c
