; func_ov002_02267a44 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern data_ov002_022d0e6c
        .extern func_ov002_021b9ecc
        .extern func_ov002_021baca8
        .extern func_ov002_021e358c
        .extern func_ov002_021fd81c
        .extern func_ov002_0226b094
        .global func_ov002_02267a44
        .arm
func_ov002_02267a44:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r5, _LIT0
    mov sl, r0
    ldr r4, [r5, #0xd28]
    mov r9, r1
    cmp r4, #0x0
    bne .L_dc
    mov r8, #0x5
    str r8, [r5, #0xd28]
    cmp r8, #0xa
    bcs .L_164
    ldr r2, _LIT1
    ldr r0, _LIT2
    and r1, sl, #0x1
    mla r2, r1, r0, r2
    mov r0, sl, lsl #0x1f
    and r0, r0, #-2147483648
    orr r7, r0, #0x4200000
    mov r4, r9, lsl #0x10
    add r6, r2, #0x30
    mov fp, #0x14
.L_54:
    mov r0, sl
    mov r1, r8
    mov r2, r9
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_c4
    mul r0, r8, fp
    ldr r1, [r6, r0]
    mov r2, r8, lsl #0x10
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    and r2, r2, #0x1f0000
    add r0, r0, r1, lsr #0x1f
    orr r3, r7, r2
    mov r1, r0, lsl #0x10
    mov r2, #0x0
    orr r0, r3, r4, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021fd81c
    cmp r0, #0x0
    beq .L_c4
    mov r0, sl
    mov r1, r9
    bl func_ov002_0226b094
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_c4:
    ldr r0, [r5, #0xd28]
    add r8, r0, #0x1
    str r8, [r5, #0xd28]
    cmp r8, #0xa
    bcc .L_54
    b .L_164
.L_dc:
    ldr r1, _LIT3
    ldrh r1, [r1, #0xb0]
    cmp r1, #0x0
    beq .L_164
    ldr r3, _LIT1
    ldr r1, _LIT2
    and r2, sl, #0x1
    mla r3, r2, r1, r3
    mov r1, #0x14
    mul r5, r4, r1
    mov r1, r4
    add r6, r3, #0x30
    bl func_ov002_021b9ecc
    ldr r2, [r6, r5]
    mov r3, sl, lsl #0x1f
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    and r5, r3, #-2147483648
    mov r3, r4, lsl #0x10
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r1, r1, lsl #0x10
    orr r4, r5, #0x4200000
    and r2, r3, #0x1f0000
    orr r2, r4, r2
    mov r0, r0, lsl #0x10
    orr r0, r2, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e358c
    ldr r1, _LIT0
    mov r0, #0x0
    str r0, [r1, #0xd28]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_164:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022d0e6c
