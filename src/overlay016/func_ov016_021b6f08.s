; func_ov016_021b6f08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov016_021bab44
        .extern data_ov016_021bac38
        .extern data_ov016_021bb2c4
        .extern data_ov016_021bb3c4
        .extern func_0202c0c0
        .extern func_02037208
        .extern func_ov016_021b5544
        .global func_ov016_021b6f08
        .arm
func_ov016_021b6f08:
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r1, #0x0
    beq .L_bdc
    cmp r1, #0x1
    beq .L_c2c
    cmp r1, #0x2
    beq .L_c6c
    b .L_c9c
.L_bdc:
    ldr lr, _LIT0
    mov r0, #0x42
    ldr r2, [lr]
    ldr r1, [lr]
    and r2, r2, #0x1f00
    mov r3, r2, lsr #0x8
    bic r2, r1, #0x1f00
    bic r1, r3, #0x10
    orr ip, r2, r1, lsl #0x8
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    str ip, [lr]
    bl func_02037208
    mov r1, #0x2
    ldr r0, _LIT1
    str r1, [r4]
    mov r1, #0x1
    str r1, [r0, #0x1f0]
    b .L_c9c
.L_c2c:
    ldr r1, _LIT2
    ldr r0, _LIT3
    ldrh r2, [r1, #0x98]
    orr r2, r2, #0x2
    strh r2, [r1, #0x98]
    bl func_0202c0c0
    mov r2, r0
    ldr r0, _LIT4
    mov r1, #0x12
    bl func_ov016_021b5544
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    b .L_c9c
.L_c6c:
    ldr r3, [r4, #0xc]
    ldr r0, [r4, #0x10]
    ldr r1, _LIT1
    mov r2, #0x1
    add r3, r3, r0
    ldr r0, _LIT5
    str r3, [r1, #0x1dc]
    strh r2, [r0, #0xd8]
    sub r0, r2, #0x81
    str r0, [r1, #0x1e0]
    sub r0, r2, #0xb9
    str r0, [r1, #0x1e8]
.L_c9c:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x04001000
_LIT1: .word data_ov016_021bb2c4
_LIT2: .word data_ov016_021bab44
_LIT3: .word 0x000006b4
_LIT4: .word data_ov016_021bac38
_LIT5: .word data_ov016_021bb3c4
