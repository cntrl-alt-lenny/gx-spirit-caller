; func_ov002_021b9dec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern data_ov002_022cf0cc
        .extern func_ov002_021b4040
        .extern func_ov002_021bd77c
        .global func_ov002_021b9dec
        .arm
func_ov002_021b9dec:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r3, _LIT0
    and r4, r0, #0x1
    mov r2, #0x14
    mul r6, r4, r3
    ldr r3, _LIT1
    mul r5, r1, r2
    add r2, r3, r6
    add r2, r2, r5
    ldr r2, [r2, #0x30]
    cmp r1, #0x4
    mov r2, r2, lsl #0x13
    mov r4, r2, lsr #0x13
    bgt .L_140
    ldr r2, _LIT2
    cmp r4, r2
    bne .L_70
    mov r2, r4
    bl func_ov002_021b4040
    mov r4, r0
    mvn r1, #0x0
    cmp r4, r1
    beq .L_68
    bl func_ov002_021bd77c
    cmp r0, #0x0
    beq .L_70
.L_68:
    ldr r0, _LIT2
    ldmia sp!, {r4, r5, r6, pc}
.L_70:
    ldr r1, _LIT3
    cmp r4, r1
    beq .L_8c
    add r0, r1, #0x16
    cmp r4, r0
    beq .L_e8
    b .L_140
.L_8c:
    ldr r2, _LIT4
    ldr r0, _LIT5
    add r2, r2, r6
    ldr ip, [r5, r2]
    add r3, r0, r6
    mov r2, ip, lsr #0x6
    mov r0, ip, lsr #0x2
    and r2, r2, #0x1
    orr r0, r0, ip, lsr #0x1
    and r0, r0, #0x1
    ldrh r3, [r5, r3]
    mvn r2, r2
    mvn r0, r0
    and r2, r3, r2
    tst r2, r0
    beq .L_140
    sub r0, r1, #0xad
    mvn r1, #0x0
    bl func_ov002_021bd77c
    cmp r0, #0x0
    bne .L_140
    ldr r0, _LIT6
    ldmia sp!, {r4, r5, r6, pc}
.L_e8:
    ldr r2, _LIT4
    ldr r0, _LIT5
    add r2, r2, r6
    ldr ip, [r5, r2]
    add r3, r0, r6
    mov r2, ip, lsr #0x6
    mov r0, ip, lsr #0x2
    and r2, r2, #0x1
    orr r0, r0, ip, lsr #0x1
    and r0, r0, #0x1
    ldrh r3, [r5, r3]
    mvn r2, r2
    mvn r0, r0
    and r2, r3, r2
    tst r2, r0
    beq .L_140
    sub r0, r1, #0xb0
    mvn r1, #0x0
    bl func_ov002_021bd77c
    cmp r0, #0x0
    ldreq r0, _LIT7
    ldmeqia sp!, {r4, r5, r6, pc}
.L_140:
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x00001a74
_LIT3: .word 0x000019a6
_LIT4: .word data_ov002_022cf0cc
_LIT5: .word data_ov002_022cf0c4
_LIT6: .word 0x000018f9
_LIT7: .word 0x000018f6
