; func_ov002_0224a038 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf17c
        .extern func_0202b878
        .extern func_0202b8a8
        .extern func_ov002_021b3fd8
        .extern func_ov002_021ca440
        .extern func_ov002_02253458
        .global func_ov002_0224a038
        .arm
func_ov002_0224a038:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldr r0, _LIT0
    and r3, sl, #0x1
    mul r1, r3, r0
    ldr r0, _LIT1
    mov r6, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    ldmlsia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT2
    ldr fp, _LIT3
    add r9, r0, r1
    add r8, r9, #0x260
    add r5, r2, #0x1
    mov r4, #0xb
.L_40:
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    mov r7, r0, lsr #0x13
    mov r0, r7
    bl func_0202b878
    cmp r0, #0xa
    bne .L_c0
    mov r0, r7
    bl func_0202b8a8
    cmp r5, r0
    bne .L_c0
    mov r0, sl
    mov r1, r7
    bl func_ov002_021ca440
    cmp r0, #0x0
    beq .L_c0
    ldr r2, [r8]
    mov r0, sl
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r7, r2, lsl #0x12
    mov r3, r1, lsl #0x1
    mov r1, r4
    mov r2, fp
    add r3, r3, r7, lsr #0x1f
    bl func_ov002_021b3fd8
    cmp r0, #0x0
    bne .L_c0
    mov r0, sl
    mov r1, #0xd
    mov r2, r6
    bl func_ov002_02253458
.L_c0:
    ldr r0, [r9, #0x10]
    add r6, r6, #0x1
    cmp r6, r0
    add r8, r8, #0x4
    bcc .L_40
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf17c
_LIT2: .word data_ov002_022cf16c
_LIT3: .word 0x000012a1
