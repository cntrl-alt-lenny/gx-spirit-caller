; func_0203e0a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bec3c
        .extern data_020fe4c4
        .extern func_0203df88
        .extern func_02094688
        .global func_0203e0a0
        .arm
func_0203e0a0:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    add r4, r6, #0x300
    bl func_0203df88
    ldrb r1, [r6, #0xd0c]
    mov r5, r0
    mov r0, #0x24
    mov r1, r1, lsl #0x1c
    mla r4, r5, r0, r4
    movs r0, r1, lsr #0x1c
    beq .L_34
    cmp r0, #0x4
    bne .L_60
.L_34:
    ldr r0, _LIT0
    add r1, r4, #0x4
    mov r2, #0x8
    bl func_02094688
    mov r1, #0x8
    add r0, r5, #0x1
    strb r1, [r4, #0x3]
    mov r1, #0x6
    strb r1, [r4, #0x1]
    and r5, r0, #0xff
    add r4, r4, #0x24
.L_60:
    ldrb r0, [r6, #0xd0c]
    mov r0, r0, lsl #0x1c
    movs r0, r0, lsr #0x1c
    beq .L_78
    cmp r0, #0x7
    bne .L_a4
.L_78:
    ldr r0, _LIT1
    add r1, r4, #0x4
    mov r2, #0x8
    bl func_02094688
    mov r1, #0x8
    add r0, r5, #0x1
    strb r1, [r4, #0x3]
    mov r1, #0x9
    strb r1, [r4, #0x1]
    and r5, r0, #0xff
    add r4, r4, #0x24
.L_a4:
    ldrb r0, [r6, #0xd0c]
    mov r0, r0, lsl #0x1c
    movs r0, r0, lsr #0x1c
    beq .L_bc
    cmp r0, #0x8
    bne .L_e4
.L_bc:
    ldr r0, _LIT2
    add r1, r4, #0x4
    mov r2, #0xb
    bl func_02094688
    mov r1, #0xb
    add r0, r5, #0x1
    strb r1, [r4, #0x3]
    mov r1, #0xa
    strb r1, [r4, #0x1]
    and r5, r0, #0xff
.L_e4:
    mov r0, r5
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_020fe4c4
_LIT1: .word data_020bec3c
_LIT2: .word data_020bec3c+0x10
