; func_ov002_021b38e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c6
        .extern data_ov002_022d0570
        .extern func_0202e2ec
        .global func_ov002_021b38e4
        .arm
func_ov002_021b38e4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r4, _LIT0
    mov r3, #0x14
    ldr r5, _LIT1
    and r6, r0, #0x1
    mul r3, r1, r3
    mla r0, r6, r4, r5
    ldrh r6, [r3, r0]
    mov sl, r2
    cmp r6, #0x0
    beq .L_e0
    ldr fp, _LIT2
    ldr r5, _LIT3
.L_34:
    add r1, r5, r6, lsl #0x3
    ldrh r0, [r1, #0x2]
    ldrh r6, [r1, #0x6]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0xa
    cmpne r0, #0xb
    bne .L_d8
    ldrh r7, [r1]
    and r1, r7, #0xff
    and r1, r1, #0x1
    mla r8, r1, r4, fp
    mov r0, r7, asr #0x8
    and r2, r0, #0xff
    mov r0, #0x14
    smulbb r9, r2, r0
    add r0, r8, r9
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e2ec
    cmp r0, #0x0
    beq .L_d8
    cmp sl, #0x0
    beq .L_cc
    add r0, r8, r9
    ldr r3, [r0, #0x40]
    ldrh r2, [r0, #0x38]
    mov r1, r3, lsr #0x6
    mov r0, r3, lsr #0x2
    and r1, r1, #0x1
    orr r0, r0, r3, lsr #0x1
    mvn r1, r1
    and r0, r0, #0x1
    and r1, r2, r1
    mvn r0, r0
    tst r1, r0
    beq .L_d8
.L_cc:
    mov r0, r7, lsl #0x10
    mov r0, r0, lsr #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d8:
    cmp r6, #0x0
    bne .L_34
.L_e0:
    ldr r0, _LIT4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0c6
_LIT2: .word data_ov002_022cf08c
_LIT3: .word data_ov002_022d0570
_LIT4: .word 0x0000ffff
