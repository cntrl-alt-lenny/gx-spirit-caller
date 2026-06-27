; func_ov002_021f02e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern func_ov002_021b8fc8
        .extern func_ov002_021c8400
        .global func_ov002_021f02e4
        .arm
func_ov002_021f02e4:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r2
    cmp r4, #0x5
    mov r5, r1
    movge r0, #0x0
    ldmgeia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT0
    and r2, r5, #0x1
    mul r3, r2, r1
    mov r0, #0x14
    mul r2, r4, r0
    ldr r1, _LIT1
    add r0, r1, r3
    add r0, r0, r2
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT2
    add r0, r0, r3
    ldrh r0, [r2, r0]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021b8fc8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021c8400
    cmp r0, #0x2
    movle r0, #0x1
    movgt r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
