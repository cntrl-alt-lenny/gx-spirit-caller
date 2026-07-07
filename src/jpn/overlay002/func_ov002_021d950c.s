; func_ov002_021d950c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_0202df24
        .extern func_ov002_021bd5e8
        .extern func_ov002_021d46ac
        .extern func_ov002_021de390
        .global func_ov002_021d950c
        .arm
func_ov002_021d950c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r4, r0
    mov r0, r4, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r0, #0x14
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov002_021d46ac
    ldr r0, _LIT0
    bl func_ov002_021bd5e8
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT0
    mov r0, r4
    bl func_0202df24
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r8, #0x0
    ldr fp, _LIT1
    ldr r4, _LIT2
    mov r5, r8
.L_1a4:
    ldr r0, _LIT3
    mov r7, #0x5
    ldr r0, [r0, #0xcec]
    eor r6, r0, r8
    ldr r0, _LIT4
    and r1, r6, #0x1
    mla r0, r1, r0, fp
    add r9, r0, #0x94
    add sl, r0, #0x64
.L_1c8:
    ldr r0, [r9]
    mov r0, r0, lsl #0x13
    cmp r4, r0, lsr #0x13
    bne .L_208
    ldrh r0, [sl, #0x38]
    cmp r0, #0x0
    beq .L_208
    ldr r0, [sl, #0x40]
    mov r0, r0, lsr #0x6
    tst r0, #0x1
    bne .L_208
    mov r0, r6
    mov r1, r7
    mov r2, r5
    mov r3, r5
    bl func_ov002_021de390
.L_208:
    add r7, r7, #0x1
    cmp r7, #0xa
    add r9, r9, #0x14
    add sl, sl, #0x14
    ble .L_1c8
    add r8, r8, #0x1
    cmp r8, #0x2
    blt .L_1a4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x000010f4
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x000013f7
_LIT3: .word data_ov002_022d008c
_LIT4: .word 0x00000868
