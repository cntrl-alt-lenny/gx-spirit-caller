; func_ov002_021c1d4c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf1a4
        .extern data_ov002_022cf1ac
        .extern func_ov002_021b9ecc
        .global func_ov002_021c1d4c
        .arm
func_ov002_021c1d4c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl func_ov002_021b9ecc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    cmp r4, #0x5
    movge r0, #0x0
    ldmgeia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT0
    ldr r1, [r1, #0x5c4]
    cmp r1, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r2, _LIT1
    and ip, r5, #0x1
    mul r3, ip, r2
    mov r1, #0x14
    mul ip, r4, r1
    ldr r2, _LIT2
    add r1, r2, r3
    ldrh r1, [ip, r1]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT3
    add r1, r1, r3
    ldr r2, [ip, r1]
    mov r1, r2, lsr #0x6
    tst r1, #0x1
    bne .L_b4
    mov r1, r2, lsr #0x2
    orr r1, r1, r2, lsr #0x1
    tst r1, #0x1
    bne .L_b4
    ldr r1, _LIT4
    cmp r0, r1
    ldrne r1, _LIT5
    cmpne r0, r1
    addne r1, r1, #0x75
    cmpne r0, r1
    bne .L_b4
    mov r0, #0x3
    ldmia sp!, {r3, r4, r5, pc}
.L_b4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf1a4
_LIT3: .word data_ov002_022cf1ac
_LIT4: .word 0x00001437
_LIT5: .word 0x0000194e
