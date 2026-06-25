; func_0203f918 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fe4fc
        .extern data_020fe504
        .extern data_020fe510
        .extern data_020fe51c
        .extern data_020fe524
        .extern data_020fe52c
        .extern data_020fe538
        .extern data_020fe544
        .extern data_0219d8f0
        .extern data_0219d8f4
        .extern data_021aa380
        .extern func_02040d04
        .extern func_02040d44
        .extern func_02040d98
        .extern func_02043494
        .extern func_020aace8
        .extern func_020acc44
        .extern func_020acd0c
        .global func_0203f918
        .arm
func_0203f918:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    str r1, [sp]
    add r0, r0, #0x1000
    ldr r0, [r0, #0x314]
    ldr r1, _LIT1
    bl func_02040d98
    str r0, [sp]
    cmp r0, #0x0
    beq .L_38
    bl func_02043494
.L_38:
    ldr r0, _LIT0
    mov r2, #0x0
    ldr r1, [r0]
    ldr r0, _LIT2
    str r2, [sp]
    str r2, [r0]
    add r0, r1, #0x1000
    ldr r0, [r0, #0x314]
    ldr r1, _LIT3
    bl func_02040d98
    bl func_020acd0c
    ldr r1, _LIT2
    ldr r1, [r1]
    cmp r1, #0x22
    bne .L_94
    ldr r0, _LIT0
    ldr r2, _LIT4
    ldr r1, [r0]
    add sp, sp, #0x4
    add r1, r1, #0x1000
    str r2, [r1, #0x8]
    mov r0, #0xc
    ldmia sp!, {r4, r5, pc}
.L_94:
    cmp r0, #0xc8
    beq .L_c0
    ldr r2, _LIT0
    ldr r1, _LIT5
    ldr r2, [r2]
    add r1, r0, r1
    add r0, r2, #0x1000
    str r1, [r0, #0x8]
    add sp, sp, #0x4
    mov r0, #0x12
    ldmia sp!, {r4, r5, pc}
.L_c0:
    ldr r0, _LIT0
    ldr r2, _LIT6
    ldr r3, [r0]
    ldr r1, _LIT7
    add r0, r3, #0x1000
    ldr r0, [r0, #0x314]
    add r2, r3, r2
    mov r3, #0x4
    bl func_02040d44
    cmp r0, #0x0
    bgt .L_10c
    ldr r0, _LIT0
    ldr r2, _LIT4
    ldr r1, [r0]
    add sp, sp, #0x4
    add r1, r1, #0x1000
    str r2, [r1, #0x8]
    mov r0, #0xe
    ldmia sp!, {r4, r5, pc}
.L_10c:
    ldr r1, _LIT0
    ldr r0, _LIT6
    ldr r2, [r1]
    add r1, sp, #0x0
    add r0, r2, r0
    mov r2, #0xa
    bl func_020acc44
    ldr r2, _LIT0
    ldr r1, _LIT6
    ldr r5, [r2]
    mov r4, r0
    add r0, r5, r1
    bl func_020aace8
    ldr r1, _LIT6
    ldr r2, [sp]
    add r1, r5, r1
    add r0, r1, r0
    cmp r2, r0
    ldrne r1, _LIT4
    addne r0, r5, #0x1000
    strne r1, [r0, #0x8]
    addne sp, sp, #0x4
    movne r0, #0xc
    ldmneia sp!, {r4, r5, pc}
    ldr r0, _LIT8
    add r1, r5, #0x1000
    add r0, r4, r0
    str r0, [r1, #0x8]
    cmp r4, #0x64
    bge .L_2a8
    ldr ip, _LIT0
    mov r0, #0x0
    ldr r1, [ip]
    ldr r5, _LIT9
    add r1, r1, #0x1000
    strb r0, [r1, #0x52]
    ldr r2, [ip]
    ldr r1, _LIT10
    add r2, r2, #0x1000
    strb r0, [r2, #0x1f]
    ldr r2, [ip]
    ldr r3, _LIT11
    add r2, r2, #0x1000
    strb r0, [r2, #0x17f]
    ldr r2, [ip]
    add r2, r2, #0x1000
    strb r0, [r2, #0x10]
    ldr r2, [ip]
    add r2, r2, #0x1000
    strb r0, [r2, #0x188]
    ldr r2, [ip]
    add r0, r2, #0x1000
    ldr r0, [r0, #0x314]
    add r2, r2, r5
    bl func_02040d44
    ldr r0, _LIT0
    ldr r2, _LIT12
    ldr r3, [r0]
    ldr r1, _LIT13
    add r0, r3, #0x1000
    add r2, r3, r2
    ldr r0, [r0, #0x314]
    mov r3, #0x33
    bl func_02040d44
    ldr r0, _LIT0
    ldr r2, _LIT14
    ldr r3, [r0]
    ldr r1, _LIT15
    add r0, r3, #0x1000
    add r2, r3, r2
    ldr r0, [r0, #0x314]
    mov r3, #0x9
    bl func_02040d44
    ldr r0, _LIT0
    ldr r2, _LIT16
    ldr r3, [r0]
    ldr r1, _LIT17
    add r0, r3, #0x1000
    add r2, r3, r2
    ldr r0, [r0, #0x314]
    mov r3, #0xf
    bl func_02040d44
    ldr r0, _LIT0
    ldr r2, _LIT18
    ldr r3, [r0]
    ldr r1, _LIT19
    add r0, r3, #0x1000
    add r2, r3, r2
    ldr r0, [r0, #0x314]
    mov r3, #0x41
    bl func_02040d04
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    cmp r4, #0x28
    add r0, r0, #0x1000
    strb r1, [r0, #0x1b3]
    ldrne r0, _LIT20
    movne r1, #0x1
    strne r1, [r0]
    ldreq r0, _LIT20
    moveq r1, #0x2
    streq r1, [r0]
.L_2a8:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_0219d8f4
_LIT1: .word data_020fe4fc
_LIT2: .word data_021aa380
_LIT3: .word data_020fe504
_LIT4: .word 0x00004e85
_LIT5: .word 0x000059d8
_LIT6: .word 0x0000100c
_LIT7: .word data_020fe510
_LIT8: .word 0x00004e20
_LIT9: .word 0x00001052
_LIT10: .word data_020fe51c
_LIT11: .word 0x0000012d
_LIT12: .word 0x0000101f
_LIT13: .word data_020fe524
_LIT14: .word 0x0000117f
_LIT15: .word data_020fe52c
_LIT16: .word 0x00001010
_LIT17: .word data_020fe538
_LIT18: .word 0x00001188
_LIT19: .word data_020fe544
_LIT20: .word data_0219d8f0
