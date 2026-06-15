; func_0201f34c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c6494
        .extern data_020c64c4
        .extern data_020c64f4
        .extern data_020c6530
        .extern data_02191f40
        .extern func_0201f138
        .extern func_0201f19c
        .extern func_0201f4d4
        .extern func_0209e91c
        .global func_0201f34c
        .arm
func_0201f34c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldrh r1, [r4, #0x10]
    ldrh r0, [r4, #0x2]
    mov r2, #0x1
    mov r2, r2, lsl r1
    cmp r0, #0x0
    mov r5, r2, lsl #0x10
    beq .L_34
    bl func_0201f19c
    mov r0, #0x9
    bl func_0201f138
    ldmia sp!, {r3, r4, r5, pc}
.L_34:
    ldrh r3, [r4, #0x8]
    cmp r3, #0x7
    bgt .L_64
    bge .L_80
    cmp r3, #0x2
    bgt .L_154
    cmp r3, #0x0
    blt .L_154
    beq .L_13c
    cmp r3, #0x2
    ldmeqia sp!, {r3, r4, r5, pc}
    b .L_154
.L_64:
    cmp r3, #0x9
    bgt .L_74
    beq .L_f0
    b .L_154
.L_74:
    cmp r3, #0x1a
    beq .L_120
    b .L_154
.L_80:
    ldr r0, _LIT0
    ldr r2, [r0, #0x38]
    cmp r2, #0x0
    beq .L_98
    ldr r0, _LIT1
    blx r2
.L_98:
    ldr r0, _LIT0
    ldr r1, [r0, #0x20]
    cmp r1, #0x0
    beq .L_dc
    mov r0, r4
    blx r1
    cmp r0, #0x0
    bne .L_dc
    ldrh r1, [r4, #0x10]
    mov r0, #0x0
    bl func_0209e91c
    cmp r0, #0x2
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_0201f19c
    mov r0, #0x9
    bl func_0201f138
    ldmia sp!, {r3, r4, r5, pc}
.L_dc:
    ldr r0, _LIT0
    ldrh r1, [r0, #0xa]
    orr r1, r1, r5, lsr #0x10
    strh r1, [r0, #0xa]
    ldmia sp!, {r3, r4, r5, pc}
.L_f0:
    ldr r0, _LIT0
    ldr r2, [r0, #0x38]
    cmp r2, #0x0
    beq .L_108
    ldr r0, _LIT2
    blx r2
.L_108:
    ldr r0, _LIT0
    mvn r1, r5, lsr #0x10
    ldrh r2, [r0, #0xa]
    and r1, r2, r1
    strh r1, [r0, #0xa]
    ldmia sp!, {r3, r4, r5, pc}
.L_120:
    ldr r0, _LIT0
    ldr r2, [r0, #0x38]
    cmp r2, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT3
    blx r2
    ldmia sp!, {r3, r4, r5, pc}
.L_13c:
    bl func_0201f4d4
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x9
    bl func_0201f138
    ldmia sp!, {r3, r4, r5, pc}
.L_154:
    ldr r0, _LIT0
    ldr r2, [r0, #0x38]
    cmp r2, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT4
    mov r1, r3
    blx r2
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_02191f40
_LIT1: .word data_020c6494
_LIT2: .word data_020c64c4
_LIT3: .word data_020c64f4
_LIT4: .word data_020c6530
