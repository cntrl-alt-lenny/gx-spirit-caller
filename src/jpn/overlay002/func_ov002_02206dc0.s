; func_ov002_02206dc0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d008c
        .extern func_ov002_021bb82c
        .global func_ov002_02206dc0
        .arm
func_ov002_02206dc0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r1, [r4]
    ldr r0, _LIT0
    cmp r1, r0
    bne .L_44
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT1
    ldr r2, [r0, #0xcec]
    mov r1, r1, lsl #0x1f
    cmp r2, r1, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, [r0, #0xcf8]
    cmp r0, #0x3
    movhi r0, #0x0
    ldmhiia sp!, {r4, pc}
.L_44:
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bb82c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT3
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bb82c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bb82c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bb82c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT6
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bb82c
    cmp r0, #0x0
    movne r0, #0x2
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x000016a3
_LIT1: .word data_ov002_022d008c
_LIT2: .word 0x00001532
_LIT3: .word 0x0000161e
_LIT4: .word 0x00001656
_LIT5: .word 0x00001685
_LIT6: .word 0x00001686
