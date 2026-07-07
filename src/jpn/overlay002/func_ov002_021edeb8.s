; func_ov002_021edeb8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern data_ov002_022cf0cc
        .extern func_ov002_021b8eec
        .global func_ov002_021edeb8
        .arm
func_ov002_021edeb8:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r2
    mov r5, r0
    cmp r4, #0xa
    mov r6, r1
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    cmp r4, #0x5
    bge .L_3c
    mov r0, r6
    mov r1, r4
    bl func_ov002_021b8eec
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
.L_3c:
    ldr r0, _LIT0
    and r2, r6, #0x1
    mov r1, #0x14
    mul r0, r2, r0
    ldr r2, _LIT1
    mul r1, r4, r1
    add r3, r2, r0
    add r2, r3, r1
    ldr r2, [r2, #0x30]
    mov r2, r2, lsl #0x13
    movs r2, r2, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r2, _LIT2
    add r2, r2, r0
    ldrh r2, [r1, r2]
    cmp r2, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r2, _LIT3
    add r0, r2, r0
    ldr r0, [r1, r0]
    mov r0, r0, lsr #0x9
    tst r0, #0x1
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    add r0, r3, #0x30
    ldr r1, [r0, r1]
    ldrh r2, [r5, #0x4]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r2, r2, lsl #0x11
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    mov r2, r2, lsr #0x17
    add r0, r0, r1, lsr #0x1f
    cmp r2, r0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
_LIT3: .word data_ov002_022cf0cc
