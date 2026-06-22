; func_ov002_0222e2ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern func_ov002_021d63fc
        .extern func_ov002_021d6808
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_0225764c
        .global func_ov002_0222e2ec
        .arm
func_ov002_0222e2ec:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r1, _LIT0
    mov sl, r0
    ldr r0, [r1, #0x5a8]
    cmp r0, #0x7e
    beq .L_f8
    cmp r0, #0x7f
    beq .L_34
    cmp r0, #0x80
    bne .L_104
    bl func_ov002_021e2b3c
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_34:
    mov r5, #0x1
    mov r8, #0x0
    ldr r7, _LIT1
    ldr r4, _LIT2
    mov r9, r8
    mov fp, r5
    mov r6, r5
.L_50:
    ldrh r1, [sl, #0x2]
    mov r0, sl
    mov r2, r8
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_e0
    ldrh r0, [sl, #0x2]
    mov r0, r0, lsl #0x1f
    mov r1, r0, lsr #0x1f
    and r0, r1, #0x1
    mla r2, r0, r4, r7
    add r2, r2, r9
    ldrh r0, [r2, #0x38]
    cmp r0, #0x0
    ldrh r0, [r2, #0x36]
    bne .L_c4
    cmp r0, #0x0
    mov r0, sl
    mov r2, r8
    bne .L_b8
    mov r3, r6
    str r6, [sp]
    bl func_ov002_021d6808
    b .L_e0
.L_b8:
    mov r3, fp
    bl func_ov002_021d63fc
    b .L_e0
.L_c4:
    cmp r0, #0x0
    bne .L_e0
    mov r0, sl
    mov r2, r8
    mov r3, #0x0
    str r5, [sp]
    bl func_ov002_021d6808
.L_e0:
    add r8, r8, #0x1
    cmp r8, #0x4
    add r9, r9, #0x14
    ble .L_50
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_f8:
    bl func_ov002_021e2c5c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_104:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00000868
