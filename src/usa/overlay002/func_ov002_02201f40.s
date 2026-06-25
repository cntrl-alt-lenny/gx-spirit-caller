; func_ov002_02201f40 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf09c
        .extern data_ov002_022d008c
        .extern func_ov002_021c9d10
        .extern func_ov002_021ca1d8
        .extern func_ov002_021ff1c8
        .global func_ov002_02201f40
        .arm
func_ov002_02201f40:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r1, [r4, #0x2]
    ldr r2, _LIT0
    mov ip, r1, lsl #0x1f
    ldr r3, [r2, #0xcec]
    mov r1, ip, lsr #0x1f
    cmp r3, ip, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r2, [r2, #0xcf8]
    cmp r2, #0x3
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    bl func_ov002_021ff1c8
    cmp r0, #0x2
    movlt r0, #0x0
    ldmltia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, #0x2
    movcc r0, #0x0
    ldmccia sp!, {r4, pc}
    bl func_ov002_021ca1d8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c9d10
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf09c
