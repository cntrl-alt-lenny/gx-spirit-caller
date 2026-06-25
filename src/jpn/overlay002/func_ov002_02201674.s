; func_ov002_02201674 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d008c
        .extern func_ov002_021b99c8
        .extern func_ov002_021bbe70
        .global func_ov002_02201674
        .arm
func_ov002_02201674:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0xcf8]
    cmp r0, #0x1
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldrh r2, [r4, #0x2]
    ldr r0, [r1, #0xcec]
    mov r1, r2, lsl #0x1f
    cmp r0, r1, lsr #0x1f
    mov r0, r1, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r1, r2, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x5
    movhi r0, #0x0
    ldmhiia sp!, {r4, pc}
    ldrh r1, [r4, #0x4]
    mov r1, r1, lsl #0x11
    mov r1, r1, lsr #0x17
    bl func_ov002_021b99c8
    cmp r0, #0x0
    movge r0, #0x0
    ldmgeia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bbe70
    cmp r0, #0x0
    movgt r0, #0x1
    ldmgtia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bbe70
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d008c
