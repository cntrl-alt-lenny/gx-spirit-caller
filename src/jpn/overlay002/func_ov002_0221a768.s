; func_ov002_0221a768 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022d0d8c
        .extern func_0202b7dc
        .extern func_ov002_021ae350
        .extern func_ov002_021c92ec
        .extern func_ov002_021de318
        .extern func_ov002_0226b000
        .global func_ov002_0221a768
        .arm
func_ov002_0221a768:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    str r0, [sp]
    ldrh r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    addne sp, sp, #0x8
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT0
    ldr r0, [r0, #0x5a8]
    sub r0, r0, #0x7d
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_1b4
    b .L_dc
    b .L_ac
    b .L_78
    b .L_4c
.L_4c:
    ldr r0, [sp]
    mov r2, #0x2
    ldrh r3, [r0, #0x2]
    ldrh r1, [r0]
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0xff
    bl func_ov002_0226b000
    add sp, sp, #0x8
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_78:
    ldr r0, [sp]
    ldr r2, _LIT1
    ldrh r3, [r0, #0x2]
    ldrh r1, [r0]
    mov r0, r3, lsl #0x1f
    ldrh r3, [r2, #0xb0]
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    mov r2, #0x1
    bl func_ov002_0226b000
    add sp, sp, #0x8
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_ac:
    ldr r0, _LIT1
    ldrh r0, [r0, #0xb2]
    bl func_0202b7dc
    ldr r1, [sp]
    ldrh r2, [r1, #0x2]
    mov r1, r0
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae350
    add sp, sp, #0x8
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_dc:
    ldr r0, _LIT1
    mov r6, #0x0
    ldrh r5, [r0, #0xb2]
    str r6, [sp, #0x4]
    mov fp, #0x1
.L_f0:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_110
    ldr r0, [sp]
    ldrh r0, [r0, #0x2]
    mov r0, r0, lsl #0x1f
    mov sl, r0, lsr #0x1f
    b .L_124
.L_110:
    ldr r0, [sp]
    ldrh r0, [r0, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb sl, r0, #0x1
.L_124:
    ldr r1, _LIT2
    ldr r0, _LIT3
    and r2, sl, #0x1
    mla r8, r2, r1, r0
    mov r4, #0x0
    add r7, r8, #0x30
    mov r9, sl, lsl #0x4
.L_140:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrneh r0, [r8, #0x38]
    cmpne r0, #0x0
    beq .L_170
    mov r0, sl
    mov r1, r4
    mov r2, r5
    bl func_ov002_021c92ec
    cmp r0, #0x0
    orrne r6, r6, fp, lsl r9
.L_170:
    add r4, r4, #0x1
    cmp r4, #0x5
    add r7, r7, #0x14
    add r8, r8, #0x14
    add r9, r9, #0x1
    blt .L_140
    ldr r0, [sp, #0x4]
    add r0, r0, #0x1
    str r0, [sp, #0x4]
    cmp r0, #0x2
    blt .L_f0
    ldr r0, [sp]
    mov r1, r6
    bl func_ov002_021de318
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1b4:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022d0d8c
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf08c
