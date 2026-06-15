; func_0204ed50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020459f0
        .extern func_020498f0
        .extern func_02049990
        .extern func_0204ead0
        .extern func_0204ec90
        .extern func_02062510
        .extern func_02062528
        .extern func_0206896c
        .extern func_02068990
        .extern func_02068998
        .extern func_020689b8
        .extern func_020689dc
        .extern func_02068ca0
        .extern func_0206eb08
        .global func_0204ed50
        .arm
func_0204ed50:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x14
    mov r4, r0
    mov r8, r1
    mov r7, r2
    bl func_020498f0
    cmp r4, #0x0
    ldrb r6, [r0, #0x14]
    mov r4, #0x0
    bne .L_1b2c
    bl func_020498f0
    mov r5, r0
    bl func_020498f0
    add r1, r0, #0x100
    ldr r2, [r5, #0x200]
    ldr r0, _LIT0
    ldrh r1, [r1, #0x7e]
    and r2, r2, r0
    mov r0, r7
    orr r8, r2, r1, lsl #0x10
    bl func_02068998
    cmp r0, #0x0
    beq .L_19a4
    mov r0, r7
    bl func_020689dc
    mov r5, r0
    bl func_020498f0
    ldr r0, [r0, #0xe4]
    bl func_02068ca0
    cmp r5, r0
    movne r5, #0x1
    bne .L_1a2c
    bl func_020498f0
    mov r5, r0
    mov r0, r7
    bl func_02068990
    add r1, r5, r6, lsl #0x2
    str r0, [r1, #0x210]
    bl func_020498f0
    mov r5, r0
    mov r0, r7
    bl func_0206896c
    add r1, r5, r6, lsl #0x1
    add r1, r1, #0x200
    strh r0, [r1, #0x90]
    mov r5, r4
    b .L_1a2c
.L_19a4:
    bl func_0206eb08
    mov r0, r0, lsl #0x10
    ldr r1, _LIT0
    ldr r2, _LIT1
    and r1, r1, r0, lsr #0x10
    cmp r1, r2
    mov r0, r0, lsr #0x10
    beq .L_19ec
    and r1, r0, #0xff
    cmp r1, #0xac
    bne .L_19e4
    and r0, r0, #0xff00
    cmp r0, #0x1000
    bcc .L_19e4
    cmp r0, #0x1f00
    bls .L_19ec
.L_19e4:
    cmp r1, #0x10
    bne .L_19f4
.L_19ec:
    mov r5, #0x1
    b .L_1a2c
.L_19f4:
    bl func_020498f0
    mov r5, r0
    mov r0, r7
    bl func_020689dc
    add r1, r5, r6, lsl #0x2
    str r0, [r1, #0x210]
    bl func_020498f0
    mov r5, r0
    mov r0, r7
    bl func_020689b8
    add r1, r5, r6, lsl #0x1
    add r1, r1, #0x200
    strh r0, [r1, #0x90]
    mov r5, #0x0
.L_1a2c:
    cmp r5, #0x0
    beq .L_1a58
    bl func_020498f0
    mov r6, r0
    mov r0, #0x10000
    bl func_020459f0
    add r1, r6, #0x100
    strh r0, [r1, #0x7e]
    bl func_020498f0
    str r8, [r0, #0x19c]
    b .L_1ae4
.L_1a58:
    bl func_0206eb08
    str r0, [sp, #0x8]
    bl func_020498f0
    ldr r0, [r0, #0x4]
    ldr r0, [r0]
    bl func_02062528
    str r0, [sp, #0xc]
    bl func_020498f0
    mov r9, r0
    mov r0, r7
    bl func_020689dc
    mov r8, r0
    mov r0, r7
    bl func_020689b8
    add r1, r9, r6, lsl #0x2
    add r6, sp, #0x8
    mov r3, r0
    mov r0, #0x2
    str r6, [sp]
    str r0, [sp, #0x4]
    ldr r1, [r1, #0xf4]
    mov r2, r8
    mov r0, #0x6
    bl func_0204ead0
    mov r6, r0
    bl func_020498f0
    mov r1, #0x0
    cmp r6, #0x0
    strb r1, [r0, #0x3cd]
    addne sp, sp, #0x14
    movne r0, #0x2
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, pc}
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x19c]
.L_1ae4:
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x194]
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x195]
    bl func_020498f0
    mov r6, r0
    mov r0, r7
    bl func_020689b8
    add r1, r6, #0x100
    strh r0, [r1, #0x96]
    bl func_020498f0
    mov r6, r0
    mov r0, r7
    bl func_020689dc
    str r0, [r6, #0x198]
    b .L_1b6c
.L_1b2c:
    bl func_020498f0
    mov r1, #0x1
    strb r1, [r0, #0x194]
    bl func_020498f0
    mov r1, r4
    strb r1, [r0, #0x195]
    bl func_020498f0
    add r0, r0, #0x100
    mov r1, r4
    strh r1, [r0, #0x96]
    bl func_020498f0
    mov r1, r4
    str r1, [r0, #0x198]
    bl func_020498f0
    str r8, [r0, #0x19c]
    mov r5, #0x1
.L_1b6c:
    cmp r5, #0x0
    beq .L_1b88
    bl func_020498f0
    add r0, r0, #0x194
    bl func_0204ec90
    mov r4, r0
    b .L_1bc4
.L_1b88:
    bl func_020498f0
    ldr r0, [r0, #0x4]
    ldr r0, [r0]
    bl func_02062510
    mov r5, r0
    bl func_020498f0
    add r3, r0, #0x194
    mov r0, #0x0
    mov r1, r5
    mov r2, r0
    bl func_02049990
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x18c]
    str r1, [r0, #0x190]
.L_1bc4:
    mov r0, r4
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x0000ffff
_LIT1: .word 0x0000a8c0
