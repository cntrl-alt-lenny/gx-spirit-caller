; func_ov002_02270bb8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd220
        .extern data_ov002_022cf08c
        .extern func_ov002_021ba024
        .extern func_ov002_021bc1a8
        .extern func_ov002_021bc538
        .extern func_ov002_021c22cc
        .global func_ov002_02270bb8
        .arm
func_ov002_02270bb8:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r3, _LIT0
    mov r5, r0
    ldr r0, [r3]
    add r4, r1, r2
    mov r0, r0, lsl #0x1f
    cmp r5, r0, lsr #0x1f
    mov r0, r0, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    cmp r4, #0x4
    movgt r0, #0x0
    ldmgtia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT1
    ldr r2, _LIT2
    and r3, r5, #0x1
    mla r2, r3, r1, r2
    mov r1, #0x14
    mla r1, r4, r1, r2
    ldr r1, [r1, #0x30]
    mov r1, r1, lsl #0x13
    movs r1, r1, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_ov002_021bc538
    cmp r0, #0x0
    bne .L_9c
    ldr r0, _LIT0
    ldr r0, [r0]
    mov r0, r0, lsl #0x1f
    cmp r5, r0, lsr #0x1f
    bne .L_94
    mov r0, r5
    mov r1, r4
    bl func_ov002_021bc1a8
    cmp r0, #0x0
    bne .L_9c
.L_94:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_9c:
    ldr r1, _LIT0
    ldr r0, _LIT3
    ldr r1, [r1]
    mov r1, r1, lsl #0x9
    mov r1, r1, lsr #0x11
    cmp r1, r0
    beq .L_c8
    ldr r0, _LIT4
    cmp r1, r0
    beq .L_e8
    b .L_11c
.L_c8:
    ldr r2, _LIT5
    mov r0, r5
    mov r1, r4
    bl func_ov002_021ba024
    cmp r0, #0x0
    beq .L_11c
    mov r0, #0x800
    ldmia sp!, {r3, r4, r5, pc}
.L_e8:
    mov r0, r5
    mov r1, r4
    bl func_ov002_021c22cc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r2, _LIT6
    mov r0, r5
    mov r1, r4
    bl func_ov002_021ba024
    cmp r0, #0x0
    movne r0, #0x800
    ldmneia sp!, {r3, r4, r5, pc}
.L_11c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cd220
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf08c
_LIT3: .word 0x00001895
_LIT4: .word 0x000019a6
_LIT5: .word 0x00001522
_LIT6: .word 0x000018f9
