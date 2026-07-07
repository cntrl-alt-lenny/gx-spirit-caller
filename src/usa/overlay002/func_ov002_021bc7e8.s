; func_ov002_021bc7e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf0c4
        .extern data_ov002_022cf0cc
        .extern func_ov002_021b3dec
        .extern func_ov002_021b3ef8
        .extern func_ov002_021b9dec
        .extern func_ov002_021baf88
        .global func_ov002_021bc7e8
        .arm
func_ov002_021bc7e8:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r1
    mov r4, r2
    mov r7, r0
    mov r0, r6
    mov r1, r4
    bl func_ov002_021b9dec
    movs r5, r0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    cmp r4, #0x5
    movge r0, #0x0
    ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, _LIT0
    bl func_ov002_021baf88
    cmp r0, #0x0
    movgt r0, #0x0
    ldmgtia sp!, {r3, r4, r5, r6, r7, pc}
    cmp r7, r6
    beq .L_20c
    ldr r2, _LIT1
    mov r0, r6
    mov r1, r4
    mov r3, r7
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
.L_20c:
    ldr r2, _LIT2
    mov r0, r6
    mov r1, r4
    bl func_ov002_021b3dec
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r2, _LIT3
    mov r0, r6
    mov r1, r4
    bl func_ov002_021b3dec
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    cmp r5, #0x1900
    ldrne r0, _LIT4
    cmpne r5, r0
    bne .L_2ac
    ldr r1, _LIT5
    and r2, r6, #0x1
    mul ip, r2, r1
    mov r0, #0x14
    mul lr, r4, r0
    ldr r2, _LIT6
    ldr r1, _LIT7
    add r0, r2, ip
    ldr r3, [lr, r0]
    add r2, r1, ip
    mov r1, r3, lsr #0x6
    mov r0, r3, lsr #0x2
    and r1, r1, #0x1
    orr r0, r0, r3, lsr #0x1
    and r0, r0, #0x1
    ldrh r2, [lr, r2]
    mvn r1, r1
    mvn r0, r0
    and r1, r2, r1
    tst r1, r0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
.L_2ac:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x000013f2
_LIT1: .word 0x000013eb
_LIT2: .word 0x000016a4
_LIT3: .word 0x000012d1
_LIT4: .word 0x00001aad
_LIT5: .word 0x00000868
_LIT6: .word data_ov002_022cf0cc
_LIT7: .word data_ov002_022cf0c4
