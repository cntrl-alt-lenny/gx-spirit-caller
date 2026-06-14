; func_ov019_021b40d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_ov019_021b6334
        .extern func_020195b8
        .extern func_0202c0c0
        .extern func_ov019_021b2818
        .extern func_ov019_021b2938
        .global func_ov019_021b40d4
        .arm
func_ov019_021b40d4:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r1
    mov r4, r2
    cmp r5, #0x13
    beq .L_1c4
    cmp r5, #0x19
    beq .L_180
    cmp r5, #0x48
    beq .L_1c4
    b .L_1ec
.L_180:
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    sub r0, r0, #0x3
    cmp r0, #0x1
    bhi .L_1b0
    add r0, r5, #0x1dc
    add r0, r0, #0x400
    bl func_0202c0c0
    mov r2, r0
    b .L_1fc
.L_1b0:
    add r0, r5, #0x178
    add r0, r0, #0x400
    bl func_0202c0c0
    mov r2, r0
    b .L_1fc
.L_1c4:
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    beq .L_1ec
    add r0, r5, #0x1dc
    add r0, r0, #0x400
    bl func_0202c0c0
    mov r2, r0
    b .L_1fc
.L_1ec:
    add r0, r5, #0x178
    add r0, r0, #0x400
    bl func_0202c0c0
    mov r2, r0
.L_1fc:
    mov r0, #0xc
    mul r0, r4, r0
    add r0, r0, #0x348
    mov r0, r0, lsl #0x10
    ldr r1, _LIT1
    mov r0, r0, lsr #0x10
    mov r3, #0x500
    bl func_ov019_021b2938
    mov r0, r5
    mov r1, #0x0
    bl func_020195b8
    cmp r0, #0x63
    movgt r1, #0x63
    bgt .L_244
    mov r0, r5
    mov r1, #0x0
    bl func_020195b8
    mov r1, r0
.L_244:
    add r4, r4, r4, lsl #0x1
    add r0, r4, #0x3a8
    mov r0, r0, lsl #0x7
    add r0, r0, #0x6600000
    bl func_ov019_021b2818
    mov r0, r5
    mov r1, #0x1
    bl func_020195b8
    cmp r0, #0x63
    movgt r1, #0x63
    bgt .L_280
    mov r0, r5
    mov r1, #0x1
    bl func_020195b8
    mov r1, r0
.L_280:
    add r0, r4, #0xa9
    add r0, r0, #0x300
    mov r0, r0, lsl #0x7
    add r0, r0, #0x6600000
    bl func_ov019_021b2818
    mov r0, r5
    mov r1, #0x2
    bl func_020195b8
    cmp r0, #0x63
    movgt r1, #0x63
    bgt .L_2bc
    mov r0, r5
    mov r1, #0x2
    bl func_020195b8
    mov r1, r0
.L_2bc:
    add r0, r4, #0xaa
    add r0, r0, #0x300
    mov r0, r0, lsl #0x7
    add r0, r0, #0x6600000
    bl func_ov019_021b2818
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_02104f4c
_LIT1: .word data_ov019_021b6334
