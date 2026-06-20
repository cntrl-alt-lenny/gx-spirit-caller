; func_ov002_022674d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_ov002_021b4054
        .extern func_ov002_021b9ecc
        .extern func_ov002_021baca8
        .extern func_ov002_021d59cc
        .extern func_ov002_021df62c
        .global func_ov002_022674d0
        .arm
func_ov002_022674d0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    ldr r6, _LIT0
    mov r5, r0
    ldr r4, [r6, #0xd28]
    cmp r4, #0x4
    bhi .L_28c
    ldr r8, _LIT1
    mov r7, #0x2
.L_1bc:
    mov r0, r5
    mov r1, r4
    mov r2, r8
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_278
    mov r0, r5
    mov r1, r4
    mov r2, r8
    mov r3, r7
    bl func_ov002_021b4054
    cmp r0, #0x0
    beq .L_278
    ldr r2, _LIT2
    ldr r0, _LIT3
    and r1, r5, #0x1
    mla r2, r1, r0, r2
    mov r0, #0x14
    mul r0, r4, r0
    add r1, r2, #0x30
    ldr r2, [r1, r0]
    mov r0, r5
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r3, r2, lsl #0x12
    mov r2, r1, lsl #0x1
    mov r1, r4
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021df62c
    mov r0, r5
    mov r1, r4
    bl func_ov002_021b9ecc
    mov r2, r0, lsl #0x10
    mov r6, #0x1
    mov r0, r5
    mov r1, r4
    mov r2, r2, lsr #0x10
    mov r3, #0x3
    str r6, [sp]
    bl func_ov002_021d59cc
    ldr r1, _LIT0
    add sp, sp, #0x4
    ldr r2, [r1, #0xd28]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd28]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_278:
    ldr r0, [r6, #0xd28]
    add r4, r0, #0x1
    str r4, [r6, #0xd28]
    cmp r4, #0x4
    bls .L_1bc
.L_28c:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word 0x000013b2
_LIT2: .word data_ov002_022cf16c
_LIT3: .word 0x00000868
