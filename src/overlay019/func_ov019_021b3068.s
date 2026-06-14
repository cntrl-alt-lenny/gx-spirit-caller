; func_ov019_021b3068 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern data_ov000_021b1d4c
        .extern data_ov019_021b5ba0
        .extern data_ov019_021b5baa
        .extern data_ov019_021b6920
        .extern func_02019124
        .extern func_ov005_021aaea8
        .extern func_ov019_021b2728
        .extern func_ov019_021b28dc
        .extern func_ov019_021b2a48
        .extern func_ov019_021b3f00
        .extern func_ov019_021b3f34
        .extern func_ov019_021b5948
        .global func_ov019_021b3068
        .arm
func_ov019_021b3068:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    mov sl, r0
    ldr r0, _LIT0
    ldr r1, [r0, #0x8]
    cmp r1, #0x0
    beq .L_20
    bl func_ov019_021b5948
.L_20:
    ldr r5, _LIT1
    mov r4, #0x0
    mov r0, r5
    bl func_ov019_021b2728
    cmp r0, #0x0
    mvn r1, #0x0
    movne r4, #0x1
    str r1, [sp]
    str r1, [sp, #0x4]
    mov r0, sl
    mov r2, r4
    mov r3, r5
    mov r1, #0xe
    bl func_ov019_021b3f34
    ldr r0, [sl, #0x8]
    cmp r0, #0x0
    ble .L_12c
    ldr r2, [sl, #0xc]
    ldr r1, [sl, #0x10]
    mov r0, #0xc
    add r2, r2, r1
    mla r1, r2, r0, sl
    ldr r0, [r1, #0x18]
    ldr r4, _LIT2
    cmp r0, #0x0
    ldrneh r0, [r1, #0x1c]
    mov r5, #0x0
    cmpne r0, #0x0
    beq .L_c8
    bl func_02019124
    cmp r0, #0xff
    bne .L_b4
    bl GetSystemWork
    ldr r0, [r0, #0x900]
    mov r0, r0, lsl #0x7
    movs r0, r0, lsr #0x1f
    beq .L_c8
.L_b4:
    mov r0, r4
    mov r5, #0x1
    bl func_ov019_021b2728
    cmp r0, #0x0
    movne r5, #0x2
.L_c8:
    mvn r1, #0x0
    str r1, [sp]
    str r1, [sp, #0x4]
    mov r0, sl
    mov r2, r5
    mov r3, r4
    mov r1, #0xc
    bl func_ov019_021b3f34
    ldr r0, [sl, #0x434]
    ldr r1, [sl, #0x10]
    cmp r0, #0x0
    mov r0, #0x18
    mul r0, r1, r0
    add r0, r0, #0x8
    movgt r2, #0x1
    str r0, [sp]
    mov r1, #0x2
    str r1, [sp, #0x4]
    mov r4, #0x1
    mvnle r2, #0x0
    mov r0, sl
    mov r1, #0x0
    mov r3, #0x84
    str r4, [sp, #0x8]
    bl func_ov019_021b3f00
.L_12c:
    ldr r0, [sl, #0x434]
    cmp r0, #0x0
    ble .L_168
    ldr r3, _LIT1
    cmp r0, #0x2
    rsb r2, r0, #0x2
    mov r0, #0xa
    mla r3, r2, r0, r3
    moveq r1, #0xb
    mvn r2, #0x0
    str r2, [sp]
    movne r1, #0xd
    mov r0, sl
    str r2, [sp, #0x4]
    bl func_ov019_021b3f34
.L_168:
    ldr r0, [sl, #0x8]
    ldr r4, _LIT3
    cmp r0, #0x6
    ble .L_224
    ldr r0, [r4, #0x18]
    mov r1, #0x2
    cmp r0, #0x2
    mov r0, #0x8
    str r0, [sp]
    mov r2, #0x0
    str r1, [sp, #0x4]
    mov r3, #0x1
    str r3, [sp, #0x8]
    moveq r2, #0x1
    mov r0, sl
    mov r3, #0xe8
    bl func_ov019_021b3f00
    ldr r0, [r4, #0x18]
    mov r2, #0x0
    cmp r0, #0x3
    mov r0, #0x83
    str r0, [sp]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r1, #0x1
    str r1, [sp, #0x8]
    moveq r2, #0x1
    mov r0, sl
    mov r1, #0x3
    mov r3, #0xe8
    bl func_ov019_021b3f00
    ldr r0, [r4, #0x18]
    mov r5, #0x0
    cmp r0, #0x1
    mov r0, r4
    moveq r5, #0x1
    bl func_ov005_021aaea8
    str r0, [sp]
    mov r1, #0x2
    str r1, [sp, #0x4]
    mov r4, #0x1
    mov r0, sl
    mov r2, r5
    mov r1, #0x4
    mov r3, #0xe8
    str r4, [sp, #0x8]
    bl func_ov019_021b3f00
.L_224:
    mov r5, #0x2
    mov r9, #0x0
    mov r7, #0xd
    mov r8, #0xc
    mov r4, #0xa0
    mov fp, r5
    b .L_3f0
.L_240:
    ldr r0, [sl, #0x10]
    mov r6, #0x0
    cmp r9, r0
    ldr r0, [sl, #0xc]
    moveq r6, #0x2
    add r1, r0, r9
    mov r0, #0xc
    mla r2, r1, r0, sl
    ldr r0, [r2, #0x18]
    cmp r0, #0x0
    beq .L_2a8
    ldrh r0, [r2, #0x1c]
    mov r1, #0x8
    cmp r0, #0x0
    beq .L_288
    mov r1, #0x9
    cmp r0, #0x10
    movcs r1, #0xa
.L_288:
    str r7, [sp]
    str r5, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    mov r0, sl
    mov r2, #0x0
    mov r3, #0x7
    bl func_ov019_021b3f00
.L_2a8:
    str r4, [sp]
    ldr r3, [sl, #0xc]
    mov r2, r6, lsl #0x10
    add ip, r3, r9
    mov r3, r2, lsr #0x10
    mov r2, ip, lsr #0x1f
    rsb ip, r2, ip, lsl #0x1d
    add ip, r2, ip, ror #0x1d
    mov r2, #0xc
    mul r2, ip, r2
    add r2, r2, #0x348
    mov r2, r2, lsl #0x10
    mov r0, #0x15
    mov r1, r7
    mov r2, r2, lsr #0x10
    bl func_ov019_021b2a48
    stmia sp, {r7, fp}
    mov r0, #0x0
    str r0, [sp, #0x8]
    mov r0, sl
    mov r1, #0x7
    mov r2, #0x0
    mov r3, #0xd3
    bl func_ov019_021b3f00
    str r6, [sp]
    ldr r3, [sl, #0xc]
    mov r0, #0xd3
    add r3, r3, r9
    mov ip, r3, lsr #0x1f
    rsb r3, ip, r3, lsl #0x1d
    add r3, ip, r3, ror #0x1d
    add r3, r3, r3, lsl #0x1
    mov r1, r8
    mov r2, #0x2
    add r3, r3, #0x2
    bl func_ov019_021b28dc
    str r7, [sp]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    mov r0, sl
    mov r1, #0x6
    mov r2, #0x0
    mov r3, #0xb9
    bl func_ov019_021b3f00
    str r6, [sp]
    ldr r3, [sl, #0xc]
    mov r0, #0xb9
    add r3, r3, r9
    mov ip, r3, lsr #0x1f
    rsb r3, ip, r3, lsl #0x1d
    add r3, ip, r3, ror #0x1d
    add r3, r3, r3, lsl #0x1
    mov r1, r8
    mov r2, #0x2
    add r3, r3, #0x1
    bl func_ov019_021b28dc
    str r7, [sp]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    mov r0, sl
    mov r1, #0x5
    mov r2, #0x0
    mov r3, #0x9f
    bl func_ov019_021b3f00
    str r6, [sp]
    ldr r3, [sl, #0xc]
    mov r0, #0x9f
    add r3, r3, r9
    mov r6, r3, lsr #0x1f
    rsb r3, r6, r3, lsl #0x1d
    add r3, r6, r3, ror #0x1d
    mov r1, r8
    mov r2, #0x2
    add r3, r3, r3, lsl #0x1
    bl func_ov019_021b28dc
    add r7, r7, #0x18
    add r8, r8, #0x18
    add r9, r9, #0x1
.L_3f0:
    ldr r0, [sl, #0x8]
    cmp r0, #0x6
    movgt r0, #0x6
    cmp r9, r0
    blt .L_240
    mov r0, #0x1
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov019_021b6920
_LIT1: .word data_ov019_021b5ba0
_LIT2: .word data_ov019_021b5baa
_LIT3: .word data_ov000_021b1d4c
