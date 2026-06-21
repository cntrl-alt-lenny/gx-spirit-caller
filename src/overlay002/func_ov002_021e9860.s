; func_ov002_021e9860 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021c1a2c
        .extern func_ov002_021c1e44
        .global func_ov002_021e9860
        .arm
func_ov002_021e9860:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r2
    mov r6, r0
    cmp r4, #0x5
    mov r5, r1
    movge r0, #0x0
    ldmgeia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT0
    ldr r1, _LIT1
    and r2, r5, #0x1
    mla r1, r2, r0, r1
    mov r0, #0x14
    mla r0, r4, r0, r1
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r2, [r6]
    mov r0, r5
    mov r1, r4
    bl func_ov002_021c1a2c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_ov002_021c1e44
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
