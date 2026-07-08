; func_ov002_02232a70 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_0202b824
        .extern func_ov002_021c3a80
        .extern func_ov002_021ca310
        .extern func_ov002_021e267c
        .extern func_ov002_021ff2cc
        .extern func_ov002_0220e65c
        .extern func_ov002_02210014
        .extern func_ov002_02214630
        .extern func_ov002_0227acc8
        .global func_ov002_02232a70
        .arm
func_ov002_02232a70:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldrh r0, [r5, #0x2]
    mov r6, r1
    mov r1, r0, lsl #0x12
    mov r1, r1, lsr #0x1e
    cmp r1, #0x2
    bne .L_3e0
    ldrh r1, [r5]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c3a80
    movs r4, r0
    movmi r0, #0x0
    ldmmiia sp!, {r4, r5, r6, pc}
    mov r0, r5
    mov r1, r6
    bl func_ov002_021ff2cc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r5, #0x2]
    ldrh r1, [r5]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca310
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r5, #0x2]
    ldr ip, _LIT0
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mla r1, r3, r1, ip
    ldrh r2, [r5]
    add r1, r1, #0x120
    add r1, r1, r4, lsl #0x2
    mov r3, r2, lsl #0x10
    mov r2, #0x1
    bl func_ov002_0227acc8
    ldrh r2, [r5, #0x2]
    ldr r0, [r5, #0x14]
    ldrh r1, [r5]
    mov r3, r2, lsl #0x1f
    mov r2, r0, lsl #0x10
    mov r0, r3, lsr #0x1f
    mov r3, r2, lsr #0x10
    mov r2, #0x1
    bl func_ov002_021e267c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_3e0:
    ldr r0, [r5, #0x14]
    bl func_0202b824
    cmp r0, #0x16
    bne .L_400
    mov r0, r5
    mov r1, r6
    bl func_ov002_02210014
    ldmia sp!, {r4, r5, r6, pc}
.L_400:
    ldr r0, [r5, #0x14]
    bl func_0202b824
    cmp r0, #0x17
    mov r0, r5
    mov r1, r6
    bne .L_420
    bl func_ov002_0220e65c
    ldmia sp!, {r4, r5, r6, pc}
.L_420:
    bl func_ov002_02214630
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
