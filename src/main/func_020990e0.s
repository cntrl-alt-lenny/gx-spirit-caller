; func_020990e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021024c4
        .extern func_020945f4
        .extern func_02094688
        .extern func_02098cf8
        .extern func_020991a4
        .global func_020990e0
        .arm
func_020990e0:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r6, r1
    ldr r1, [r6, #0x14]
    ldr r3, [r6, #0x10]
    mov r7, r0
    mov r4, r1, lsl #0x3
    ldr r1, _LIT0
    mov r0, r6
    mov r2, #0x1
    orr r4, r4, r3, lsr #0x1d
    mov r5, r3, lsl #0x3
    bl func_020991a4
    ldr r0, [r6, #0x10]
    mov r1, #0x0
    and r3, r0, #0x3f
    rsb r2, r3, #0x40
    cmp r2, #0x8
    bcs .L_450
    add r0, r6, #0x18
    add r0, r0, r3
    bl func_020945f4
    mov r0, r6
    bl func_02098cf8
    mov r3, #0x0
    mov r2, #0x40
.L_450:
    cmp r2, #0x8
    bls .L_46c
    add r0, r6, #0x18
    add r0, r0, r3
    sub r2, r2, #0x8
    mov r1, #0x0
    bl func_020945f4
.L_46c:
    str r5, [r6, #0x50]
    mov r0, r6
    str r4, [r6, #0x54]
    bl func_02098cf8
    mov r0, r6
    mov r1, r7
    mov r2, #0x10
    bl func_02094688
    mov r0, r6
    mov r1, #0x0
    mov r2, #0x58
    bl func_020945f4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word data_021024c4
