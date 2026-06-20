; func_ov002_021c31d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf17c
        .extern data_ov002_022cf180
        .extern func_ov002_021b91d0
        .global func_ov002_021c31d4
        .arm
func_ov002_021c31d4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r1, _LIT0
    and r0, r0, #0x1
    mul sl, r0, r1
    ldr r4, _LIT1
    ldr fp, _LIT2
    ldr r6, [r4, sl]
    ldr r7, [fp, sl]
    cmp r6, r7
    movgt r0, r6
    movle r0, r7
    subs r5, r0, #0x1
    bmi .L_6c
    ldr r0, _LIT3
    add r2, r0, sl
    add r0, r2, #0x18
    add r1, r0, #0x400
    add r0, r2, #0x260
    add r8, r1, r5, lsl #0x2
    add r9, r0, r5, lsl #0x2
.L_50:
    mov r0, r9
    mov r1, r8
    bl func_ov002_021b91d0
    sub r8, r8, #0x4
    sub r9, r9, #0x4
    subs r5, r5, #0x1
    bpl .L_50
.L_6c:
    str r7, [r4, sl]
    str r6, [fp, sl]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf17c
_LIT2: .word data_ov002_022cf180
_LIT3: .word data_ov002_022cf16c
