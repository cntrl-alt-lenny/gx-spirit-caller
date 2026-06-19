; func_ov002_02291dc0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021b3ecc
        .extern func_ov002_021c8470
        .extern func_ov002_02280b74
        .global func_ov002_02291dc0
        .arm
func_ov002_02291dc0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r8, r0
    ldrh r0, [r8, #0x2]
    ldr r2, _LIT0
    mov r1, #0xb
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    bne .L_c0
    ldrh r0, [r8, #0x2]
    mov r4, #0x0
    sub r2, r4, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, r0
    mov r3, #0x1
    str r4, [sp]
    bl func_ov002_02280b74
    mov r5, r4
    ldr r4, _LIT1
    ldr r9, _LIT2
    mov r6, r0
    mov r7, r5
.L_64:
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r1, r0, #0x1
    mla r2, r1, r9, r4
    add r2, r2, r7
    ldr r1, [r2, #0x30]
    mov r1, r1, lsl #0x13
    movs r1, r1, lsr #0x13
    beq .L_b0
    ldrh r1, [r2, #0x36]
    cmp r1, #0x0
    bne .L_b0
    mov r1, r5
    bl func_ov002_021c8470
    cmp r0, r6
    movlt r0, #0x1
    ldmltia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_b0:
    add r5, r5, #0x1
    cmp r5, #0x5
    add r7, r7, #0x14
    blt .L_64
.L_c0:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x000012ce
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00000868
