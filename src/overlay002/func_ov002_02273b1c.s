; func_ov002_02273b1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd300
        .extern func_ov002_02271ab4
        .global func_ov002_02273b1c
        .arm
func_ov002_02273b1c:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    ldrh r0, [r1, #0x16]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    beq .L_2094
    ldr r2, [r1]
    mov r0, #0x1
    bic r2, r2, #0xc0
    str r2, [r1]
    ldmia sp!, {r3, pc}
.L_2094:
    bl func_ov002_02271ab4
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022cd300
