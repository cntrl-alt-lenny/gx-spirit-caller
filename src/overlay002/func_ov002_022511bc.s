; func_ov002_022511bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf17c
        .extern func_0202b950
        .extern func_0202e234
        .extern func_ov002_021b3fd8
        .extern func_ov002_021ca440
        .extern func_ov002_02253458
        .global func_ov002_022511bc
        .arm
func_ov002_022511bc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldr r0, _LIT0
    and r3, sl, #0x1
    mul r1, r3, r0
    ldr r0, _LIT1
    mov r9, r2
    ldr r0, [r0, r1]
    mov r5, #0x0
    cmp r0, #0x0
    ldmlsia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT2
    ldr fp, _LIT3
    add r8, r0, r1
    add r7, r8, #0x260
    mov r4, #0xb
.L_40:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    mov r6, r0, lsr #0x13
    mov r0, r6
    bl func_0202e234
    cmp r0, #0x0
    beq .L_c0
    mov r0, r6
    bl func_0202b950
    cmp r0, r9
    bhi .L_c0
    mov r0, sl
    mov r1, r6
    bl func_ov002_021ca440
    cmp r0, #0x0
    beq .L_c0
    ldr r2, [r7]
    mov r0, sl
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r6, r2, lsl #0x12
    mov r3, r1, lsl #0x1
    mov r1, r4
    mov r2, fp
    add r3, r3, r6, lsr #0x1f
    bl func_ov002_021b3fd8
    cmp r0, #0x0
    bne .L_c0
    mov r0, sl
    mov r1, #0xd
    mov r2, r5
    bl func_ov002_02253458
.L_c0:
    ldr r0, [r8, #0x10]
    add r5, r5, #0x1
    cmp r5, r0
    add r7, r7, #0x4
    bcc .L_40
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf17c
_LIT2: .word data_ov002_022cf16c
_LIT3: .word 0x000012a1
