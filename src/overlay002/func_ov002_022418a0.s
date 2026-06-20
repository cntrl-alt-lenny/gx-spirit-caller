; func_ov002_022418a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern data_ov002_022d0e6c
        .extern func_ov002_021b99b4
        .extern func_ov002_021bc618
        .extern func_ov002_021ca2b8
        .extern func_ov002_0223de04
        .extern func_ov002_022536e8
        .extern func_ov002_0226b174
        .global func_ov002_022418a0
        .arm
func_ov002_022418a0:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, _LIT0
    ldr r2, _LIT1
    ldr r3, [r1, #0x5b8]
    ldr r4, [r2, #0xcec]
    ldr r2, [r1, #0x5bc]
    mov r5, r0
    cmp r3, #0x3
    eor r4, r4, r2
    addls pc, pc, r3, lsl #0x2
    b .L_854
    b .L_738
    b .L_74c
    b .L_7d0
    b .L_834
.L_738:
    mov r0, #0x0
    str r0, [r1, #0x5bc]
    add r2, r3, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, pc}
.L_74c:
    mov r0, r4
    bl func_ov002_021bc618
    cmp r0, #0x0
    beq .L_7b8
    mov r0, r4
    bl func_ov002_021ca2b8
    cmp r0, #0x0
    beq .L_7b8
    ldrh r2, [r5, #0x4]
    ldrh r1, [r5]
    mov r0, r4
    mov r2, r2, lsl #0x11
    mov r2, r2, lsr #0x17
    bl func_ov002_022536e8
    cmp r0, #0x0
    beq .L_7b8
    ldrh r2, [r5, #0x4]
    ldrh r1, [r5]
    mov r0, r4
    mov r2, r2, lsl #0x11
    mov r2, r2, lsr #0x17
    bl func_ov002_0226b174
    ldr r0, _LIT0
    ldr r1, [r0, #0x5b8]
    add r1, r1, #0x1
    str r1, [r0, #0x5b8]
    b .L_7c8
.L_7b8:
    ldr r0, _LIT0
    ldr r1, [r0, #0x5b8]
    add r1, r1, #0x2
    str r1, [r0, #0x5b8]
.L_7c8:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_7d0:
    ldr r1, _LIT2
    mov r0, r4
    ldrh r1, [r1, #0xb0]
    bl func_ov002_021b99b4
    ldr r3, _LIT3
    ldr r1, _LIT4
    and r2, r4, #0x1
    mla r1, r2, r1, r3
    add r1, r1, #0x18
    add r1, r1, #0x400
    ldr r1, [r1, r0, lsl #0x2]
    mov r0, r5
    mov r2, r1, lsl #0x2
    mov r3, r1, lsl #0x12
    mov r1, r3, lsr #0x1f
    mov r2, r2, lsr #0x18
    add r3, r1, r2, lsl #0x1
    mov r2, #0xe
    bl func_ov002_0223de04
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, pc}
.L_834:
    add r0, r2, #0x1
    str r0, [r1, #0x5bc]
    cmp r0, #0x2
    addge r0, r3, #0x1
    movlt r0, #0x1
    str r0, [r1, #0x5b8]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_854:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022d016c
_LIT2: .word data_ov002_022d0e6c
_LIT3: .word data_ov002_022cf16c
_LIT4: .word 0x00000868
