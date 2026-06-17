; func_ov002_02292454 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021c84e0
        .extern func_ov002_022536e8
        .extern func_ov002_022575c8
        .global func_ov002_02292454
        .arm
func_ov002_02292454:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, #0x0
.L_c:
    ldrh r1, [r5, #0x2]
    mov r0, r5
    mov r2, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_022575c8
    cmp r0, #0x0
    beq .L_64
    ldrh r0, [r5, #0x2]
    mov r1, r4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c84e0
    ldrh r3, [r5, #0x2]
    mov r2, r0
    ldrh r1, [r5]
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022536e8
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
.L_64:
    add r4, r4, #0x1
    cmp r4, #0x5
    blt .L_c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
