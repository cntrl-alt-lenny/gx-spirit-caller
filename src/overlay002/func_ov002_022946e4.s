; func_ov002_022946e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf17c
        .extern func_ov002_02291160
        .global func_ov002_022946e4
        .arm
func_ov002_022946e4:
    stmdb sp!, {r3, lr}
    ldrh r2, [r0, #0x2]
    mov r3, r2, lsl #0x12
    movs r3, r3, lsr #0x1e
    bne .L_1c
    bl func_ov002_02291160
    ldmia sp!, {r3, pc}
.L_1c:
    mov r0, r2, lsl #0x1f
    mov r1, r0, lsr #0x1f
    ldr r0, _LIT0
    and r1, r1, #0x1
    mul r2, r1, r0
    ldr r0, _LIT1
    ldr r0, [r0, r2]
    cmp r0, #0x14
    movcc r0, #0x1
    movcs r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf17c
