; func_ov002_02288524 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf180
        .extern func_0202b878
        .extern func_0202b8f0
        .extern func_ov002_02291248
        .global func_ov002_02288524
        .arm
func_ov002_02288524:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r7, r0
    bl func_ov002_02291248
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldrh r1, [r7, #0x2]
    ldr r9, _LIT0
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    and r1, r1, #0x1
    mul r2, r1, r9
    ldr r0, [r0, r2]
    mov r5, #0x0
    cmp r0, #0x0
    bls .L_b4
    ldr r4, _LIT2
    mov r6, r5
    add r8, r9, #0x15c
.L_50:
    add r0, r4, r2
    add r0, r0, r6
    ldr r0, [r0, #0x418]
    mov r0, r0, lsl #0x13
    mov sl, r0, lsr #0x13
    mov r0, sl
    bl func_0202b878
    cmp r0, #0x9
    bne .L_88
    mov r0, sl
    bl func_0202b8f0
    cmp r0, r8
    movge r0, #0x1
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_88:
    ldrh r0, [r7, #0x2]
    add r5, r5, #0x1
    add r6, r6, #0x4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r0, r0, #0x1
    mul r2, r0, r9
    add r0, r4, r2
    ldr r0, [r0, #0x14]
    cmp r5, r0
    bcc .L_50
.L_b4:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf180
_LIT2: .word data_ov002_022cf16c
