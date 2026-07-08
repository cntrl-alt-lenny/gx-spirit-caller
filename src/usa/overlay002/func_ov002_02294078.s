; func_ov002_02294078 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022cf0a0
        .extern func_ov002_0227c588
        .extern func_ov002_02281494
        .global func_ov002_02294078
        .arm
func_ov002_02294078:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldrh r0, [sl, #0x2]
    ldr r4, _LIT0
    ldr r2, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mul r1, r3, r4
    ldr r2, [r2, r1]
    mov r7, #0x0
    cmp r2, #0x0
    bls .L_b8
    ldr r6, _LIT2
    mov r9, r7
    mov fp, r7
    mov r5, #0x1
.L_44:
    add r1, r6, r1
    add r1, r1, r9
    ldr r2, [r1, #0x120]
    mov r1, r5
    mov r2, r2, lsl #0x13
    mov r8, r2, lsr #0x13
    mov r2, r8, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_ov002_0227c588
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r8
    mov r1, fp
    bl func_ov002_02281494
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r0, [sl, #0x2]
    add r7, r7, #0x1
    add r9, r9, #0x4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mul r1, r2, r4
    add r2, r6, r1
    ldr r2, [r2, #0xc]
    cmp r7, r2
    bcc .L_44
.L_b8:
    ldr r0, _LIT3
    mov r7, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    bls .L_130
    ldr r5, _LIT2
    ldr r8, _LIT0
    mov r6, r7
    mov r4, r7
.L_dc:
    add r0, r5, r1
    add r0, r0, r6
    ldr r0, [r0, #0x418]
    mov r1, r4
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_ov002_02281494
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r0, [sl, #0x2]
    add r7, r7, #0x1
    add r6, r6, #0x4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r0, r0, #0x1
    mul r1, r0, r8
    add r0, r5, r1
    ldr r0, [r0, #0x14]
    cmp r7, r0
    bcc .L_dc
.L_130:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf098
_LIT2: .word data_ov002_022cf08c
_LIT3: .word data_ov002_022cf0a0
