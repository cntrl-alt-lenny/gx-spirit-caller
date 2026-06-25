; func_020092c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c3f48
        .extern data_02104e5c
        .extern func_02007214
        .extern func_02007224
        .extern func_02020fa4
        .extern func_02090780
        .extern func_020907d8
        .extern func_02094500
        .extern func_0209bee0
        .extern func_0209bef0
        .extern func_0209bfd8
        .extern func_0209c6e8
        .global func_020092c4
        .arm
func_020092c4:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x1c
    mov r6, r0
    mov r4, #0x0
    bl func_0209bfd8
    cmp r0, #0x0
    beq .L_12c
    bl func_02090780
    mov r5, r0
    mvn r0, #0x2
    cmp r5, r0
    beq .L_12c
    mov r0, r5, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_0209bef0
    mov r3, r4
    str r3, [sp]
    str r3, [sp, #0x4]
    mov r0, #0x6
    str r0, [sp, #0x8]
    mov r0, #0x1
    str r0, [sp, #0xc]
    add r1, sp, #0x14
    mov r0, #0x8000
    mov r2, #0x8
    str r3, [sp, #0x10]
    bl func_0209c6e8
    cmp r0, #0x0
    ldr r0, _LIT0
    moveq r2, #0x1
    ldr r1, [r0, #0x4]
    movne r2, r4
    orrs r1, r1, r2
    str r1, [r0, #0x4]
    ldreq r1, [sp, #0x14]
    ldreq r0, _LIT1
    cmpeq r1, r0
    bne .L_fc
    mov r3, #0x0
    str r3, [sp]
    str r3, [sp, #0x4]
    mov r0, #0x6
    str r0, [sp, #0x8]
    mov r0, #0x1
    str r0, [sp, #0xc]
    ldr r0, _LIT2
    ldr r2, _LIT3
    mov r1, r6
    str r3, [sp, #0x10]
    bl func_0209c6e8
    cmp r0, #0x0
    ldr r2, _LIT0
    moveq ip, #0x1
    ldr r3, [r2, #0x4]
    movne ip, #0x0
    orr r3, r3, ip
    ldr r1, _LIT3
    mov r0, r6
    str r3, [r2, #0x4]
    bl func_02007224
    ldr r1, [sp, #0x18]
    cmp r1, r0
    moveq r4, #0x1
.L_fc:
    cmp r4, #0x0
    bne .L_114
    ldr r2, _LIT3
    mov r0, r6
    mov r1, #0x0
    bl func_02094500
.L_114:
    mov r0, r5, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_0209bee0
    mov r0, r5, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_020907d8
.L_12c:
    bl func_02007214
    cmp r0, #0x0
    beq .L_13c
    bl func_02020fa4
.L_13c:
    ldr r0, _LIT4
    mov r3, #0x0
    ldr r1, [r0]
.L_148:
    ldr r2, [r6, #0x48]
    cmp r2, #0x0
    beq .L_164
    ldr r2, [r6, #0xc]
    cmp r2, r1
    movhi r1, r2
    strhi r2, [r0]
.L_164:
    add r3, r3, #0x1
    cmp r3, #0x3c
    add r6, r6, #0x54
    blt .L_148
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    bne .L_194
    cmp r4, #0x0
    addne sp, sp, #0x1c
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, pc}
.L_194:
    mov r0, #0x0
    add sp, sp, #0x1c
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_02104e5c
_LIT1: .word 0x59474652
_LIT2: .word 0x00008008
_LIT3: .word 0x000013b0
_LIT4: .word data_020c3f48
