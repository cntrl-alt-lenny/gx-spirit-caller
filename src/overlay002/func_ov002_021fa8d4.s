; func_ov002_021fa8d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021df780
        .extern func_ov002_021f3458
        .extern func_ov002_021f4a84
        .extern func_ov002_021ff3bc
        .global func_ov002_021fa8d4
        .arm
func_ov002_021fa8d4:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    ldrh r2, [r7, #0x2]
    mov r6, r1
    mov r1, r2, lsl #0x11
    mov r2, r2, lsl #0x1f
    mov r1, r1, lsr #0x1f
    eor r5, r1, r2, lsr #0x1f
    bl func_ov002_021f3458
    mov r4, r0
    mov r0, r7
    mov r1, r6
    bl func_ov002_021ff3bc
    cmp r0, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, _LIT0
    and r1, r5, #0x1
    mul r2, r1, r0
    ldr r0, _LIT1
    ldr r0, [r0, r2]
    cmp r0, r4
    mvnle r0, #0x0
    ldmleia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r7
    mov r1, r6
    bl func_ov002_021f4a84
    mov r6, r0
    cmp r6, #0x1
    bne .L_338
    mov r0, r5
    mov r1, r4
    bl func_ov002_021df780
.L_338:
    mov r0, r6
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
