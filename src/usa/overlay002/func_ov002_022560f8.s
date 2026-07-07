; func_ov002_022560f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021b4204
        .extern func_ov002_021b9dec
        .extern func_ov002_021de390
        .extern func_ov002_02256068
        .global func_ov002_022560f8
        .arm
func_ov002_022560f8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r0, _LIT0
    ldr r1, [r0, #0xd0]
    tst r1, #0x1
    beq .L_24
    ldr r0, [r0, #0xd2c]
    cmp r0, #0x9
    movcc r0, #0x0
    ldmccia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_24:
    mov fp, #0x0
    ldr r7, _LIT1
    mov r6, fp
.L_30:
    ldr r0, _LIT0
    ldr r1, _LIT2
    ldr r0, [r0, #0xcec]
    ldr r5, _LIT3
    eor r8, r0, fp
    ldr r0, _LIT4
    and r2, r8, #0x1
    mla sl, r2, r1, r0
    mov r9, #0x0
    add r4, r1, #0xd30
.L_58:
    mov r0, r8
    mov r1, r9
    bl func_ov002_021b9dec
    cmp r0, r5
    cmpne r0, r4
    bne .L_d8
    ldr r3, [sl, #0x40]
    ldrh r0, [sl, #0x38]
    mov r2, r3, lsr #0x6
    mov r1, r3, lsr #0x2
    orr r1, r1, r3, lsr #0x1
    and r2, r2, #0x1
    mvn r2, r2
    and r1, r1, #0x1
    and r2, r0, r2
    mvn r0, r1
    tst r2, r0
    beq .L_d8
    mov r0, r8
    mov r1, r9
    mov r2, r7
    mov r3, r6
    bl func_ov002_021b4204
    cmp r0, #0x0
    beq .L_d8
    mov r2, #0x0
    mov r0, r8
    mov r1, r9
    mov r3, r2
    bl func_ov002_021de390
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d8:
    add r9, r9, #0x1
    cmp r9, #0x4
    add sl, sl, #0x14
    ble .L_58
    add fp, fp, #0x1
    cmp fp, #0x2
    blt .L_30
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word func_ov002_02256068
_LIT2: .word 0x00000868
_LIT3: .word 0x00001596
_LIT4: .word data_ov002_022cf08c
