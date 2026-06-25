; func_02022e90 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c67bc
        .extern data_020c67c8
        .extern data_020c67d4
        .extern data_020c67e0
        .extern data_02197354
        .extern data_0219a754
        .extern func_02006bf0
        .extern func_02006e00
        .extern func_020070e8
        .extern func_0201e564
        .extern func_0201e618
        .extern func_0202bdf8
        .extern func_0202bea8
        .extern func_0202bf3c
        .extern func_0202c658
        .global func_02022e90
        .arm
func_02022e90:
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
    bne .L_208
    cmp r6, #0x2
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, [r5]
    cmp r0, #0x0
    beq .L_74
    cmp r0, #0x1
    beq .L_164
    cmp r0, #0x2
    beq .L_184
    b .L_1fc
.L_74:
    ldr r1, _LIT2
    add r0, r5, #0x4
    bl func_020070e8
    cmp r0, #0x0
    blt .L_d0
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
    bl func_0202bea8
    str r0, [r5, #0x38]
    b .L_1fc
.L_d0:
    ldr r1, _LIT3
    add r0, r5, #0x4
    bl func_020070e8
    cmp r0, #0x0
    blt .L_12c
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
    bl func_0202bf3c
    str r0, [r5, #0x38]
    b .L_1fc
.L_12c:
    ldr r1, _LIT4
    add r0, r5, #0x4
    bl func_020070e8
    cmp r0, #0x0
    add r0, r5, #0x4
    blt .L_150
    bl func_0202c658
    str r0, [r5, #0x38]
    b .L_1fc
.L_150:
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    str r0, [r5, #0x38]
    b .L_1fc
.L_164:
    add r0, r5, #0x4
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    str r0, [r5, #0x38]
    ldr r1, [r5, #0x2c]
    str r0, [r1]
    b .L_1fc
.L_184:
    ldr r1, _LIT5
    add r0, r5, #0x4
    bl func_020070e8
    cmp r0, #0x0
    blt .L_1dc
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
    bl func_0202bdf8
    b .L_1ec
.L_1dc:
    add r0, r5, #0x4
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
.L_1ec:
    str r0, [r5, #0x38]
    ldr r1, [r5, #0x38]
    ldr r0, [r5, #0x2c]
    str r1, [r0]
.L_1fc:
    cmp r6, #0x1
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, pc}
.L_208:
    ldr r0, [r5]
    cmp r0, #0x0
    beq .L_224
    cmp r0, #0x1
    cmpne r0, #0x2
    beq .L_238
    b .L_240
.L_224:
    ldr r0, [r5, #0x38]
    ldr r1, [r5, #0x24]
    ldr r2, [r5, #0x28]
    bl func_0201e618
    b .L_240
.L_238:
    ldr r0, [r5, #0x2c]
    bl func_0201e564
.L_240:
    ldr r0, [r5, #0x38]
    bl func_02006e00
    mov r0, #0x0
    str r0, [r5, #0x38]
    ldr r1, [r5, #0x30]
    cmp r1, #0x0
    beq .L_264
    ldr r0, [r5, #0x34]
    blx r1
.L_264:
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
_LIT0: .word data_0219a754
_LIT1: .word data_02197354
_LIT2: .word data_020c67bc
_LIT3: .word data_020c67c8
_LIT4: .word data_020c67d4
_LIT5: .word data_020c67e0
