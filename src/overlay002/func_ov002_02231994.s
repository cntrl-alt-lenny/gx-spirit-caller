; func_ov002_02231994 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern func_ov002_021e13f4
        .extern func_ov002_0220e518
        .global func_ov002_02231994
        .arm
func_ov002_02231994:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    ldr r1, [r1, #0x5a8]
    cmp r1, #0x7f
    beq .L_170c
    cmp r1, #0x80
    bne .L_1730
    bl func_ov002_0220e518
    cmp r0, #0x0
    movne r0, #0x7f
    moveq r0, #0x0
    ldmia sp!, {r3, pc}
.L_170c:
    ldrh r0, [r0, #0x2]
    mov r1, #0x2
    mov r2, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e13f4
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_1730:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce288
