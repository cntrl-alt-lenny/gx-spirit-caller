; func_ov002_021ed138 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern func_ov002_021c1e44
        .extern func_ov002_021c84e0
        .global func_ov002_021ed138
        .arm
func_ov002_021ed138:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r1
    ldr r4, _LIT0
    and r8, r7, #0x1
    mov r6, r2
    mul r5, r8, r4
    mov r3, #0x14
    mul r4, r6, r3
    ldr r8, _LIT1
    cmp r6, #0x5
    add r3, r8, r5
    add r3, r3, r4
    ldr r3, [r3, #0x30]
    mov r8, r0
    mov r3, r3, lsl #0x13
    mov r3, r3, lsr #0x13
    movge r0, #0x0
    ldmgeia sp!, {r4, r5, r6, r7, r8, pc}
    cmp r3, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    bl func_ov002_021c1e44
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    cmp r7, r0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, _LIT2
    add r0, r0, r5
    ldrh r0, [r4, r0]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, r7
    mov r1, r6
    bl func_ov002_021c84e0
    cmp r0, #0x4
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
