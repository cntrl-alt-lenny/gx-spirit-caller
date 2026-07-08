; func_ov002_022337c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022d0170
        .extern func_ov002_021b98d4
        .extern func_ov002_021d8038
        .extern func_ov002_0223de04
        .extern func_ov002_02257c14
        .global func_ov002_022337c0
        .arm
func_ov002_022337c0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r1
    mov r1, #0x0
    mov r4, r0
    bl func_ov002_0223de04
    ldr r2, _LIT0
    mov r1, r0
    ldr r0, [r2, #0x5b4]
    cmp r0, #0x0
    beq .L_3c
    cmp r0, #0x1
    beq .L_84
    cmp r0, #0x2
    beq .L_d0
    b .L_128
.L_3c:
    ldrh r0, [r4, #0x6]
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x18
    beq .L_7c
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021b98d4
    cmp r0, #0x0
    blt .L_7c
    ldr r1, _LIT0
    mov r0, #0x1
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, pc}
.L_7c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_84:
    ldr r0, _LIT1
    mov r1, r1, lsl #0x2
    ldrh r2, [r0, r1]
    mov r0, r4
    mov r1, r5
    mov r2, r2, lsl #0x13
    mov r2, r2, lsr #0x13
    strh r2, [r4]
    bl func_ov002_02257c14
    ldr r1, _LIT2
    cmp r0, #0x0
    strh r1, [r4]
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT0
    mov r0, #0x1
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, pc}
.L_d0:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021b98d4
    movs ip, r0
    bmi .L_118
    ldrh r0, [r4, #0x2]
    ldr r3, _LIT3
    ldr r1, _LIT4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mla r1, r2, r1, r3
    add r1, r1, #0x18
    add r1, r1, #0x400
    add r1, r1, ip, lsl #0x2
    mov r2, #0x0
    bl func_ov002_021d8038
.L_118:
    ldr r1, _LIT0
    mov r0, #0x0
    str r0, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, pc}
.L_128:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022d0170
_LIT2: .word 0x00001935
_LIT3: .word data_ov002_022cf08c
_LIT4: .word 0x00000868
