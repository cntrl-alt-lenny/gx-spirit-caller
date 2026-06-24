; func_0201fd70 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c6614
        .extern data_020c6628
        .extern data_020c6648
        .extern data_020c6664
        .extern data_02191e60
        .extern func_0201f0c8
        .extern func_0201f0e4
        .extern func_0201f148
        .extern func_0201fed8
        .global func_0201fd70
        .arm
func_0201fd70:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    cmp r0, #0x0
    beq .L_64
    bl func_0201f148
    ldrh r0, [r4, #0x2]
    cmp r0, #0xc
    bne .L_30
    mov r0, #0x9
    bl func_0201f0e4
    ldmia sp!, {r4, pc}
.L_30:
    cmp r0, #0xb
    bne .L_44
    mov r0, #0x9
    bl func_0201f0e4
    ldmia sp!, {r4, pc}
.L_44:
    cmp r0, #0x1
    bne .L_58
    mov r0, #0x8
    bl func_0201f0e4
    ldmia sp!, {r4, pc}
.L_58:
    mov r0, #0x9
    bl func_0201f0e4
    ldmia sp!, {r4, pc}
.L_64:
    ldrh r0, [r4, #0x8]
    cmp r0, #0x8
    ldmeqia sp!, {r4, pc}
    cmp r0, #0x7
    bne .L_d8
    ldr r0, _LIT0
    ldr r1, [r0, #0x38]
    cmp r1, #0x0
    beq .L_90
    ldr r0, _LIT1
    blx r1
.L_90:
    mov r0, #0x4
    bl func_0201f0e4
    bl func_0201fed8
    cmp r0, #0x0
    bne .L_c8
    ldr r0, _LIT0
    ldr r1, [r0, #0x38]
    cmp r1, #0x0
    beq .L_bc
    ldr r0, _LIT2
    blx r1
.L_bc:
    mov r0, #0x3
    bl func_0201f0e4
    ldmia sp!, {r4, pc}
.L_c8:
    ldrh r1, [r4, #0xa]
    ldr r0, _LIT0
    strh r1, [r0, #0x4]
    ldmia sp!, {r4, pc}
.L_d8:
    cmp r0, #0x6
    ldmeqia sp!, {r4, pc}
    cmp r0, #0x9
    bne .L_114
    ldr r0, _LIT0
    ldr r1, [r0, #0x38]
    cmp r1, #0x0
    beq .L_100
    ldr r0, _LIT3
    blx r1
.L_100:
    mov r0, #0x14
    bl func_0201f148
    mov r0, #0x9
    bl func_0201f0e4
    ldmia sp!, {r4, pc}
.L_114:
    cmp r0, #0x1a
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT0
    ldr r1, [r1, #0x38]
    cmp r1, #0x0
    beq .L_148
    bl func_0201f0c8
    ldr r3, _LIT0
    mov r2, r0
    ldrh r1, [r4, #0x8]
    ldr r3, [r3, #0x38]
    ldr r0, _LIT4
    blx r3
.L_148:
    mov r0, #0x9
    bl func_0201f0e4
    ldmia sp!, {r4, pc}
_LIT0: .word data_02191e60
_LIT1: .word data_020c6614
_LIT2: .word data_020c6628
_LIT3: .word data_020c6648
_LIT4: .word data_020c6664
