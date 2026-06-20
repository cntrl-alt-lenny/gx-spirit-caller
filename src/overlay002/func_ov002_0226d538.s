; func_ov002_0226d538 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd524
        .extern data_ov002_022cd744
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern data_ov002_022d0e6c
        .extern func_ov002_021ae6d0
        .extern func_ov002_021b00d0
        .extern func_ov002_0227b0b8
        .global func_ov002_0226d538
        .arm
func_ov002_0226d538:
    stmdb sp!, {r4, lr}
    ldr ip, _LIT0
    mov r3, r2
    ldr r2, [ip, #0xd9c]
    cmp r2, #0x0
    beq .L_24
    cmp r2, #0x1
    beq .L_34
    b .L_180
.L_24:
    add r0, r2, #0x1
    str r0, [ip, #0xd9c]
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_34:
    ldr r4, _LIT1
    cmp r1, r4
    beq .L_5c
    add r2, r4, #0xdc
    cmp r1, r2
    beq .L_84
    add r2, r4, #0x2a8
    cmp r1, r2
    beq .L_c4
    b .L_168
.L_5c:
    ldr r1, _LIT2
    ldr r0, [r1, r0, lsl #0x2]
    cmp r0, #0x1
    streq r3, [ip, #0xd44]
    beq .L_168
    ldr r0, _LIT3
    mov r2, #0x1
    add r1, r0, #0x2
    bl func_ov002_021ae6d0
    b .L_168
.L_84:
    ldr r1, _LIT2
    ldr r0, [r1, r0, lsl #0x2]
    cmp r0, #0x1
    bne .L_ac
    mov r0, #0x4
    bl func_ov002_021b00d0
    ldr r1, _LIT0
    add r0, r0, #0x4
    str r0, [r1, #0xd44]
    b .L_168
.L_ac:
    mov r0, #0x118
    mov r1, #0x130
    mov r2, #0x1
    mov r3, #0xc
    bl func_ov002_021ae6d0
    b .L_168
.L_c4:
    ldr r1, _LIT4
    and r2, r0, #0x1
    mul r3, r2, r1
    ldr r2, _LIT5
    ldr r1, _LIT6
    ldr r2, [r2, r3]
    ldr r3, _LIT2
    sub ip, r2, #0x1
    cmp ip, r1
    ldr r2, _LIT7
    movgt ip, r1
    smull r1, r4, r2, ip
    ldr r2, [r3, r0, lsl #0x2]
    mov r1, ip, lsr #0x1f
    cmp r2, #0x1
    add r4, r1, r4, asr #0x6
    bne .L_154
    ldr r2, _LIT8
    mvn r1, #0x0
    str r0, [r2]
    rsb r0, r0, #0x1
    mov r2, #0x0
    bl func_ov002_0227b0b8
    add r0, r0, #0xe7
    add r1, r0, #0x300
    ldr r2, _LIT7
    mov r0, r1, lsr #0x1f
    smull r1, r3, r2, r1
    add r3, r0, r3, asr #0x6
    cmp r3, #0x3
    movle r3, #0x3
    cmp r4, r3
    ldr r0, _LIT0
    movge r4, r3
    str r4, [r0, #0xd44]
    b .L_168
.L_154:
    ldr r0, _LIT3
    mov r3, r4
    add r1, r0, #0x1
    mov r2, #0x1
    bl func_ov002_021ae6d0
.L_168:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd9c]
    add r2, r2, #0x1
    str r2, [r1, #0xd9c]
    ldmia sp!, {r4, pc}
.L_180:
    ldr r2, [ip, #0xd44]
    ldr r1, _LIT9
    mov r0, #0x1
    strh r2, [r1, #0xb0]
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word 0x000014be
_LIT2: .word data_ov002_022cd744
_LIT3: .word 0x0000012d
_LIT4: .word 0x00000868
_LIT5: .word data_ov002_022cf16c
_LIT6: .word 0x0000ffff
_LIT7: .word 0x10624dd3
_LIT8: .word data_ov002_022cd524
_LIT9: .word data_ov002_022d0e6c
