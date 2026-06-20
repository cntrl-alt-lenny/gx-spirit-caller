; func_ov002_0229979c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd708
        .extern data_ov002_022cf1a2
        .extern data_ov002_022cf1a4
        .extern func_ov002_021bb068
        .extern func_ov002_021bd948
        .extern func_ov002_021bdc94
        .extern func_ov002_021c84e0
        .extern func_ov002_021d6870
        .extern func_ov002_0227ab9c
        .extern func_ov002_0227b37c
        .global func_ov002_0229979c
        .arm
func_ov002_0229979c:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r5, r0
    mov r4, r1
    cmp r2, #0x0
    mvn r6, #0x0
    bne .L_2c
    ldr r0, _LIT0
    ldr r0, [r0, r4, lsl #0x2]
    cmp r0, #0x0
    movne r6, #0x0
.L_2c:
    mvn r0, #0x0
    cmp r6, r0
    bne .L_48
    mov r0, r5
    mov r1, r4
    bl func_ov002_0227b37c
    mov r6, r0
.L_48:
    mov r0, r5
    mov r1, r4
    bl func_ov002_021bd948
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    cmp r6, #0x0
    bne .L_128
    ldr r1, _LIT1
    and r2, r5, #0x1
    mov r0, #0x14
    mul r3, r2, r1
    ldr r1, _LIT2
    mul r2, r4, r0
    add r0, r1, r3
    ldrh r0, [r2, r0]
    cmp r0, #0x0
    bne .L_c0
    mov r0, r5
    mov r1, r4
    bl func_ov002_021bdc94
    cmp r0, #0x0
    beq .L_1c0
    mov r0, r5
    mov r1, r4
    bl func_ov002_0227ab9c
    add sp, sp, #0x8
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_c0:
    ldr r0, _LIT3
    add r0, r0, r3
    ldrh r0, [r2, r0]
    cmp r0, #0x0
    beq .L_1c0
    ldr r0, _LIT4
    bl func_ov002_021bb068
    cmp r0, #0x0
    beq .L_100
    mov r0, r5
    mov r1, r4
    bl func_ov002_021c84e0
    cmp r0, #0x4
    addge sp, sp, #0x8
    movge r0, #0x0
    ldmgeia sp!, {r4, r5, r6, pc}
.L_100:
    mov r2, #0x0
    str r2, [sp]
    mov r0, r5
    mov r1, r4
    mov r3, r2
    str r2, [sp, #0x4]
    bl func_ov002_021d6870
    add sp, sp, #0x8
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_128:
    cmp r6, #0x1
    bne .L_1c0
    ldr r0, _LIT1
    mov r1, #0x14
    ldr r2, _LIT3
    and r3, r5, #0x1
    mul r1, r4, r1
    mla r0, r3, r0, r2
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    bne .L_1c0
    ldr r0, _LIT5
    bl func_ov002_021bb068
    cmp r0, #0x0
    addne sp, sp, #0x8
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT6
    bl func_ov002_021bb068
    cmp r0, #0x0
    beq .L_198
    mov r0, r5
    mov r1, r4
    bl func_ov002_021c84e0
    cmp r0, #0x3
    addle sp, sp, #0x8
    movle r0, #0x0
    ldmleia sp!, {r4, r5, r6, pc}
.L_198:
    mov r2, #0x0
    str r2, [sp]
    mov r0, r5
    mov r1, r4
    mov r3, r2
    str r2, [sp, #0x4]
    bl func_ov002_021d6870
    add sp, sp, #0x8
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_1c0:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cd708
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf1a4
_LIT3: .word data_ov002_022cf1a2
_LIT4: .word 0x000017a6
_LIT5: .word 0x000015fb
_LIT6: .word 0x0000197b
