; func_02022ee4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c689c
        .extern data_020c68a8
        .extern data_020c68b4
        .extern data_020c68c0
        .extern data_02197434
        .extern data_0219a834
        .extern func_02006c0c
        .extern func_02006e1c
        .extern func_02007104
        .extern func_0201e5b8
        .extern func_0201e66c
        .extern func_0202be4c
        .extern func_0202befc
        .extern func_0202bf90
        .extern func_0202c6ac
        .global func_02022ee4
        .arm
func_02022ee4:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, _LIT0
    mov r6, r0
    ldrsh r2, [r1, #0x76]
    ldrsh r0, [r1, #0x74]
    ldr r4, _LIT1
    cmp r2, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    add r0, r4, #0x3400
    ldrsh r1, [r0, #0x76]
    add r0, r4, #0x2b4
    add r2, r0, #0x1000
    mov r0, #0x3c
    smlabb r5, r1, r0, r2
    ldr r0, [r5, #0x38]
    cmp r0, #0x0
    bne .L_bac
    cmp r6, #0x2
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, [r5]
    cmp r0, #0x0
    beq .L_a18
    cmp r0, #0x1
    beq .L_b08
    cmp r0, #0x2
    beq .L_b28
    b .L_ba0
.L_a18:
    ldr r1, _LIT2
    add r0, r5, #0x4
    bl func_02007104
    cmp r0, #0x0
    blt .L_a74
    ldrsb r0, [r5, #0xd]
    ldrsb r3, [r5, #0xc]
    ldrsb ip, [r5, #0xe]
    sub r1, r0, #0x30
    mov r0, #0x64
    mul r2, r1, r0
    sub r1, r3, #0x30
    mov r0, #0x3e8
    mla r2, r1, r0, r2
    ldrsb r3, [r5, #0xf]
    sub r1, ip, #0x30
    mov r0, #0xa
    mla r0, r1, r0, r2
    sub r1, r3, #0x30
    add r0, r1, r0
    bl func_0202befc
    str r0, [r5, #0x38]
    b .L_ba0
.L_a74:
    ldr r1, _LIT3
    add r0, r5, #0x4
    bl func_02007104
    cmp r0, #0x0
    blt .L_ad0
    ldrsb r0, [r5, #0xe]
    ldrsb r3, [r5, #0xd]
    ldrsb ip, [r5, #0xf]
    sub r1, r0, #0x30
    mov r0, #0x64
    mul r2, r1, r0
    sub r1, r3, #0x30
    mov r0, #0x3e8
    mla r2, r1, r0, r2
    ldrsb r3, [r5, #0x10]
    sub r1, ip, #0x30
    mov r0, #0xa
    mla r0, r1, r0, r2
    sub r1, r3, #0x30
    add r0, r1, r0
    bl func_0202bf90
    str r0, [r5, #0x38]
    b .L_ba0
.L_ad0:
    ldr r1, _LIT4
    add r0, r5, #0x4
    bl func_02007104
    cmp r0, #0x0
    add r0, r5, #0x4
    blt .L_af4
    bl func_0202c6ac
    str r0, [r5, #0x38]
    b .L_ba0
.L_af4:
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [r5, #0x38]
    b .L_ba0
.L_b08:
    add r0, r5, #0x4
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [r5, #0x38]
    ldr r1, [r5, #0x2c]
    str r0, [r1]
    b .L_ba0
.L_b28:
    ldr r1, _LIT5
    add r0, r5, #0x4
    bl func_02007104
    cmp r0, #0x0
    blt .L_b80
    ldrsb r0, [r5, #0xd]
    ldrsb r3, [r5, #0xc]
    ldrsb ip, [r5, #0xe]
    sub r1, r0, #0x30
    mov r0, #0x64
    mul r2, r1, r0
    sub r1, r3, #0x30
    mov r0, #0x3e8
    mla r2, r1, r0, r2
    sub r1, ip, #0x30
    mov r0, #0xa
    mla r0, r1, r0, r2
    ldrsb r3, [r5, #0xf]
    sub r1, r3, #0x30
    add r0, r1, r0
    bl func_0202be4c
    b .L_b90
.L_b80:
    add r0, r5, #0x4
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
.L_b90:
    str r0, [r5, #0x38]
    ldr r1, [r5, #0x38]
    ldr r0, [r5, #0x2c]
    str r1, [r0]
.L_ba0:
    cmp r6, #0x1
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, pc}
.L_bac:
    ldr r0, [r5]
    cmp r0, #0x0
    beq .L_bc8
    cmp r0, #0x1
    cmpne r0, #0x2
    beq .L_bdc
    b .L_be4
.L_bc8:
    ldr r0, [r5, #0x38]
    ldr r1, [r5, #0x24]
    ldr r2, [r5, #0x28]
    bl func_0201e66c
    b .L_be4
.L_bdc:
    ldr r0, [r5, #0x2c]
    bl func_0201e5b8
.L_be4:
    ldr r0, [r5, #0x38]
    bl func_02006e1c
    mov r0, #0x0
    str r0, [r5, #0x38]
    ldr r1, [r5, #0x30]
    cmp r1, #0x0
    beq .L_c08
    ldr r0, [r5, #0x34]
    blx r1
.L_c08:
    add r0, r4, #0x3400
    ldrsh r1, [r0, #0x76]
    add r1, r1, #0x1
    strh r1, [r0, #0x76]
    ldrsh r1, [r0, #0x76]
    cmp r1, #0x90
    movge r1, #0x0
    strgeh r1, [r0, #0x76]
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0219a834
_LIT1: .word data_02197434
_LIT2: .word data_020c689c
_LIT3: .word data_020c68a8
_LIT4: .word data_020c68b4
_LIT5: .word data_020c68c0
