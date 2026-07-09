; func_ov002_02259ff8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021b3dec
        .extern func_ov002_021b4040
        .extern func_ov002_021babc8
        .extern func_ov002_021baf88
        .extern func_ov002_021be1f8
        .extern func_ov002_021be2a4
        .extern func_ov002_021bf1b4
        .extern func_ov002_02259e8c
        .extern func_ov002_02259fb0
        .global func_ov002_02259ff8
        .arm
func_ov002_02259ff8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r1, _LIT0
    mov sl, r0
    ldr r1, [r1, #0xcf8]
    cmp r1, #0x3
    beq .L_28
    bl func_ov002_02259e8c
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_28:
    mov r0, sl
    bl func_ov002_02259fb0
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, _LIT1
    mov r0, sl
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_ec
    rsb r4, sl, #0x1
    ldr r2, _LIT1
    mov r0, r4
    mov r1, #0xb
    bl func_ov002_021b4040
    mvn r1, #0x0
    cmp r0, r1
    beq .L_84
    cmp r0, #0x0
    beq .L_ec
    cmp r0, #0x1
    bne .L_ec
.L_84:
    mov r8, #0x0
    mov r5, #0x1
    mov r6, r8
    mov r7, r5
.L_94:
    mov r0, sl
    mov r1, r8
    mov r2, r7
    bl func_ov002_021be2a4
    cmp r0, #0x0
    beq .L_e0
    mov r9, r6
.L_b0:
    mov r0, sl
    mov r1, r8
    mov r2, r4
    mov r3, r9
    str r5, [sp]
    bl func_ov002_021bf1b4
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r9, r9, #0x1
    cmp r9, #0x4
    ble .L_b0
.L_e0:
    add r8, r8, #0x1
    cmp r8, #0x5
    blt .L_94
.L_ec:
    ldr r2, _LIT2
    mov r0, sl
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_12c
    ldr r2, _LIT3
    mov r0, sl
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_12c
    ldr r0, _LIT4
    bl func_ov002_021baf88
    cmp r0, #0x0
    beq .L_15c
.L_12c:
    mov r5, #0x0
    mov r4, #0x1
.L_134:
    mov r0, sl
    mov r1, r5
    mov r2, r4
    bl func_ov002_021be1f8
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r5, r5, #0x1
    cmp r5, #0x5
    blt .L_134
.L_15c:
    ldr r5, _LIT5
    mov r6, #0x0
    mov r4, #0x1
.L_168:
    mov r0, sl
    mov r1, r6
    mov r2, r5
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_19c
    mov r0, sl
    mov r1, r6
    mov r2, r4
    bl func_ov002_021be1f8
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_19c:
    add r6, r6, #0x1
    cmp r6, #0x5
    blt .L_168
    ldr r2, _LIT6
    ldr r0, _LIT7
    and r1, sl, #0x1
    mla r6, r1, r0, r2
    mov r4, #0x1
    ldr r5, _LIT8
    rsb r7, sl, #0x1
    mov r8, #0x0
    mov fp, r4
.L_1cc:
    mov r0, sl
    mov r1, r8
    mov r2, r5
    bl func_ov002_021babc8
    cmp r0, #0x0
    ldrne r0, [r6, #0x3c]
    cmpne r0, #0x0
    beq .L_238
    mov r0, sl
    mov r1, r8
    mov r2, fp
    bl func_ov002_021be2a4
    cmp r0, #0x0
    beq .L_238
    mov r9, #0x0
.L_208:
    mov r0, sl
    mov r1, r8
    mov r2, r7
    mov r3, r9
    str r4, [sp]
    bl func_ov002_021bf1b4
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r9, r9, #0x1
    cmp r9, #0x4
    ble .L_208
.L_238:
    add r8, r8, #0x1
    cmp r8, #0x5
    add r6, r6, #0x14
    blt .L_1cc
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word 0x000015ff
_LIT2: .word 0x00001669
_LIT3: .word 0x000014a6
_LIT4: .word 0x00001443
_LIT5: .word 0x000016bf
_LIT6: .word data_ov002_022cf08c
_LIT7: .word 0x00000868
_LIT8: .word 0x00001a79
