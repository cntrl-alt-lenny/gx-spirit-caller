; func_ov002_021be384 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf1a2
        .extern data_ov002_022cf1a4
        .extern data_ov002_022cf1ac
        .extern func_ov002_021b9ecc
        .extern func_ov002_021bbf50
        .extern func_ov002_021bdde0
        .extern func_ov002_021be4a0
        .global func_ov002_021be384
        .arm
func_ov002_021be384:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl func_ov002_021b9ecc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r1, _LIT0
    and r3, r6, #0x1
    mov r2, #0x14
    mul r1, r3, r1
    ldr r3, _LIT1
    mul r2, r5, r2
    add r3, r3, r1
    ldrh r3, [r2, r3]
    cmp r3, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r3, _LIT2
    add r3, r3, r1
    ldrh r3, [r2, r3]
    cmp r3, #0x0
    beq .L_d8
    ldr r3, _LIT3
    cmp r0, r3
    beq .L_7c
    ldr r3, _LIT4
    cmp r0, r3
    beq .L_9c
    b .L_d0
.L_7c:
    ldr r0, _LIT5
    add r0, r0, r1
    ldr r0, [r2, r0]
    mov r0, r0, lsr #0x6
    tst r0, #0x1
    beq .L_d8
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_9c:
    ldr r0, _LIT5
    add r0, r0, r1
    ldr r0, [r2, r0]
    mov r0, r0, lsr #0x6
    tst r0, #0x1
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    rsb r0, r6, #0x1
    bl func_ov002_021bbf50
    cmp r0, #0x0
    beq .L_d8
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_d0:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_d8:
    mov r0, r6
    mov r1, r5
    bl func_ov002_021bdde0
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_ov002_021be4a0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1a4
_LIT2: .word data_ov002_022cf1a2
_LIT3: .word 0x000012b4
_LIT4: .word 0x00001956
_LIT5: .word data_ov002_022cf1ac
