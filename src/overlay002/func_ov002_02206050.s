; func_ov002_02206050 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf178
        .extern func_ov002_021bb90c
        .global func_ov002_02206050
        .arm
func_ov002_02206050:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bb90c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bb90c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bb90c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r2, [r4, #0x2]
    ldr r0, _LIT3
    ldr r1, _LIT4
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    rsb r2, r2, #0x1
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    cmp r0, #0x0
    movne r0, #0x2
    moveq r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word 0x000015ca
_LIT1: .word 0x000015cb
_LIT2: .word 0x000015cc
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022cf178
