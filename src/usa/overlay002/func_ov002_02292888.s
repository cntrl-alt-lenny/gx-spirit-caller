; func_ov002_02292888 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf1a8
        .extern func_ov002_021bbe70
        .extern func_ov002_022579d0
        .extern func_ov002_02280870
        .extern func_ov002_0228c350
        .global func_ov002_02292888
        .arm
func_ov002_02292888:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r3, [r4, #0x2]
    ldr r1, _LIT0
    ldr r2, _LIT1
    mov r3, r3, lsl #0x1f
    mov ip, r3, lsr #0x1f
    and r3, ip, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    mov r1, r1, lsr #0x11
    tst r1, #0x1
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    rsb r1, ip, #0x1
    bl func_ov002_022579d0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0228c350
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bbe70
    cmp r0, #0x0
    bne .L_a0
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bbe70
    cmp r0, #0x2
    movge r0, #0x1
    ldmgeia sp!, {r4, pc}
.L_a0:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02280870
    mvn r1, #0x1
    cmp r0, r1
    movlt r0, #0x1
    movge r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1a8
