; func_ov002_021f0f7c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern data_ov002_022cf1ac
        .extern func_0202b878
        .extern func_0202b8c0
        .extern func_ov002_021b8fcc
        .global func_ov002_021f0f7c
        .arm
func_ov002_021f0f7c:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r3, _LIT0
    and r4, r1, #0x1
    mov r0, #0x14
    mul r5, r4, r3
    ldr r3, _LIT1
    mul r4, r2, r0
    add r0, r3, r5
    add r0, r0, r4
    ldr r0, [r0, #0x30]
    cmp r2, #0x5
    mov r0, r0, lsl #0x13
    mov r6, r0, lsr #0x13
    bge .L_50
    mov r0, r1
    mov r1, r2
    bl func_ov002_021b8fcc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
.L_50:
    mov r0, r6
    bl func_0202b878
    cmp r0, #0x16
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT2
    add r0, r0, r5
    ldrh r0, [r4, r0]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r6
    bl func_0202b8c0
    cmp r0, #0x4
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT3
    add r0, r0, r5
    ldr r0, [r4, r0]
    mov r0, r0, lsr #0x9
    tst r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
_LIT3: .word data_ov002_022cf1ac
