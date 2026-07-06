; func_ov002_02214c84 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b939c
        .extern func_ov002_021bc538
        .extern func_ov002_021c3304
        .extern func_ov002_021c9310
        .extern func_ov002_021ca1d8
        .extern func_ov002_0227ab74
        .global func_ov002_02214c84
        .arm
func_ov002_02214c84:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r0
    ldrh r0, [r4, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc538
    cmp r0, #0x0
    beq .L_dc
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca1d8
    cmp r0, #0x0
    beq .L_dc
    ldr r0, [r4, #0x14]
    mov r0, r0, lsl #0x17
    mov r0, r0, lsr #0x17
    bl func_ov002_021b939c
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r2, r1, asr #0x8
    mov r1, r0, lsr #0x10
    and r6, r2, #0xff
    mov r1, r1, lsl #0x10
    cmp r6, #0xe
    and r5, r0, #0xff
    mov r7, r1, lsr #0x10
    bne .L_dc
    ldrh r0, [r4, #0x2]
    mov r1, r5
    mov r2, r7
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c3304
    cmp r0, #0x0
    beq .L_dc
    mov r0, r5
    mov r1, r6
    mov r2, r7
    bl func_ov002_021c9310
    mov r1, #0x0
    str r1, [sp]
    ldr r2, [r4, #0x14]
    mov r1, r0
    mov r0, r2, lsl #0x16
    mov r2, r2, lsl #0x11
    mov r0, r0, lsr #0x1f
    mov r3, r2, lsr #0x1f
    mov r2, #0x1
    bl func_ov002_0227ab74
.L_dc:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
