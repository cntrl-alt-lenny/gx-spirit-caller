; func_ov002_02254efc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a8
        .extern func_ov002_021b3fd8
        .extern func_ov002_021ba104
        .extern func_ov002_021d59cc
        .extern func_ov002_021d5b80
        .global func_ov002_02254efc
        .arm
func_ov002_02254efc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    mov sl, r0
    ldr r5, _LIT0
    and r4, sl, #0x1
    mov r9, r1
    mov r2, #0x14
    mul r3, r4, r5
    mul r4, r9, r2
    ldr r6, _LIT1
    add r2, r6, r3
    add r2, r2, r4
    ldr r6, [r2, #0x30]
    add r2, r5, #0xb00
    mov r6, r6, lsl #0x13
    cmp r2, r6, lsr #0x13
    addne sp, sp, #0x8
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r6, _LIT2
    add r5, r6, r3
    mov r3, #0x1
    ldr r7, [r4, r5]
    bl func_ov002_021d5b80
    ldr r4, _LIT3
    mov r5, #0x0
    sub r0, r4, #0xb00
    mov fp, #0x3
    str r0, [sp, #0x4]
.L_70:
    ldr r1, [sp, #0x4]
    ldr r0, _LIT1
    and r2, r5, #0x1
    mla r0, r2, r1, r0
    mov r6, #0x0
    add r8, r0, #0x30
.L_88:
    mov r0, r5
    mov r1, r6
    mov r2, r7
    bl func_ov002_021ba104
    cmp r0, #0x0
    beq .L_d8
    ldr r2, [r8]
    mov r0, sl
    mov r1, r2, lsl #0x2
    mov r2, r2, lsl #0x12
    mov r1, r1, lsr #0x18
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r2, r1, lsr #0x10
    mov r1, r9
    str r2, [sp]
    mov r2, r4
    mov r3, fp
    bl func_ov002_021d59cc
.L_d8:
    add r6, r6, #0x1
    cmp r6, #0xa
    add r8, r8, #0x14
    ble .L_88
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_70
    ldr fp, _LIT4
    cmp r7, fp
    addne sp, sp, #0x8
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r8, #0x0
.L_108:
    ldr r1, _LIT0
    ldr r0, _LIT1
    and r2, r8, #0x1
    mla r6, r2, r1, r0
    ldr r0, [r6, #0x10]
    mov r7, #0x0
    cmp r0, #0x0
    bls .L_194
    add r5, r6, #0x260
.L_12c:
    ldr r1, [r5]
    mov r0, r8
    mov r2, r1, lsl #0x12
    mov r1, r1, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r1, r1, lsl #0x1
    add r4, r1, r2, lsr #0x1f
    mov r1, #0xb
    mov r2, fp
    mov r3, r4
    bl func_ov002_021b3fd8
    cmp r0, #0x0
    beq .L_180
    mov r0, r4, lsl #0x10
    mov r1, r0, lsr #0x10
    str r1, [sp]
    mov r0, sl
    mov r1, r9
    add r2, fp, #0xc7
    mov r3, #0x3
    bl func_ov002_021d59cc
.L_180:
    ldr r0, [r6, #0x10]
    add r7, r7, #0x1
    cmp r7, r0
    add r5, r5, #0x4
    bcc .L_12c
.L_194:
    add r8, r8, #0x1
    cmp r8, #0x2
    blt .L_108
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a8
_LIT3: .word 0x00001368
_LIT4: .word 0x000012a1
