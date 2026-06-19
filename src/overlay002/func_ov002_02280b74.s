; func_ov002_02280b74 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_0227aee0
        .extern func_ov002_0227af30
        .global func_ov002_02280b74
        .arm
func_ov002_02280b74:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x30
    mov r9, r1
    ldr r5, _LIT0
    ldr r1, _LIT1
    and r4, r9, #0x1
    mla r1, r4, r1, r5
    ldr r8, [sp, #0x58]
    mov sl, r0
    mov fp, r2
    str r3, [sp]
    add r6, r1, #0x30
    mvn r5, #0x0
    mov r4, #0x0
.L_38:
    cmp r4, fp
    beq .L_a8
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_a8
    mov r7, #0x0
    cmp sl, r9
    mov r0, r9
    add r2, sp, #0x4
    mov r1, r4
    bne .L_70
    bl func_ov002_0227aee0
    b .L_74
.L_70:
    bl func_ov002_0227af30
.L_74:
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_8c
    ldr r7, [sp, #0x18]
    cmp r7, #0x0
    movlt r7, #0x0
.L_8c:
    cmp r8, #0x0
    beq .L_a0
    ldr r0, [sp, #0x1c]
    cmp r7, r0
    movle r7, r0
.L_a0:
    cmp r7, r5
    movgt r5, r7
.L_a8:
    add r4, r4, #0x1
    cmp r4, #0x5
    add r6, r6, #0x14
    blt .L_38
    mov r0, r5
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
