; func_ov002_021b9af4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf0c8
        .extern func_0202e1e0
        .extern func_02030e50
        .extern func_ov002_021b3538
        .extern func_ov002_021b3f74
        .extern func_ov002_021b9dec
        .global func_ov002_021b9af4
        .arm
func_ov002_021b9af4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r4, r0
    mov r8, r1
    bl func_ov002_021b9dec
    mov r6, r0
    bl func_02030e50
    movs r7, r0
    beq .L_140
    ldr r1, _LIT0
    cmp r6, r1
    beq .L_48
    ldr r0, _LIT1
    cmp r6, r0
    beq .L_90
    add r0, r1, #0xa90
    cmp r6, r0
    beq .L_b0
    b .L_d0
.L_48:
    mov r0, r4
    mov r1, r8
    bl func_ov002_021b3538
    ldr r1, _LIT2
    cmp r0, r1
    subeq r0, r1, #0x10000
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r0, r0, #0xff
    and r1, r1, #0xff
    bl func_ov002_021b9dec
    ldr r1, _LIT3
    cmp r0, r1
    beq .L_d0
    mvn r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_90:
    mov r0, r4
    mov r1, r8
    bl func_ov002_021b3538
    ldr r1, _LIT2
    cmp r0, r1
    bne .L_d0
    sub r0, r1, #0x10000
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_b0:
    mov r0, r4
    mov r1, r8
    mov r2, r6
    mov r3, #0x1
    bl func_ov002_021b3f74
    cmp r0, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
.L_d0:
    ldr r3, _LIT4
    ldr r0, _LIT5
    and r2, r4, #0x1
    mov r1, #0x14
    mla r5, r2, r0, r3
    mul r4, r8, r1
    ldr r0, [r5, r4]
    mov r0, r0, lsl #0x10
    cmp r7, r0, lsr #0x10
    suble r0, r1, #0x15
    ldmleia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, r6
    bl func_0202e1e0
    cmp r0, #0x0
    ldrne r0, _LIT0
    cmpne r6, r0
    bne .L_124
    cmp r8, #0x5
    bge .L_130
    mvn r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_124:
    cmp r8, #0x5
    mvnge r0, #0x0
    ldmgeia sp!, {r4, r5, r6, r7, r8, pc}
.L_130:
    ldr r0, [r5, r4]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_140:
    mvn r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00000fee
_LIT1: .word 0x000014ac
_LIT2: .word 0x0000ffff
_LIT3: .word 0x000010bc
_LIT4: .word data_ov002_022cf0c8
_LIT5: .word 0x00000868
