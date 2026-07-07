; func_ov002_02280b30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_0227adf0
        .extern func_ov002_0227ae40
        .global func_ov002_02280b30
        .arm
func_ov002_02280b30:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x34
    mov r9, r1
    ldr r5, _LIT0
    ldr r1, _LIT1
    and r4, r9, #0x1
    mla r6, r4, r1, r5
    mvn r1, #0x0
    ldr r8, [sp, #0x58]
    str r1, [sp, #0x4]
    mov sl, r0
    mov fp, r2
    str r3, [sp]
    mov r5, r1
    add r6, r6, #0x30
    mov r4, #0x0
.L_40:
    cmp r4, fp
    beq .L_b4
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_b4
    mov r7, #0x0
    cmp sl, r9
    mov r0, r9
    add r2, sp, #0x8
    mov r1, r4
    bne .L_78
    bl func_ov002_0227adf0
    b .L_7c
.L_78:
    bl func_ov002_0227ae40
.L_7c:
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_94
    ldr r7, [sp, #0x1c]
    cmp r7, #0x0
    movlt r7, #0x0
.L_94:
    cmp r8, #0x0
    beq .L_a8
    ldr r0, [sp, #0x20]
    cmp r7, r0
    movle r7, r0
.L_a8:
    cmp r7, r5
    strgt r4, [sp, #0x4]
    movgt r5, r7
.L_b4:
    add r4, r4, #0x1
    cmp r4, #0x5
    add r6, r6, #0x14
    blt .L_40
    ldr r0, [sp, #0x4]
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
