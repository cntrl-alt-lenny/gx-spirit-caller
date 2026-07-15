; func_ov020_021aa72c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov020_021adf80
        .extern data_ov020_021adfc8
        .extern data_ov020_021ae894
        .extern func_ov020_021aa6cc
        .global func_ov020_021aa72c
        .arm
func_ov020_021aa72c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r0, [r0, #0x910]
    ldr r2, _LIT2
    sub r0, r0, #0x1
    mov r0, r0, lsl #0x1
    ldrh r0, [r1, r0]
    cmp r0, #0x4
    bne .L_70
    mov r7, #0x0
    mov r8, #0x1c
    mov r6, #0x8
    mov r5, #0xf0
    mov r4, #0x24
.L_3c:
    mov r0, r6
    mov r1, r8
    mov r2, r5
    mov r3, r4
    bl func_ov020_021aa6cc
    cmp r0, #0x1
    moveq r0, r7
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    add r7, r7, #0x1
    cmp r7, #0x4
    add r8, r8, #0x28
    blt .L_3c
    b .L_d0
.L_70:
    ldr r0, [r2, #0x8c8]
    sub r0, r0, #0x1
    add r0, r2, r0, lsl #0x1
    add r0, r0, #0x800
    ldrh r0, [r0, #0xcc]
    cmp r0, #0x3
    bne .L_d0
    mov r8, #0x0
    mov r7, #0x1c
    mov r6, #0x8
    mov r5, #0xf0
    mov r4, #0x24
.L_a0:
    mov r0, r6
    mov r1, r7
    mov r2, r5
    mov r3, r4
    bl func_ov020_021aa6cc
    cmp r0, #0x1
    moveq r0, r8
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    add r8, r8, #0x1
    cmp r8, #0x3
    add r7, r7, #0x28
    blt .L_a0
.L_d0:
    mvn r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov020_021adf80
_LIT1: .word data_ov020_021ae894
_LIT2: .word data_ov020_021adfc8
