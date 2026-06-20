; func_ov002_02266ad8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a2
        .extern data_ov002_022d016c
        .extern func_ov002_021baca8
        .extern func_ov002_021bbf50
        .extern func_ov002_021d6870
        .extern func_ov002_021df62c
        .extern func_ov002_021e2d94
        .global func_ov002_02266ad8
        .arm
func_ov002_02266ad8:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    ldr r5, _LIT0
    mov r7, r0
    ldr r4, [r5, #0xd28]
    cmp r4, #0x4
    bhi .L_104
    ldr r6, _LIT1
.L_20:
    mov r0, r7
    mov r1, r4
    mov r2, r6
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_f0
    mov r0, r7
    bl func_ov002_021bbf50
    cmp r0, #0x1
    bne .L_f0
    ldr r0, _LIT2
    and r1, r7, #0x1
    mul r6, r1, r0
    mov r0, #0x14
    ldr r1, _LIT3
    mul r5, r4, r0
    add r0, r1, r6
    add r0, r0, #0x30
    ldr r2, [r0, r5]
    mov r0, r7
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r3, r2, lsl #0x12
    mov r2, r1, lsl #0x1
    mov r1, r4
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021df62c
    ldr r0, _LIT4
    add r0, r0, r6
    ldrh r0, [r5, r0]
    cmp r0, #0x0
    bne .L_c0
    ldr r0, _LIT1
    mov r2, #0x0
    str r0, [sp]
    mov r0, r7
    mov r1, r4
    mov r3, r2
    str r2, [sp, #0x4]
    bl func_ov002_021d6870
.L_c0:
    mov r0, r7
    mov r1, r4
    mov r2, #0x15
    mov r3, #0x1
    bl func_ov002_021e2d94
    ldr r1, _LIT0
    add sp, sp, #0x8
    ldr r2, [r1, #0xd28]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd28]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_f0:
    ldr r0, [r5, #0xd28]
    add r4, r0, #0x1
    str r4, [r5, #0xd28]
    cmp r4, #0x4
    bls .L_20
.L_104:
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word 0x00001338
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf16c
_LIT4: .word data_ov002_022cf1a2
