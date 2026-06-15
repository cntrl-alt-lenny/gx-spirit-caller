; func_ov004_021d7854 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02105a68
        .extern func_0202b9b0
        .global func_ov004_021d7854
        .arm
func_ov004_021d7854:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r4, _LIT0
    mov r5, #0x0
    ldr r0, [r4]
    cmp r0, #0x0
    bls .L_1160
.L_1138:
    add r0, r4, r5, lsl #0x1
    ldrh r0, [r0, #0xc]
    bl func_0202b9b0
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4]
    add r5, r5, #0x1
    cmp r5, r0
    bcc .L_1138
.L_1160:
    ldr r0, [r4, #0x8]
    mov r5, #0x0
    cmp r0, #0x0
    bls .L_1198
.L_1170:
    add r0, r4, r5, lsl #0x1
    ldrh r0, [r0, #0xca]
    bl func_0202b9b0
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x8]
    add r5, r5, #0x1
    cmp r5, r0
    bcc .L_1170
.L_1198:
    ldr r0, [r4, #0x4]
    mov r5, #0x0
    cmp r0, #0x0
    bls .L_11d0
.L_11a8:
    add r0, r4, r5, lsl #0x1
    ldrh r0, [r0, #0xac]
    bl func_0202b9b0
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x4]
    add r5, r5, #0x1
    cmp r5, r0
    bcc .L_11a8
.L_11d0:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_02105a68
