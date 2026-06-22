; func_ov002_02209728 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202b878
        .extern func_0202b8c0
        .extern func_ov002_021ff170
        .extern func_ov002_021ff2c8
        .extern func_ov002_021ff354
        .global func_ov002_02209728
        .arm
func_ov002_02209728:
    stmdb sp!, {r3, r4, r5, lr}
    movs r4, r1
    mov r5, r0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r1, [r4, #0x2]
    mov r0, r1, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0xa
    movhi r0, #0x0
    ldmhiia sp!, {r3, r4, r5, pc}
    mov r0, r1, lsl #0x12
    movs r0, r0, lsr #0x1e
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldrh r0, [r5, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r0, r0, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4]
    bl func_0202b878
    cmp r0, #0x16
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4]
    bl func_0202b8c0
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldrh r1, [r5, #0x2]
    mov r0, r5
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_021ff2c8
    mov r3, #0x0
    str r3, [sp]
    ldrh r2, [r5, #0x4]
    ldrh ip, [r5, #0x2]
    mov r1, r0
    mov r2, r2, lsl #0x11
    mov r0, ip, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r2, r2, lsr #0x17
    bl func_ov002_021ff170
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021ff354
    cmp r0, #0x0
    movne r0, #0x2
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
