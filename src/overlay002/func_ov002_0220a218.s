; func_ov002_0220a218 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021b4618
        .extern func_ov002_021bc8c8
        .extern func_ov002_021c92fc
        .global func_ov002_0220a218
        .arm
func_ov002_0220a218:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r7, #0x0
    ldr fp, _LIT0
    mov sl, r0
    mov r8, r7
    mov r5, r7
.L_18:
    ldr r0, _LIT1
    and r1, r5, #0x1
    mla r9, r1, r0, fp
    mov r6, #0x0
.L_28:
    ldrh r0, [sl, #0x2]
    mov r1, r5
    mov r2, r6
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc8c8
    cmp r0, #0x0
    beq .L_88
    ldrh r0, [sl, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r5
    beq .L_68
    ldrh r0, [r9, #0x38]
    cmp r0, #0x0
    beq .L_88
.L_68:
    mov r0, r5
    mov r1, r6
    bl func_ov002_021c92fc
    mov r4, r0
    bl func_ov002_021b4618
    cmp r0, #0x1
    addgt r8, r8, #0x1
    orrle r7, r7, r4
.L_88:
    add r6, r6, #0x1
    cmp r6, #0x4
    add r9, r9, #0x14
    ble .L_28
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_18
    and r0, r7, #0x78
    bl func_ov002_021b4618
    add r0, r8, r0
    cmp r0, #0x4
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
