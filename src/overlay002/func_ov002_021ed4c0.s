; func_ov002_021ed4c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202f46c
        .extern func_ov002_021b9ecc
        .extern func_ov002_021ba104
        .extern func_ov002_021c23ac
        .global func_ov002_021ed4c0
        .arm
func_ov002_021ed4c0:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldrh r0, [r6, #0x2]
    mov r5, r1
    mov r4, r2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r5
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    cmp r4, #0x5
    movge r0, #0x0
    ldmgeia sp!, {r4, r5, r6, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021c23ac
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r1, [r6]
    ldr r2, _LIT0
    cmp r1, r2
    bgt .L_70
    bge .L_a8
    ldr r2, _LIT1
    cmp r1, r2
    beq .L_94
    b .L_130
.L_70:
    add r0, r2, #0x64
    cmp r1, r0
    bgt .L_84
    beq .L_108
    b .L_130
.L_84:
    ldr r0, _LIT2
    cmp r1, r0
    beq .L_11c
    b .L_130
.L_94:
    mov r0, r5
    mov r1, r4
    add r2, r2, #0xb
    bl func_ov002_021ba104
    ldmia sp!, {r4, r5, r6, pc}
.L_a8:
    ldrh r0, [r6, #0x6]
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x18
    beq .L_cc
    cmp r0, #0x1
    beq .L_e0
    cmp r0, #0x2
    beq .L_f4
    b .L_130
.L_cc:
    mov r0, r5
    mov r1, r4
    sub r2, r2, #0x5
    bl func_ov002_021ba104
    ldmia sp!, {r4, r5, r6, pc}
.L_e0:
    mov r0, r5
    mov r1, r4
    sub r2, r2, #0x3
    bl func_ov002_021ba104
    ldmia sp!, {r4, r5, r6, pc}
.L_f4:
    mov r0, r5
    mov r1, r4
    sub r2, r2, #0x4
    bl func_ov002_021ba104
    ldmia sp!, {r4, r5, r6, pc}
.L_108:
    mov r0, r5
    mov r1, r4
    add r2, r2, #0x7
    bl func_ov002_021ba104
    ldmia sp!, {r4, r5, r6, pc}
.L_11c:
    mov r0, r5
    mov r1, r4
    bl func_ov002_021b9ecc
    bl func_0202f46c
    ldmia sp!, {r4, r5, r6, pc}
.L_130:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x000018a3
_LIT1: .word 0x0000146f
_LIT2: .word 0x00001a9a
