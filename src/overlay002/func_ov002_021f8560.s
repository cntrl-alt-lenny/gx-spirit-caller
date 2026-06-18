; func_ov002_021f8560 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern func_ov002_021e276c
        .extern func_ov002_021f4a4c
        .extern func_ov002_021fab74
        .global func_ov002_021f8560
        .arm
func_ov002_021f8560:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, _LIT0
    mov r4, r0
    ldr r0, [r2, #0x5b4]
    mov r5, r1
    cmp r0, #0x0
    bne .L_4c
    ldrh r2, [r4, #0x2]
    ldrh r0, [r4, #0x4]
    ldr r1, _LIT1
    mov r3, r2, lsl #0x1f
    mov r2, r0, lsl #0x11
    mov r0, r3, lsr #0x1f
    mov r3, r2, lsr #0x17
    mov r2, #0x1
    bl func_ov002_021e276c
    mov r0, r4
    mov r1, r5
    bl func_ov002_021f4a4c
.L_4c:
    mov r0, r4
    mov r1, r5
    bl func_ov002_021fab74
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x000016b8
