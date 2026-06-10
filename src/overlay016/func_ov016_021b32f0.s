; func_ov016_021b32f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov016_021b9740
        .extern data_ov016_021babec
        .extern data_ov016_021bac38
        .extern data_ov016_021bac64
        .extern func_0202c0c0
        .extern func_02037208
        .extern func_ov016_021b35dc
        .extern func_ov016_021b3b14
        .extern func_ov016_021b5544
        .extern func_ov016_021b61dc
        .global func_ov016_021b32f0
        .arm
func_ov016_021b32f0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r1, #0x0
    beq .L_3a8
    cmp r1, #0x1
    beq .L_3c4
    cmp r1, #0x2
    beq .L_438
    b .L_50c
.L_3a8:
    mov r0, #0x42
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_3c4:
    mov r0, #0x3a
    mov r3, #0x1
    sub r1, r0, #0x3b
    mov r2, #0x0
    str r3, [r4, #0x4]
    bl func_02037208
    ldr r3, _LIT0
    mov r0, r4
    ldr r2, [r3]
    ldr r1, [r3]
    and r2, r2, #0x1f00
    mov r4, r2, lsr #0x8
    bic r2, r1, #0x1f00
    bic r1, r4, #0x10
    orr r1, r2, r1, lsl #0x8
    str r1, [r3]
    bl func_ov016_021b35dc
    ldr r3, _LIT0
    ldr r0, _LIT1
    ldr r2, [r3]
    ldr r1, [r3]
    and r2, r2, #0x1f00
    mov r4, r2, lsr #0x8
    bic r2, r1, #0x1f00
    bic r1, r4, #0x4
    orr r1, r2, r1, lsl #0x8
    str r1, [r3]
    bl func_ov016_021b3b14
    b .L_50c
.L_438:
    ldr r1, _LIT2
    ldr r1, [r1, #0x8c]
    cmp r1, #0x0
    beq .L_4e0
    mov r3, #0x4000000
    ldr r2, [r3]
    ldr r1, [r3]
    and r2, r2, #0x1f00
    mov ip, r2, lsr #0x8
    bic r2, r1, #0x1f00
    bic r1, ip, #0x6
    orr r1, r2, r1, lsl #0x8
    str r1, [r3]
    mov r1, #0x2
    str r1, [r4, #0x4]
    add r3, r3, #0x1000
    ldr r2, [r3]
    ldr r1, [r3]
    and r2, r2, #0x1f00
    mov r4, r2, lsr #0x8
    bic r2, r1, #0x1f00
    bic r1, r4, #0x10
    orr r1, r2, r1, lsl #0x8
    str r1, [r3]
    bl func_ov016_021b35dc
    ldr r3, _LIT0
    ldr r0, _LIT3
    ldr r2, [r3]
    ldr r1, [r3]
    and r2, r2, #0x1f00
    mov r4, r2, lsr #0x8
    bic r2, r1, #0x1f00
    bic r1, r4, #0x4
    orr r1, r2, r1, lsl #0x8
    str r1, [r3]
    bl func_ov016_021b61dc
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    b .L_50c
.L_4e0:
    ldr r0, _LIT4
    bl func_0202c0c0
    mov r2, r0
    ldr r0, _LIT5
    mov r1, #0x1
    bl func_ov016_021b5544
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_50c:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x04001000
_LIT1: .word data_ov016_021babec
_LIT2: .word data_ov016_021b9740
_LIT3: .word data_ov016_021bac64
_LIT4: .word 0x000006b5
_LIT5: .word data_ov016_021bac38
