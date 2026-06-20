; func_ov002_02294734 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern func_ov002_0227c678
        .extern func_ov002_02280980
        .extern func_ov002_022815a4
        .global func_ov002_02294734
        .arm
func_ov002_02294734:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldrh r0, [sl, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02280980
    cmp r0, #0x0
    movge r0, #0x0
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r0, [sl, #0x2]
    ldr r4, _LIT0
    ldr r2, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mul r1, r3, r4
    ldr r2, [r2, r1]
    cmp r2, #0x3
    movls r0, #0x0
    ldmlsia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r2, #0x0
    mov r7, #0x0
    bls .L_e0
    ldr r6, _LIT2
    mov r9, r7
    mov fp, r7
    mov r5, #0x1
.L_6c:
    add r1, r6, r1
    add r1, r1, r9
    ldr r2, [r1, #0x120]
    mov r1, r5
    mov r2, r2, lsl #0x13
    mov r8, r2, lsr #0x13
    mov r2, r8, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_ov002_0227c678
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r8
    mov r1, fp
    bl func_ov002_022815a4
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
    bcc .L_6c
.L_e0:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf178
_LIT2: .word data_ov002_022cf16c
