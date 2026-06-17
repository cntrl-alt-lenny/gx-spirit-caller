; func_ov002_02293a5c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021be384
        .extern func_ov002_02259f74
        .global func_ov002_02293a5c
        .arm
func_ov002_02293a5c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    ldrh r0, [r5, #0x2]
    mov r4, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02259f74
    cmp r0, #0x0
    moveq r0, r4
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r7, r4
    mov r6, #0x1
.L_190:
    ldrh r0, [r5, #0x2]
    mov r1, r7
    mov r2, r6
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021be384
    add r7, r7, #0x1
    cmp r7, #0x4
    add r4, r4, r0
    ble .L_190
    cmp r4, #0x2
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
