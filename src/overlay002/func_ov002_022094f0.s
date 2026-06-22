; func_ov002_022094f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cf17c
        .extern func_ov002_021c8940
        .extern func_ov002_021ff2b8
        .extern func_ov002_021ff3bc
        .global func_ov002_022094f0
        .arm
func_ov002_022094f0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r5, r1
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x12
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT0
    ldr r0, [r1]
    ldr r1, [r1, #0x1c]
    bl func_ov002_021c8940
    cmp r0, #0x12
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r4
    mov r1, r5
    bl func_ov002_021ff3bc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r2, [r4, #0x2]
    ldr r0, _LIT1
    ldr r1, _LIT2
    mov r2, r2, lsl #0x1f
    mov r3, r2, lsr #0x1f
    and r2, r3, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r4
    rsb r1, r3, #0x1
    bl func_ov002_021ff2b8
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cd3f4
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf17c
