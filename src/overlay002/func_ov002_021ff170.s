; func_ov002_021ff170 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern func_0202b878
        .extern func_0202e234
        .extern func_ov002_021b3fd8
        .extern func_ov002_021ca5bc
        .global func_ov002_021ff170
        .arm
func_ov002_021ff170:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    ldr r4, _LIT0
    str r0, [sp]
    and r0, r0, #0x1
    mul r5, r0, r4
    ldr r0, _LIT1
    mov sl, r1
    ldr r0, [r0, r5]
    mov fp, r2
    str r3, [sp, #0x4]
    cmp r0, #0x0
    ldr r9, [sp, #0x30]
    mov r4, #0x0
    bls .L_124
    ldr r0, _LIT2
    add r7, r0, r5
    add r6, r7, #0x120
.L_48:
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    mov r5, r0, lsr #0x13
    ldr r0, [r6]
    cmp r5, #0x0
    mov r1, r0, lsl #0x12
    mov r0, r0, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r0, r0, lsl #0x1
    movgt r8, #0x1
    add r0, r0, r1, lsr #0x1f
    movle r8, #0x0
    cmp fp, r0
    ldr r0, [sp, #0x4]
    moveq r8, #0x0
    cmp r0, #0x0
    beq .L_9c
    mov r0, r5
    bl func_0202e234
    cmp r0, #0x0
    moveq r8, #0x0
.L_9c:
    cmp r9, #0x0
    beq .L_b4
    mov r0, r5
    bl func_0202b878
    cmp r0, #0x16
    movne r8, #0x0
.L_b4:
    ldr r5, [r6]
    ldr r0, [sp]
    mov r3, r5, lsl #0x12
    mov r5, r5, lsl #0x2
    mov r5, r5, lsr #0x18
    mov r5, r5, lsl #0x1
    ldr r2, _LIT3
    mov r1, #0xb
    add r3, r5, r3, lsr #0x1f
    bl func_ov002_021b3fd8
    cmp r0, #0x0
    ldr r0, [r6]
    movne r8, #0x0
    mov r1, r0, lsl #0x12
    mov r0, r0, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    bl func_ov002_021ca5bc
    cmp r0, #0x0
    moveq r8, #0x0
    cmp r8, #0x0
    ldr r0, [r7, #0xc]
    add r4, r4, #0x1
    subne sl, sl, #0x1
    add r6, r6, #0x4
    cmp r4, r0
    bcc .L_48
.L_124:
    cmp sl, #0x0
    movle r0, #0x1
    movgt r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf178
_LIT2: .word data_ov002_022cf16c
_LIT3: .word 0x000012a1
