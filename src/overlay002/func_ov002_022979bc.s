; func_ov002_022979bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern func_ov002_021bae7c
        .extern func_ov002_021c3ae4
        .global func_ov002_022979bc
        .arm
func_ov002_022979bc:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r1
    mov r4, #0x0
    ldr r1, _LIT0
    sub r2, r4, #0x1
    mov r7, r0
    bl func_ov002_021bae7c
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r1, _LIT1
    mov r0, r7
    mvn r2, #0x0
    bl func_ov002_021bae7c
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r1, _LIT2
    mov r0, r7
    mvn r2, #0x0
    bl func_ov002_021bae7c
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, _LIT3
    and r1, r7, #0x1
    mul r5, r1, r0
    ldr r0, _LIT4
    mov r2, r4
    add r3, r0, r5
    ldr r0, _LIT5
    add ip, r3, #0x30
.L_8e4:
    ldrh r1, [r3, #0x38]
    cmp r1, #0x0
    bne .L_90c
    ldr r1, [ip]
    mov r1, r1, lsl #0x13
    mov r1, r1, lsr #0x13
    cmp r1, r0
    bne .L_90c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_90c:
    add r2, r2, #0x1
    cmp r2, #0x5
    add r3, r3, #0x14
    add ip, ip, #0x14
    blt .L_8e4
    cmp r6, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, _LIT6
    ldr r0, [r0, r5]
    cmp r0, #0x7
    movcs r0, #0x1
    ldmcsia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r1, _LIT7
    mov r0, r7
    bl func_ov002_021c3ae4
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, _LIT4
    mov r3, #0x5
    add r0, r0, r5
    add r1, r0, #0x94
    add r2, r0, #0x64
.L_96c:
    ldr r0, [r1]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_998
    ldrh r0, [r2, #0x38]
    cmp r0, #0x0
    bne .L_998
    ldr r0, [r2, #0x40]
    mov r0, r0, lsr #0x14
    tst r0, #0x1
    addne r4, r4, #0x1
.L_998:
    add r3, r3, #0x1
    cmp r3, #0xa
    add r1, r1, #0x14
    add r2, r2, #0x14
    blt .L_96c
    cmp r4, #0x2
    movlt r0, #0x1
    movge r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x0000145d
_LIT1: .word 0x0000146f
_LIT2: .word 0x00001a6f
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022cf16c
_LIT5: .word 0x000011f5
_LIT6: .word data_ov002_022cf178
_LIT7: .word 0x000019a3
