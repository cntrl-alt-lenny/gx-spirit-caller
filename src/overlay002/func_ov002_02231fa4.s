; func_ov002_02231fa4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern func_ov002_021df818
        .extern func_ov002_0220e75c
        .extern func_ov002_022577dc
        .global func_ov002_02231fa4
        .arm
func_ov002_02231fa4:
    stmdb sp!, {r4, lr}
    ldr r2, _LIT0
    mov r4, r0
    ldr r2, [r2, #0x5a8]
    cmp r2, #0x7f
    beq .L_4c
    cmp r2, #0x80
    bne .L_54
    bl func_ov002_022577dc
    mov r1, #0x3e8
    ldrh r3, [r4, #0x2]
    mul r2, r0, r1
    mov r0, r3, lsl #0x1f
    mov r1, r0, lsr #0x1f
    mov r0, r4
    rsb r1, r1, #0x1
    bl func_ov002_021df818
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_4c:
    bl func_ov002_0220e75c
    ldmia sp!, {r4, pc}
.L_54:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
