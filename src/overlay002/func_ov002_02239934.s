; func_ov002_02239934 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern func_ov002_021df818
        .extern func_ov002_0221d288
        .global func_ov002_02239934
        .arm
func_ov002_02239934:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl func_ov002_0221d288
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5a8]
    cmp r0, #0x7e
    moveq r0, #0x1
    streqh r0, [r5, #0xe]
    cmp r4, #0x0
    ldreqh r0, [r5, #0xe]
    cmpeq r0, #0x0
    bne .L_398
    ldrh r1, [r5, #0x2]
    mov r0, r5
    mov r2, #0x7d0
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_021df818
.L_398:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce288
