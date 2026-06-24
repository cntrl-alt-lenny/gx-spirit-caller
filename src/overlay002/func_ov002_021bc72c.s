; func_ov002_021bc72c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf1a4
        .extern data_ov002_022cf1ac
        .extern func_ov002_021b9ecc
        .extern func_ov002_021bc8c8
        .global func_ov002_021bc72c
        .arm
func_ov002_021bc72c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r1
    mov r4, r2
    mov r6, r0
    mov r0, r5
    mov r1, r4
    bl func_ov002_021b9ecc
    ldr r2, _LIT0
    cmp r0, r2
    bgt .L_9c
    bge .L_e0
    ldr r2, _LIT1
    cmp r0, r2
    bgt .L_60
    sub r1, r2, #0x1
    cmp r0, r1
    blt .L_50
    cmpne r0, r2
    beq .L_e0
    b .L_170
.L_50:
    sub r1, r2, #0xd7
    cmp r0, r1
    beq .L_e0
    b .L_170
.L_60:
    add r1, r2, #0x56
    cmp r0, r1
    bgt .L_74
    beq .L_e0
    b .L_170
.L_74:
    add r1, r2, #0x58
    cmp r0, r1
    bgt .L_170
    add r1, r2, #0x57
    cmp r0, r1
    blt .L_170
    addne r1, r2, #0x58
    cmpne r0, r1
    beq .L_e0
    b .L_170
.L_9c:
    add r1, r2, #0x2
    cmp r0, r1
    bgt .L_bc
    bge .L_e0
    add r1, r2, #0x1
    cmp r0, r1
    beq .L_e0
    b .L_170
.L_bc:
    ldr r1, _LIT2
    cmp r0, r1
    bgt .L_d0
    beq .L_118
    b .L_170
.L_d0:
    add r1, r1, #0x1b8
    cmp r0, r1
    beq .L_e8
    b .L_170
.L_e0:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_e8:
    ldr r0, _LIT3
    mov r1, #0x14
    ldr r2, _LIT4
    and r3, r5, #0x1
    mul r1, r4, r1
    mla r0, r3, r0, r2
    ldr r0, [r1, r0]
    mov r0, r0, lsr #0x12
    tst r0, #0x1
    beq .L_170
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_118:
    ldr r1, _LIT3
    and r2, r5, #0x1
    mul r3, r2, r1
    mov r0, #0x14
    ldr r2, _LIT4
    mul r0, r4, r0
    add r2, r2, r3
    ldr r1, _LIT5
    ldr ip, [r0, r2]
    add r3, r1, r3
    mov r2, ip, lsr #0x6
    mov r1, ip, lsr #0x2
    and r2, r2, #0x1
    orr r1, r1, ip, lsr #0x1
    ldrh r3, [r0, r3]
    and r1, r1, #0x1
    mvn r2, r2
    mvn r0, r1
    and r1, r3, r2
    tst r1, r0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
.L_170:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_ov002_021bc8c8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00001670
_LIT1: .word 0x000014f9
_LIT2: .word 0x00001836
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022cf1ac
_LIT5: .word data_ov002_022cf1a4
