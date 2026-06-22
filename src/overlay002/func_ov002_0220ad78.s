; func_ov002_0220ad78 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern func_ov002_021bb068
        .extern func_ov002_021ca2b8
        .extern func_ov002_022536e8
        .extern func_ov002_02257ab8
        .global func_ov002_0220ad78
        .arm
func_ov002_0220ad78:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    ldrh r1, [r5, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_02257ab8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r1, [r5, #0x2]
    mov r0, r5
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_02257ab8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, _LIT0
    bl func_ov002_021bb068
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca2b8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r0, [r5, #0x2]
    ldr r6, _LIT1
    ldr r1, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mul r3, r2, r6
    ldr r1, [r1, r3]
    mov r4, #0x0
    cmp r1, #0x0
    bls .L_e4
    ldr r7, _LIT3
.L_a8:
    ldrh r1, [r5]
    mov r2, r4
    bl func_ov002_022536e8
    cmp r0, #0x0
    movne r0, #0x2
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r0, [r5, #0x2]
    add r4, r4, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mla r1, r2, r6, r7
    ldr r1, [r1, #0xc]
    cmp r4, r1
    bcc .L_a8
.L_e4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x000013f2
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf178
_LIT3: .word data_ov002_022cf16c
