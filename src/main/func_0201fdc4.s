; func_0201fdc4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c66f4
        .extern data_020c6708
        .extern data_020c6728
        .extern data_020c6744
        .extern data_02191f40
        .extern func_0201f11c
        .extern func_0201f138
        .extern func_0201f19c
        .extern func_0201ff2c
        .global func_0201fdc4
        .arm
func_0201fdc4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    cmp r0, #0x0
    beq .L_104
    bl func_0201f19c
    ldrh r0, [r4, #0x2]
    cmp r0, #0xc
    bne .L_d0
    mov r0, #0x9
    bl func_0201f138
    ldmia sp!, {r4, pc}
.L_d0:
    cmp r0, #0xb
    bne .L_e4
    mov r0, #0x9
    bl func_0201f138
    ldmia sp!, {r4, pc}
.L_e4:
    cmp r0, #0x1
    bne .L_f8
    mov r0, #0x8
    bl func_0201f138
    ldmia sp!, {r4, pc}
.L_f8:
    mov r0, #0x9
    bl func_0201f138
    ldmia sp!, {r4, pc}
.L_104:
    ldrh r0, [r4, #0x8]
    cmp r0, #0x8
    ldmeqia sp!, {r4, pc}
    cmp r0, #0x7
    bne .L_178
    ldr r0, _LIT0
    ldr r1, [r0, #0x38]
    cmp r1, #0x0
    beq .L_130
    ldr r0, _LIT1
    blx r1
.L_130:
    mov r0, #0x4
    bl func_0201f138
    bl func_0201ff2c
    cmp r0, #0x0
    bne .L_168
    ldr r0, _LIT0
    ldr r1, [r0, #0x38]
    cmp r1, #0x0
    beq .L_15c
    ldr r0, _LIT2
    blx r1
.L_15c:
    mov r0, #0x3
    bl func_0201f138
    ldmia sp!, {r4, pc}
.L_168:
    ldrh r1, [r4, #0xa]
    ldr r0, _LIT0
    strh r1, [r0, #0x4]
    ldmia sp!, {r4, pc}
.L_178:
    cmp r0, #0x6
    ldmeqia sp!, {r4, pc}
    cmp r0, #0x9
    bne .L_1b4
    ldr r0, _LIT0
    ldr r1, [r0, #0x38]
    cmp r1, #0x0
    beq .L_1a0
    ldr r0, _LIT3
    blx r1
.L_1a0:
    mov r0, #0x14
    bl func_0201f19c
    mov r0, #0x9
    bl func_0201f138
    ldmia sp!, {r4, pc}
.L_1b4:
    cmp r0, #0x1a
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT0
    ldr r1, [r1, #0x38]
    cmp r1, #0x0
    beq .L_1e8
    bl func_0201f11c
    ldr r3, _LIT0
    mov r2, r0
    ldrh r1, [r4, #0x8]
    ldr r3, [r3, #0x38]
    ldr r0, _LIT4
    blx r3
.L_1e8:
    mov r0, #0x9
    bl func_0201f138
    ldmia sp!, {r4, pc}
_LIT0: .word data_02191f40
_LIT1: .word data_020c66f4
_LIT2: .word data_020c6708
_LIT3: .word data_020c6728
_LIT4: .word data_020c6744
