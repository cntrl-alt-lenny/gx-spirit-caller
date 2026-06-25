; func_ov002_0224b3b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0a4
        .extern func_ov002_021ca310
        .extern func_ov002_02253370
        .global func_ov002_0224b3b4
        .arm
func_ov002_0224b3b4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldr r2, _LIT0
    mov r8, r0
    cmp r1, r2
    beq .L_24
    add r0, r2, #0x1
    cmp r1, r0
    moveq r6, r2
    b .L_28
.L_24:
    add r6, r2, #0x1
.L_28:
    ldr r0, _LIT1
    and r2, r8, #0x1
    mul r1, r2, r0
    ldr r0, _LIT2
    mov r4, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    ldmlsia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, _LIT3
    mov r9, #0xc
    add r7, r0, r1
    add r5, r7, #0x3a0
.L_58:
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    cmp r6, r0, lsr #0x13
    bne .L_8c
    mov r0, r8
    mov r1, r6
    bl func_ov002_021ca310
    cmp r0, #0x0
    beq .L_8c
    mov r0, r8
    mov r1, r9
    mov r2, r4
    bl func_ov002_02253370
.L_8c:
    ldr r0, [r7, #0x18]
    add r4, r4, #0x1
    cmp r4, r0
    add r5, r5, #0x4
    bcc .L_58
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x00001507
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf0a4
_LIT3: .word data_ov002_022cf08c
