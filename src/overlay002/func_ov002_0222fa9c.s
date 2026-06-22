; func_ov002_0222fa9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern func_ov002_021b3fd8
        .extern func_ov002_02214720
        .extern func_ov002_0226aef0
        .global func_ov002_0222fa9c
        .arm
func_ov002_0222fa9c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    ldr r2, _LIT0
    mov r9, r0
    ldr r2, [r2, #0x5a8]
    cmp r2, #0x7f
    beq .L_3d0
    cmp r2, #0x80
    bne .L_3d8
    ldrh r0, [r9, #0x2]
    ldr sl, _LIT1
    ldr r1, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mul r3, r2, sl
    ldr r1, [r1, r3]
    mov r7, #0x0
    cmp r1, #0x0
    bls .L_3c8
    ldr r6, _LIT3
    ldr r4, _LIT4
    mov r8, r7
    mov r5, #0xb
.L_344:
    and r1, r0, #0x1
    mla r2, r1, sl, r6
    add r1, r2, #0x120
    ldr r3, [r1, r8]
    mov r1, r5
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov ip, r3, lsl #0x12
    mov r3, r2, lsl #0x1
    mov r2, r4
    add r3, r3, ip, lsr #0x1f
    bl func_ov002_021b3fd8
    cmp r0, #0x0
    bne .L_3a0
    ldrh r0, [r9, #0x2]
    mov r2, #0x0
    mov r3, r2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, #0x1
    bl func_ov002_0226aef0
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_3a0:
    ldrh r0, [r9, #0x2]
    add r7, r7, #0x1
    add r8, r8, #0x4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mla r1, r2, sl, r6
    ldr r1, [r1, #0xc]
    cmp r7, r1
    bcc .L_344
.L_3c8:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_3d0:
    bl func_ov002_02214720
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_3d8:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf178
_LIT3: .word data_ov002_022cf16c
_LIT4: .word 0x000012a1
