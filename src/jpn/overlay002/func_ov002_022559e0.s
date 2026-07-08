; func_ov002_022559e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0cc
        .extern func_ov002_021b3538
        .extern func_ov002_021b9af4
        .extern func_ov002_021b9c54
        .extern func_ov002_021b9dec
        .extern func_ov002_021d59c4
        .extern func_ov002_021d9054
        .extern func_ov002_021de390
        .extern func_ov002_021df53c
        .global func_ov002_022559e0
        .arm
func_ov002_022559e0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    mov r7, r1
    mov r6, r2
    bl func_ov002_021b3538
    ldr r1, _LIT0
    mov r4, r0
    cmp r4, r1
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, r8
    mov r1, r7
    bl func_ov002_021b9c54
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, r4, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r3, r0, asr #0x8
    mov r0, r8
    mov r1, r7
    mov r2, #0x1
    and r4, r4, #0xff
    and r5, r3, #0xff
    bl func_ov002_021d9054
    mov r0, r8
    mov r1, r7
    bl func_ov002_021b9af4
    add r0, r0, #0x1
    cmp r0, #0x3
    ldmltia sp!, {r4, r5, r6, r7, r8, pc}
    and r1, r8, #0xff
    and r0, r7, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r2, r0, lsl #0x10
    mov r0, r4
    mov r1, r5
    mov r2, r2, lsr #0x10
    mov r3, #0x1
    bl func_ov002_021d59c4
    cmp r6, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r1, _LIT1
    and r2, r8, #0x1
    mul r3, r2, r1
    mov r0, #0x14
    mul r1, r7, r0
    ldr r2, _LIT2
    add r0, r2, r3
    ldr r0, [r1, r0]
    mov r0, r0, lsr #0x6
    tst r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r2, _LIT3
    mov r0, r8
    add r2, r2, r3
    add r2, r2, #0x30
    ldr r3, [r2, r1]
    mov r1, r7
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021df53c
    cmp r4, r8
    movne r6, #0x1
    moveq r6, #0x0
    mov r0, r8
    mov r1, r7
    bl func_ov002_021b9dec
    mov r3, r0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    bl func_ov002_021de390
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x0000ffff
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf0cc
_LIT3: .word data_ov002_022cf08c
