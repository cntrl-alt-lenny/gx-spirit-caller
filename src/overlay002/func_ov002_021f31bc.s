; func_ov002_021f31bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021c2084
        .global func_ov002_021f31bc
        .arm
func_ov002_021f31bc:
    stmdb sp!, {r3, lr}
    ldrh r3, [r0, #0x2]
    mov r3, r3, lsl #0x1f
    cmp r1, r3, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    cmp r2, #0x5
    movlt r0, #0x0
    ldmltia sp!, {r3, pc}
    cmp r2, #0xa
    movge r0, #0x0
    ldmgeia sp!, {r3, pc}
    ldr r3, _LIT0
    ldr ip, _LIT1
    and lr, r1, #0x1
    mla ip, lr, r3, ip
    mov r3, #0x14
    mla r3, r2, r3, ip
    ldr r3, [r3, #0x30]
    mov r3, r3, lsl #0x13
    movs r3, r3, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    mov r3, #0x0
    bl func_ov002_021c2084
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
