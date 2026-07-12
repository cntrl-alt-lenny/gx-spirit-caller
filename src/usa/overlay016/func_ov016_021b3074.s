; func_ov016_021b3074 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104acc
        .extern data_ov016_021b8ea0
        .extern data_ov016_021b8eaa
        .extern data_ov016_021b8eb4
        .extern data_ov016_021baa8c
        .extern data_ov016_021bab04
        .extern func_020371b8
        .extern func_ov016_021b27f4
        .extern func_ov016_021b31f0
        .extern func_ov016_021b34dc
        .extern func_ov016_021b3550
        .extern func_ov016_021b38e4
        .extern func_ov016_021b40b0
        .extern func_ov016_021b4674
        .extern func_ov016_021b61d0
        .extern func_ov016_021b6534
        .global func_ov016_021b3074
        .arm
func_ov016_021b3074:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x0
    beq .L_450
    cmp r1, #0x1
    beq .L_520
    cmp r1, #0x2
    beq .L_554
    b .L_584
.L_450:
    ldr r1, _LIT0
    ldrh r2, [r1, #0x52]
    cmp r2, #0x0
    beq .L_4c0
    ldrh r1, [r1, #0x54]
    tst r1, #0xc0
    beq .L_494
    ldr r1, [r4, #0xc]
    rsb r1, r1, #0x1
    str r1, [r4, #0xc]
    bl func_ov016_021b38e4
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_584
.L_494:
    tst r1, #0x1
    beq .L_4ac
    ldr r1, [r4, #0xc]
    add r1, r1, #0x1
    bl func_ov016_021b31f0
    ldmia sp!, {r4, pc}
.L_4ac:
    tst r1, #0x2
    beq .L_584
    mov r1, #0x0
    bl func_ov016_021b31f0
    ldmia sp!, {r4, pc}
.L_4c0:
    ldr r0, _LIT1
    bl func_ov016_021b27f4
    cmp r0, #0x0
    beq .L_4e0
    mov r0, r4
    mov r1, #0x0
    bl func_ov016_021b31f0
    ldmia sp!, {r4, pc}
.L_4e0:
    ldr r0, _LIT2
    bl func_ov016_021b27f4
    cmp r0, #0x0
    beq .L_500
    mov r0, r4
    mov r1, #0x1
    bl func_ov016_021b31f0
    ldmia sp!, {r4, pc}
.L_500:
    ldr r0, _LIT3
    bl func_ov016_021b27f4
    cmp r0, #0x0
    beq .L_584
    mov r0, r4
    mov r1, #0x2
    bl func_ov016_021b31f0
    ldmia sp!, {r4, pc}
.L_520:
    ldr r0, _LIT4
    bl func_ov016_021b4674
    cmp r0, #0x0
    beq .L_584
    ldr r0, _LIT4
    bl func_ov016_021b40b0
    mov r0, r4
    bl func_ov016_021b34dc
    mov r0, r4
    bl func_ov016_021b3550
    mov r0, #0x0
    str r0, [r4, #0x4]
    b .L_584
.L_554:
    ldr r0, _LIT5
    bl func_ov016_021b6534
    cmp r0, #0x0
    beq .L_584
    ldr r0, _LIT5
    bl func_ov016_021b61d0
    mov r1, #0x0
    mov r0, r4
    str r1, [r4, #0x4]
    bl func_ov016_021b34dc
    mov r0, r4
    bl func_ov016_021b3550
.L_584:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_02104acc
_LIT1: .word data_ov016_021b8ea0
_LIT2: .word data_ov016_021b8eaa
_LIT3: .word data_ov016_021b8eb4
_LIT4: .word data_ov016_021baa8c
_LIT5: .word data_ov016_021bab04
