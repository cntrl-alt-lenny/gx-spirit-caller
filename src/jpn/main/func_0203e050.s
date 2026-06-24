; func_0203e050 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020beb48
        .extern data_020beb58
        .extern data_020fe3e4
        .extern func_0203df38
        .extern func_02094688
        .global func_0203e050
        .arm
func_0203e050:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    add r4, r6, #0x300
    bl func_0203df38
    ldrb r1, [r6, #0xd0c]
    mov r5, r0
    mov r0, #0x24
    mov r1, r1, lsl #0x1c
    mla r4, r5, r0, r4
    movs r0, r1, lsr #0x1c
    beq .L_14c
    cmp r0, #0x4
    bne .L_178
.L_14c:
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
.L_178:
    ldrb r0, [r6, #0xd0c]
    mov r0, r0, lsl #0x1c
    movs r0, r0, lsr #0x1c
    beq .L_190
    cmp r0, #0x7
    bne .L_1bc
.L_190:
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
.L_1bc:
    ldrb r0, [r6, #0xd0c]
    mov r0, r0, lsl #0x1c
    movs r0, r0, lsr #0x1c
    beq .L_1d4
    cmp r0, #0x8
    bne .L_1fc
.L_1d4:
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
.L_1fc:
    mov r0, r5
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_020fe3e4
_LIT1: .word data_020beb48
_LIT2: .word data_020beb58
