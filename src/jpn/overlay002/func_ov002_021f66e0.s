; func_ov002_021f66e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021ff1d8
        .extern func_ov002_0226ae88
        .global func_ov002_021f66e0
        .arm
func_ov002_021f66e0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r1, [r4, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_021ff1d8
    cmp r0, #0x2
    blt .L_90
    ldrh r0, [r4, #0x2]
    mov r1, #0x2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0226ae88
    mov r0, #0x1
    strh r0, [r4, #0xc]
.L_90:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
