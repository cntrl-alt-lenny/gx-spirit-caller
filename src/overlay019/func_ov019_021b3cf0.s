; func_ov019_021b3cf0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern data_021040ac
        .extern data_ov019_021b6848
        .extern func_02019124
        .extern func_02037208
        .global func_ov019_021b3cf0
        .arm
func_ov019_021b3cf0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r1, #0x0
    beq .L_cac
    cmp r1, #0x1
    beq .L_cd0
    cmp r1, #0x2
    beq .L_d84
    b .L_dc0
.L_cac:
    mov r0, #0x42
    ldr r4, _LIT0
    mov r2, #0x0
    sub r1, r0, #0x43
    mov r3, #0x1
    str r2, [r4, #0x48]
    bl func_02037208
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_cd0:
    ldr r2, [r4, #0xc]
    ldr r1, [r4, #0x10]
    mov r0, #0xc
    add r2, r2, r1
    mla r1, r2, r0, r4
    ldr r0, [r1, #0x18]
    cmp r0, #0x0
    ldrneh r0, [r1, #0x1c]
    cmpne r0, #0x0
    beq .L_d6c
    bl func_02019124
    cmp r0, #0xff
    bne .L_d30
    bl GetSystemWork
    ldr r0, [r0, #0x900]
    mov r0, r0, lsl #0x7
    movs r0, r0, lsr #0x1f
    bne .L_d30
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    b .L_dc0
.L_d30:
    ldr r2, [r4, #0xc]
    ldr r1, [r4, #0x10]
    mov r0, #0xc
    add r2, r2, r1
    mla r1, r2, r0, r4
    ldrh ip, [r1, #0x14]
    mov r0, #0x3a
    ldr r4, _LIT0
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    str ip, [r4, #0x48]
    bl func_02037208
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_d6c:
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    b .L_dc0
.L_d84:
    ldr r2, [r4, #0xc]
    ldr r1, [r4, #0x10]
    mov r0, #0xc
    add r2, r2, r1
    mla r1, r2, r0, r4
    ldr r0, _LIT1
    ldrh r2, [r1, #0x14]
    ldr r1, [r0, #0xc0]
    cmp r2, r1
    beq .L_dc0
    mov r1, #0x1
    str r2, [r0, #0xc0]
    str r1, [r0, #0xb8]
    sub r1, r1, #0x81
    str r1, [r0, #0xc4]
.L_dc0:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_021040ac
_LIT1: .word data_ov019_021b6848
