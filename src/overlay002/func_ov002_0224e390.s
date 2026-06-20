; func_ov002_0224e390 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf17c
        .extern func_0202b878
        .extern func_0202b950
        .extern func_0202e234
        .extern func_ov002_021b3fd8
        .extern func_ov002_021ca440
        .extern func_ov002_02253458
        .global func_ov002_0224e390
        .arm
func_ov002_0224e390:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldr r0, _LIT0
    and r2, sl, #0x1
    mul r3, r2, r0
    ldr r2, _LIT1
    mov fp, r1
    ldr r1, [r2, r3]
    mov r6, #0x0
    cmp r1, #0x0
    ldmlsia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT2
    sub r4, r0, #0x28c
    add r9, r1, r3
    add r8, r9, #0x260
.L_3c:
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    mov r7, r0, lsr #0x13
    mov r0, r7
    bl func_0202e234
    cmp r0, #0x0
    beq .L_d8
    mov r0, r7
    bl func_0202b950
    cmp r0, r4
    bgt .L_d8
    mov r0, r7
    bl func_0202b878
    mov r5, r0
    mov r0, fp
    bl func_0202b878
    cmp r5, r0
    bne .L_d8
    mov r0, sl
    mov r1, r7
    bl func_ov002_021ca440
    cmp r0, #0x0
    beq .L_d8
    ldr r2, [r8]
    mov r0, sl
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r5, r2, lsl #0x12
    mov r3, r1, lsl #0x1
    ldr r2, _LIT3
    mov r1, #0xb
    add r3, r3, r5, lsr #0x1f
    bl func_ov002_021b3fd8
    cmp r0, #0x0
    bne .L_d8
    mov r0, sl
    mov r1, #0xd
    mov r2, r6
    bl func_ov002_02253458
.L_d8:
    ldr r0, [r9, #0x10]
    add r6, r6, #0x1
    cmp r6, r0
    add r8, r8, #0x4
    bcc .L_3c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf17c
_LIT2: .word data_ov002_022cf16c
_LIT3: .word 0x000012a1
