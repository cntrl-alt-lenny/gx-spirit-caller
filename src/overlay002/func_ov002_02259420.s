; func_ov002_02259420 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd300
        .extern data_ov002_022cd73c
        .extern data_ov002_022ce288
        .extern data_ov002_022ce588
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern data_ov002_022d016c
        .extern func_ov002_021b9ecc
        .extern func_ov002_02258690
        .extern func_ov002_022589c0
        .extern func_ov002_02258d4c
        .extern func_ov002_02259058
        .extern func_ov002_02259124
        .extern func_ov002_022591e4
        .extern func_ov002_02259278
        .extern func_ov002_0226eb5c
        .global func_ov002_02259420
        .arm
func_ov002_02259420:
    stmdb sp!, {r4, r5, r6, lr}
    ldr ip, _LIT0
    mov r5, r0
    ldr r6, [ip, #0xd4c]
    mov r4, r1
    cmp r6, #0x0
    mov r3, r2
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r6, [ip, #0xd48]
    cmp r6, #0xa
    addls pc, pc, r6, lsl #0x2
    b .L_32c
    b .L_32c
    b .L_60
    b .L_b0
    b .L_b0
    b .L_200
    b .L_208
    b .L_230
    b .L_2a4
    b .L_2ec
    b .L_2a4
    b .L_2ec
.L_60:
    sub r2, r4, #0xc
    cmp r2, #0x3
    addls pc, pc, r2, lsl #0x2
    b .L_32c
    b .L_80
    b .L_80
    b .L_80
    b .L_80
.L_80:
    bl func_ov002_022591e4
    mov r6, r0
    mov r0, r5
    mov r1, r4
    bl func_ov002_02259278
    ldr r1, _LIT1
    orr r0, r6, r0
    ldr r1, [r1, #0x4]
    cmp r5, r1
    cmpeq r4, #0xd
    orreq r0, r0, #0x1000
    ldmia sp!, {r4, r5, r6, pc}
.L_b0:
    cmp r4, #0xf
    addls pc, pc, r4, lsl #0x2
    b .L_32c
    b .L_fc
    b .L_fc
    b .L_fc
    b .L_fc
    b .L_fc
    b .L_144
    b .L_144
    b .L_144
    b .L_144
    b .L_144
    b .L_144
    b .L_18c
    b .L_1d0
    b .L_1d0
    b .L_1d0
    b .L_1d0
.L_fc:
    ldr r1, _LIT2
    ldr r2, _LIT3
    and r6, r5, #0x1
    mla r2, r6, r1, r2
    add r4, r4, r3
    mov r1, #0x14
    mla r1, r4, r1, r2
    ldr r1, [r1, #0x30]
    mov r1, r1, lsl #0x13
    movs r1, r1, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r1, r4
    bl func_ov002_021b9ecc
    mov r1, r5
    mov r2, r4
    bl func_ov002_022589c0
    ldmia sp!, {r4, r5, r6, pc}
.L_144:
    ldr r1, _LIT2
    ldr r2, _LIT3
    and r6, r5, #0x1
    mla r2, r6, r1, r2
    add r4, r4, r3
    mov r1, #0x14
    mla r1, r4, r1, r2
    ldr r1, [r1, #0x30]
    mov r1, r1, lsl #0x13
    movs r1, r1, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r1, r4
    bl func_ov002_021b9ecc
    mov r1, r5
    mov r2, r4
    bl func_ov002_02258d4c
    ldmia sp!, {r4, r5, r6, pc}
.L_18c:
    ldr r0, _LIT2
    and r1, r5, #0x1
    mul r4, r1, r0
    ldr r0, _LIT4
    ldr r0, [r0, r4]
    cmp r3, r0
    movcs r0, #0x0
    ldmcsia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT3
    mov r1, r5
    add r0, r0, r4
    add r0, r0, r3, lsl #0x2
    ldr r0, [r0, #0x120]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_ov002_02258690
    ldmia sp!, {r4, r5, r6, pc}
.L_1d0:
    bl func_ov002_022591e4
    mov r6, r0
    mov r0, r5
    mov r1, r4
    bl func_ov002_02259278
    ldr r1, _LIT1
    orr r0, r6, r0
    ldr r1, [r1, #0x4]
    cmp r5, r1
    cmpeq r4, #0xd
    orreq r0, r0, #0x400
    ldmia sp!, {r4, r5, r6, pc}
.L_200:
    bl func_ov002_02259058
    ldmia sp!, {r4, r5, r6, pc}
.L_208:
    ldr r0, _LIT5
    ldr r2, _LIT6
    ldr r1, [r0, #0x484]
    mov r0, #0x18
    sub r1, r1, #0x1
    mla r0, r1, r0, r2
    mov r1, r5
    mov r2, r4
    bl func_ov002_02259124
    ldmia sp!, {r4, r5, r6, pc}
.L_230:
    ldr r1, _LIT1
    ldr r1, [r1, #0x4]
    cmp r5, r1
    cmpeq r4, #0xb
    bne .L_32c
    ldr r1, _LIT2
    and r2, r5, #0x1
    mul r4, r2, r1
    ldr r1, _LIT4
    ldr r1, [r1, r4]
    cmp r3, r1
    movcs r0, #0x0
    ldmcsia sp!, {r4, r5, r6, pc}
    ldr r2, _LIT3
    ldr r1, _LIT7
    add r2, r2, r4
    add r2, r2, #0x120
    ldr r4, [r2, r3, lsl #0x2]
    ldrh r1, [r1, #0x16]
    mov r2, r4, lsl #0x2
    mov r3, r2, lsr #0x18
    mov r2, r1, lsl #0x1a
    mov r1, r3, lsl #0x1
    mov r4, r4, lsl #0x12
    mov r3, r2, lsr #0x1e
    add r1, r1, r4, lsr #0x1f
    mov r2, #0x1
    bl func_ov002_0226eb5c
    ldmia sp!, {r4, r5, r6, pc}
.L_2a4:
    ldr r6, [ip, #0xd84]
    cmp r6, #0x0
    beq .L_32c
    cmp r4, #0xb
    bne .L_2d8
    ldr r0, _LIT2
    and r1, r5, #0x1
    mul r2, r1, r0
    ldr r0, _LIT4
    ldr r0, [r0, r2]
    cmp r3, r0
    movcs r0, #0x0
    ldmcsia sp!, {r4, r5, r6, pc}
.L_2d8:
    mov r0, r5
    mov r1, r4
    mov r2, r3
    blx r6
    ldmia sp!, {r4, r5, r6, pc}
.L_2ec:
    ldr ip, [ip, #0xd84]
    cmp ip, #0x0
    beq .L_32c
    add r2, r4, r3
    cmp r2, #0xa
    bgt .L_32c
    ldr r0, _LIT5
    mov r1, r5
    ldr r0, [r0, #0x48c]
    blx ip
    cmp r0, #0x0
    movne r0, #0x800
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT0
    mov r1, #0x9
    str r1, [r0, #0xd80]
.L_32c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word data_ov002_022cd73c
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf16c
_LIT4: .word data_ov002_022cf178
_LIT5: .word data_ov002_022ce288
_LIT6: .word data_ov002_022ce588
_LIT7: .word data_ov002_022cd300
