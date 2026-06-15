; func_02089cd8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a5804
        .extern func_02089008
        .extern func_02089024
        .extern func_0208906c
        .extern func_020893f0
        .extern func_020897fc
        .extern func_02089bb4
        .extern func_020928e8
        .extern func_020945f4
        .extern func_02094688
        .global func_02089cd8
        .arm
func_02089cd8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    mov r9, r0
    mov r8, r1
    mov r7, r2
    bl func_02089024
    movs r6, r0
    bne .L_170
    ldr r1, _LIT0
    mov r0, r9
    mov r2, #0x3c
    mov r3, #0x0
    bl func_0208906c
    cmp r0, #0x3c
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, pc}
    ldr r0, _LIT0
    cmp r8, #0x0
    ldr r0, [r0, #0x38]
    addeq sp, sp, #0x4
    mov r4, r0, lsl #0x2
    mov r0, r4, lsl #0x1
    add r5, r0, #0x3c
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    cmp r7, #0x0
    moveq r3, #0x0
    beq .L_e0
    bl func_020893f0
    mov r3, r0
.L_e0:
    ldr r2, _LIT1
    mov r0, r8
    add r1, r5, #0x20
    str r9, [sp]
    bl func_020897fc
    movs r6, r0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    mov r0, r9
    mov r1, r6
    add r2, r4, #0x3c
    mov r3, #0x0
    bl func_0208906c
    add r1, r4, #0x3c
    cmp r0, r1
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, pc}
    ldr r1, [r6, #0x38]
    add r0, r6, #0x3c
    mov r2, r4
    add r1, r0, r1, lsl #0x2
    bl func_02094688
    mov r2, r4
    add r0, r6, #0x3c
    mov r1, #0x0
    bl func_020945f4
    mov r0, r6
    mov r1, r5
    bl func_020928e8
    cmp r7, #0x0
    beq .L_170
    mov r0, r9
    mov r1, r6
    bl func_02089008
.L_170:
    mov r0, r6
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_021a5804
_LIT1: .word func_02089bb4
