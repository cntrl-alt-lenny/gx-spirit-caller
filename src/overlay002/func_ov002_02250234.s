; func_ov002_02250234 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf17c
        .extern func_0202b878
        .extern func_0202b890
        .extern func_0202b950
        .extern func_0202e234
        .extern func_ov002_021b3fd8
        .extern func_ov002_021ca440
        .extern func_ov002_02253458
        .global func_ov002_02250234
        .arm
func_ov002_02250234:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r9, r0
    ldr r0, _LIT0
    and r2, r9, #0x1
    mul r3, r2, r0
    ldr r2, _LIT1
    mov r8, r1
    ldr r1, [r2, r3]
    mov r4, #0x0
    cmp r1, #0x0
    ldmlsia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT2
    sub fp, r0, #0x28c
    add r7, r1, r3
    add r6, r7, #0x260
.L_348:
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    mov r5, r0, lsr #0x13
    mov r0, r5
    bl func_0202e234
    cmp r0, #0x0
    beq .L_400
    mov r0, r5
    bl func_0202b950
    cmp r0, fp
    bgt .L_400
    mov r0, r5
    bl func_0202b890
    mov sl, r0
    mov r0, r8
    bl func_0202b890
    cmp sl, r0
    bne .L_400
    mov r0, r5
    bl func_0202b878
    mov sl, r0
    mov r0, r8
    bl func_0202b878
    cmp sl, r0
    bne .L_400
    mov r0, r9
    mov r1, r5
    bl func_ov002_021ca440
    cmp r0, #0x0
    beq .L_400
    ldr r2, [r6]
    mov r0, r9
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r5, r2, lsl #0x12
    mov r3, r1, lsl #0x1
    ldr r2, _LIT3
    mov r1, #0xb
    add r3, r3, r5, lsr #0x1f
    bl func_ov002_021b3fd8
    cmp r0, #0x0
    bne .L_400
    mov r0, r9
    mov r1, #0xd
    mov r2, r4
    bl func_ov002_02253458
.L_400:
    ldr r0, [r7, #0x10]
    add r4, r4, #0x1
    cmp r4, r0
    add r6, r6, #0x4
    bcc .L_348
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf17c
_LIT2: .word data_ov002_022cf16c
_LIT3: .word 0x000012a1
