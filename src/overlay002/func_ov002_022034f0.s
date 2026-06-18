; func_ov002_022034f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021bb90c
        .global func_ov002_022034f0
        .arm
func_ov002_022034f0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x23
    beq .L_17c
    mov r0, r0, lsl #0x1f
    ldr r1, _LIT0
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bb90c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bb90c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
.L_17c:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00001532
_LIT1: .word 0x00001686
