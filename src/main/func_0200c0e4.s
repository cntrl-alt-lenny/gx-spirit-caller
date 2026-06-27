; func_0200c0e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02186ae8
        .extern func_0200fa90
        .extern List_Unlink
        .extern func_0200fc78
        .extern func_0209015c
        .extern func_020901cc
        .extern func_02090330
        .extern func_02092904
        .global func_0200c0e4
        .arm
func_0200c0e4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r0, _LIT0
    ldr r7, [r0, #0x14]
    cmp r7, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r1, [r0, #0xc]
    mov r0, #0x0
    cmp r1, #0x0
    ble .L_238
.L_118:
    ldr r2, [r7, #0x27c]
    cmp r2, #0x0
    bne .L_228
    ldr r3, [r7, #0x60]
    mov r2, r3, lsl #0x1e
    movs r2, r2, lsr #0x1f
    bne .L_228
    mov r2, r3, lsl #0x1f
    movs r2, r2, lsr #0x1f
    beq .L_228
    mov r2, r3, lsl #0x1d
    movs r2, r2, lsr #0x1f
    beq .L_228
    ldr r2, [r7, #0x7c]
    mov r2, r2, lsl #0x5
    movs r2, r2, lsr #0x1f
    beq .L_228
    ldr r2, [r7, #0x260]
    ldr r8, [r7, #0x18]
    ldr r4, [r7, #0x25c]
    add r5, r8, r2, lsl #0x5
    ldr r0, [r5, #0x8]
    ldr r1, [r5, #0xc]
    mov r6, r2, lsl #0x5
    bl func_02092904
    bl func_02090330
    ldr r0, [r5, #0x8]
    ldr r2, [r5, #0xc]
    mov r1, r4
    bl func_020901cc
    ldrsb r0, [r8, r6]
    cmp r0, #0x5
    bne .L_1b0
    mov r1, r4, lsr #0x1
    ldr r0, [r5, #0x10]
    ldr r2, [r5, #0x14]
    add r1, r1, #0x20000
    bl func_020901cc
.L_1b0:
    bl func_0209015c
    mov r0, r5
    bl func_0200fc78
    mov r6, r0
    ldr r1, [r6, #0xc]
    ldr r0, _LIT1
    and r0, r1, r0
    orr r0, r0, r4, lsl #0xc
    str r0, [r6, #0xc]
    str r4, [r5, #0x18]
    ldr r0, [r6, #0x4]
    cmp r0, #0x0
    moveq r4, #0x0
    beq .L_200
    mov r4, r6
    beq .L_200
.L_1f0:
    ldr r4, [r4, #0x4]
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    bne .L_1f0
.L_200:
    mov r0, r6
    bl List_Unlink
    mov r0, r6
    mov r1, r4
    bl func_0200fa90
    ldr r1, [r7, #0x7c]
    mov r0, #0x1
    bic r1, r1, #0x4000000
    str r1, [r7, #0x7c]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_228:
    add r0, r0, #0x1
    cmp r0, r1
    add r7, r7, #0x284
    blt .L_118
.L_238:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_02186ae8
_LIT1: .word 0x00000fff
