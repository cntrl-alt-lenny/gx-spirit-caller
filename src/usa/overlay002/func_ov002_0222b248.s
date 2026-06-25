; func_ov002_0222b248 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b4040
        .extern func_ov002_021de390
        .extern func_ov002_021df728
        .global func_ov002_0222b248
        .arm
func_ov002_0222b248:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    ldrh r2, [r4]
    mov r3, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b4040
    ldrh r1, [r4, #0x2]
    mov r2, #0x0
    mov r5, r0
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    mov r3, r2
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021de390
    cmp r5, #0x0
    blt .L_60
    ldr r2, _LIT0
    mov r0, r4
    mov r1, r5
    bl func_ov002_021df728
.L_60:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000bb8
