; func_ov002_021df818 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021df818
        .extern func_ov002_021df938
        .extern func_ov002_0226ad5c
        .global func_ov002_021df818
        .arm
func_ov002_021df818:
    stmdb sp!, {r4, lr}
    ldrh r4, [r0, #0x4]
    mov r3, r4, lsl #0x1a
    movs r3, r3, lsr #0x1f
    beq .L_e4
    ldrh lr, [r0, #0x18]
    ldr ip, _LIT0
    cmp lr, ip
    bgt .L_50
    sub r3, ip, #0x4
    cmp lr, r3
    blt .L_40
    beq .L_84
    cmp lr, ip
    beq .L_a0
    b .L_e4
.L_40:
    sub r3, ip, #0x3d
    cmp lr, r3
    beq .L_60
    b .L_e4
.L_50:
    add r3, ip, #0x3e4
    cmp lr, r3
    beq .L_dc
    b .L_e4
.L_60:
    ldrh r3, [r0, #0x1a]
    mov r3, r3, lsl #0x1f
    cmp r1, r3, lsr #0x1f
    bne .L_e4
    bic r3, r4, #0x20
    rsb r1, r1, #0x1
    strh r3, [r0, #0x4]
    bl func_ov002_021df818
    ldmia sp!, {r4, pc}
.L_84:
    ldrh r3, [r0, #0x1a]
    mov r3, r3, lsl #0x1f
    cmp r1, r3, lsr #0x1f
    bne .L_e4
    rsb r1, r1, #0x1
    bl func_ov002_021df818
    ldmia sp!, {r4, pc}
.L_a0:
    ldrh r3, [r0, #0x1a]
    mov r3, r3, lsl #0x1f
    cmp r1, r3, lsr #0x1f
    bne .L_e4
    ldrh r2, [r0, #0x2]
    rsb r0, r1, #0x1
    mov r1, r2, lsl #0x1f
    cmp r0, r1, lsr #0x1f
    movne r3, #0x1
    moveq r3, #0x0
    mov r1, #0x1
    mov r2, #0x0
    bl func_ov002_0226ad5c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_dc:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_e4:
    ldrh ip, [r0, #0x2]
    mov r3, ip, lsl #0x11
    mov ip, ip, lsl #0x1f
    mov r3, r3, lsr #0x1f
    eor r3, r3, ip, lsr #0x1f
    cmp r1, r3
    movne r4, #0x1
    ldrh r3, [r0]
    mov r0, r1
    moveq r4, #0x0
    mov r1, r2
    mov r2, r4
    bl func_ov002_021df938
    ldmia sp!, {r4, pc}
_LIT0: .word 0x000015ab
