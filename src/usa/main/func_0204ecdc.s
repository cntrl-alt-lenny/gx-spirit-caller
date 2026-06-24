; func_0204ecdc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02045948
        .extern func_0204987c
        .extern func_0204991c
        .extern func_0204ea5c
        .extern func_0204ec1c
        .extern func_0206249c
        .extern func_020624b4
        .extern func_020688f8
        .extern func_0206891c
        .extern func_02068924
        .extern func_02068944
        .extern func_02068968
        .extern func_02068c2c
        .extern func_0206ea94
        .global func_0204ecdc
        .arm
func_0204ecdc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x14
    mov r4, r0
    mov r8, r1
    mov r7, r2
    bl func_0204987c
    cmp r4, #0x0
    ldrb r6, [r0, #0x14]
    mov r4, #0x0
    bne .L_244
    bl func_0204987c
    mov r5, r0
    bl func_0204987c
    add r1, r0, #0x100
    ldr r2, [r5, #0x1f8]
    ldr r0, _LIT0
    ldrh r1, [r1, #0x76]
    and r2, r2, r0
    mov r0, r7
    orr r8, r2, r1, lsl #0x10
    bl func_02068924
    cmp r0, #0x0
    beq .L_bc
    mov r0, r7
    bl func_02068968
    mov r5, r0
    bl func_0204987c
    ldr r0, [r0, #0xe4]
    bl func_02068c2c
    cmp r5, r0
    movne r5, #0x1
    bne .L_144
    bl func_0204987c
    mov r5, r0
    mov r0, r7
    bl func_0206891c
    add r1, r5, r6, lsl #0x2
    str r0, [r1, #0x208]
    bl func_0204987c
    mov r5, r0
    mov r0, r7
    bl func_020688f8
    add r1, r5, r6, lsl #0x1
    add r1, r1, #0x200
    strh r0, [r1, #0x88]
    mov r5, r4
    b .L_144
.L_bc:
    bl func_0206ea94
    mov r0, r0, lsl #0x10
    ldr r1, _LIT0
    ldr r2, _LIT1
    and r1, r1, r0, lsr #0x10
    cmp r1, r2
    mov r0, r0, lsr #0x10
    beq .L_104
    and r1, r0, #0xff
    cmp r1, #0xac
    bne .L_fc
    and r0, r0, #0xff00
    cmp r0, #0x1000
    bcc .L_fc
    cmp r0, #0x1f00
    bls .L_104
.L_fc:
    cmp r1, #0x10
    bne .L_10c
.L_104:
    mov r5, #0x1
    b .L_144
.L_10c:
    bl func_0204987c
    mov r5, r0
    mov r0, r7
    bl func_02068968
    add r1, r5, r6, lsl #0x2
    str r0, [r1, #0x208]
    bl func_0204987c
    mov r5, r0
    mov r0, r7
    bl func_02068944
    add r1, r5, r6, lsl #0x1
    add r1, r1, #0x200
    strh r0, [r1, #0x88]
    mov r5, #0x0
.L_144:
    cmp r5, #0x0
    beq .L_170
    bl func_0204987c
    mov r6, r0
    mov r0, #0x10000
    bl func_02045948
    add r1, r6, #0x100
    strh r0, [r1, #0x76]
    bl func_0204987c
    str r8, [r0, #0x194]
    b .L_1fc
.L_170:
    bl func_0206ea94
    str r0, [sp, #0x8]
    bl func_0204987c
    ldr r0, [r0, #0x4]
    ldr r0, [r0]
    bl func_020624b4
    str r0, [sp, #0xc]
    bl func_0204987c
    mov r9, r0
    mov r0, r7
    bl func_02068968
    mov r8, r0
    mov r0, r7
    bl func_02068944
    add r1, r9, r6, lsl #0x2
    add r6, sp, #0x8
    mov r3, r0
    mov r0, #0x2
    str r6, [sp]
    str r0, [sp, #0x4]
    ldr r1, [r1, #0xf4]
    mov r2, r8
    mov r0, #0x6
    bl func_0204ea5c
    mov r6, r0
    bl func_0204987c
    mov r1, #0x0
    cmp r6, #0x0
    strb r1, [r0, #0x3c5]
    addne sp, sp, #0x14
    movne r0, #0x2
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, pc}
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x194]
.L_1fc:
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x18c]
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x18d]
    bl func_0204987c
    mov r6, r0
    mov r0, r7
    bl func_02068944
    add r1, r6, #0x100
    strh r0, [r1, #0x8e]
    bl func_0204987c
    mov r6, r0
    mov r0, r7
    bl func_02068968
    str r0, [r6, #0x190]
    b .L_284
.L_244:
    bl func_0204987c
    mov r1, #0x1
    strb r1, [r0, #0x18c]
    bl func_0204987c
    mov r1, r4
    strb r1, [r0, #0x18d]
    bl func_0204987c
    add r0, r0, #0x100
    mov r1, r4
    strh r1, [r0, #0x8e]
    bl func_0204987c
    mov r1, r4
    str r1, [r0, #0x190]
    bl func_0204987c
    str r8, [r0, #0x194]
    mov r5, #0x1
.L_284:
    cmp r5, #0x0
    beq .L_2a0
    bl func_0204987c
    add r0, r0, #0x18c
    bl func_0204ec1c
    mov r4, r0
    b .L_2dc
.L_2a0:
    bl func_0204987c
    ldr r0, [r0, #0x4]
    ldr r0, [r0]
    bl func_0206249c
    mov r5, r0
    bl func_0204987c
    add r3, r0, #0x18c
    mov r0, #0x0
    mov r1, r5
    mov r2, r0
    bl func_0204991c
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x184]
    str r1, [r0, #0x188]
.L_2dc:
    mov r0, r4
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x0000ffff
_LIT1: .word 0x0000a8c0
