; func_ov002_022a6860 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_0229d2ec
        .extern func_ov002_022a6324
        .extern func_ov002_022a6500
        .global func_ov002_022a6860
        .arm
func_ov002_022a6860:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r2
    ldrh ip, [r5]
    mov r6, r1
    mov r4, r3
    mov r1, ip, lsl #0x1f
    mov r2, ip, lsl #0x1a
    mov r3, ip, lsl #0x12
    mov r1, r1, lsr #0x1f
    mov r2, r2, lsr #0x1b
    mov r3, r3, lsr #0x18
    mov r7, r0
    bl func_ov002_022a6324
    cmp r0, #0x0
    ldrnesb r0, [r0]
    cmpne r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r7
    mov r1, r6
    mov r2, r5
    mov r3, r4
    bl func_ov002_022a6500
    ldrh r1, [r4]
    mov r0, r7
    mov r2, r1, lsl #0x1a
    mov r3, r1, lsl #0x12
    mov r4, r1, lsl #0x1f
    mov r1, r4, lsr #0x1f
    mov r2, r2, lsr #0x1b
    mov r3, r3, lsr #0x18
    bl func_ov002_022a6324
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    bl func_ov002_0229d2ec
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
