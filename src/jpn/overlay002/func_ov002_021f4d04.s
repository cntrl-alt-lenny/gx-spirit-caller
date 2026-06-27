; func_ov002_021f4d04 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021df690
        .extern func_ov002_021f3368
        .extern func_ov002_021f4994
        .global func_ov002_021f4d04
        .arm
func_ov002_021f4d04:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    ldrh r2, [r6, #0x2]
    mov r5, r1
    mov r1, r2, lsl #0x11
    mov r2, r2, lsl #0x1f
    mov r1, r1, lsr #0x1f
    eor r4, r1, r2, lsr #0x1f
    bl func_ov002_021f3368
    ldr r1, _LIT0
    and r2, r4, #0x1
    mul r3, r2, r1
    ldr r1, _LIT1
    mov r7, r0
    ldr r0, [r1, r3]
    cmp r0, r7
    mvnle r0, #0x0
    ldmleia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r6
    mov r1, r5
    bl func_ov002_021f4994
    mov r5, r0
    cmp r5, #0x1
    bne .L_e8
    mov r0, r4
    mov r1, r7
    bl func_ov002_021df690
.L_e8:
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
