; func_ov002_02255d6c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern data_ov002_022d0570
        .extern func_ov002_021b3f74
        .extern func_ov002_021b99c8
        .extern func_ov002_021d5b60
        .extern func_ov002_021df5e4
        .extern func_ov002_021e2460
        .global func_ov002_02255d6c
        .arm
func_ov002_02255d6c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r6, #0x0
    str r6, [sp]
.L_c:
    ldr r0, _LIT0
    ldr r2, _LIT1
    ldr r3, [r0, #0xcec]
    ldr r0, [sp]
    mov r1, #0xb
    eor r7, r3, r0
    mov r0, r7
    mov r3, #0x2
    bl func_ov002_021b3f74
    cmp r0, #0x0
    beq .L_e8
    ldr r0, _LIT2
    ldr r1, _LIT3
    and r2, r7, #0x1
    mla r1, r2, r0, r1
    add r0, r1, #0x100
    ldrh r8, [r0, #0x16]
    cmp r8, #0x0
    beq .L_e8
    ldr r5, _LIT1
    rsb fp, r7, #0x1
    add r4, r1, #0x120
.L_64:
    ldr r0, _LIT4
    add r9, r0, r8, lsl #0x3
    ldrh r0, [r9, #0x2]
    ldrh r8, [r9, #0x6]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0x2
    ldreqh r0, [r9]
    cmpeq r0, r5
    bne .L_e0
    ldrh r1, [r9, #0x4]
    mov r0, r7
    bl func_ov002_021b99c8
    movs sl, r0
    bmi .L_cc
    cmp r6, #0x0
    bne .L_b4
    mov r0, fp
    mov r1, r5
    bl func_ov002_021df5e4
.L_b4:
    mov r0, r7
    mov r1, sl
    add r2, r4, sl, lsl #0x2
    mov r3, #0x1
    bl func_ov002_021e2460
    mov r6, #0x1
.L_cc:
    ldrh r3, [r9, #0x4]
    mov r0, r7
    mov r1, #0xb
    mov r2, r5
    bl func_ov002_021d5b60
.L_e0:
    cmp r8, #0x0
    bne .L_64
.L_e8:
    ldr r0, [sp]
    add r0, r0, #0x1
    str r0, [sp]
    cmp r0, #0x2
    blt .L_c
    mov r0, r6
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word 0x0000123b
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf08c
_LIT4: .word data_ov002_022d0570
