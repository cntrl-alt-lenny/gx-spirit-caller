; func_ov002_0222118c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern func_ov002_021b4618
        .extern func_ov002_021de408
        .extern func_ov002_021df818
        .extern func_ov002_021e05fc
        .extern func_ov002_02257704
        .global func_ov002_0222118c
        .arm
func_ov002_0222118c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldrh r1, [r4, #0x4]
    mov r1, r1, lsl #0x1d
    movs r1, r1, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r3, _LIT0
    ldr r1, [r3, #0x5a8]
    cmp r1, #0x7f
    beq .L_60
    cmp r1, #0x80
    bne .L_1a4
    bl func_ov002_02257704
    mov r5, r0
    mov r0, r4
    mov r1, r5
    bl func_ov002_021de408
    and r0, r5, r0
    bl func_ov002_021b4618
    ldr r1, _LIT0
    str r0, [r1, #0x5ac]
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, pc}
.L_60:
    ldrh ip, [r4]
    ldr r2, _LIT1
    cmp ip, r2
    bgt .L_98
    bge .L_ec
    ldr r1, _LIT2
    cmp ip, r1
    bgt .L_88
    beq .L_c8
    b .L_19c
.L_88:
    sub r0, r2, #0x72
    cmp ip, r0
    beq .L_110
    b .L_19c
.L_98:
    ldr r1, _LIT3
    cmp ip, r1
    bgt .L_b8
    bge .L_150
    add r0, r2, #0x38
    cmp ip, r0
    beq .L_130
    b .L_19c
.L_b8:
    add r1, r1, #0xd4
    cmp ip, r1
    beq .L_174
    b .L_19c
.L_c8:
    ldr r3, [r3, #0x5ac]
    mov r1, #0x1f4
    ldrh r4, [r4, #0x2]
    mul r2, r3, r1
    mov r1, r4, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_021df818
    b .L_19c
.L_ec:
    ldr r3, [r3, #0x5ac]
    mov r1, #0x12c
    ldrh r4, [r4, #0x2]
    mul r2, r3, r1
    mov r1, r4, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_021df818
    b .L_19c
.L_110:
    ldr r2, [r3, #0x5ac]
    mov r0, #0x320
    mul r1, r2, r0
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e05fc
    b .L_19c
.L_130:
    ldr r2, [r3, #0x5ac]
    mov r0, #0x1f4
    mul r1, r2, r0
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e05fc
    b .L_19c
.L_150:
    ldr r3, [r3, #0x5ac]
    mov r1, #0x12c
    ldrh r4, [r4, #0x2]
    mul r2, r3, r1
    mov r1, r4, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_021df818
    b .L_19c
.L_174:
    ldr r3, [r3, #0x5ac]
    ldrh r4, [r4, #0x2]
    mov r1, #0x64
    mul r2, r3, r1
    mov r1, r4, lsl #0x11
    mov r3, r4, lsl #0x1f
    mov r1, r1, lsr #0x1f
    eor r1, r1, r3, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_021df818
.L_19c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_1a4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x000016d7
_LIT2: .word 0x000014aa
_LIT3: .word 0x000018dc
