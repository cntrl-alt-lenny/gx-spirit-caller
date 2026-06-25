; func_ov002_022943f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021bd514
        .extern func_ov002_022575f0
        .extern func_ov002_0228c754
        .global func_ov002_022943f4
        .arm
func_ov002_022943f4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov002_022575f0
    ldrh r3, [r4, #0x2]
    mov r1, r0
    ldr r2, _LIT0
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0228c754
    movs r1, r0
    bmi .L_d4
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bd514
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
.L_d4:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word func_ov002_021bd514
