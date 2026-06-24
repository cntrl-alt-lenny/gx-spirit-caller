; func_0201f900 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c6504
        .extern data_020c653c
        .extern data_020c6554
        .extern data_020c656c
        .extern data_020c6580
        .extern data_02191e60
        .extern data_02191f40
        .extern func_0201f0e4
        .extern func_0201f148
        .extern func_0201f820
        .extern func_0201fb64
        .extern func_020927e4
        .extern func_020a6830
        .global func_0201f900
        .arm
func_0201f900:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0xc
    mov r4, r0
    ldrh r0, [r4, #0x2]
    cmp r0, #0x0
    beq .L_2c
    bl func_0201f148
    mov r0, #0x9
    bl func_0201f0e4
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
.L_2c:
    ldr ip, _LIT0
    ldr r0, [ip, #0x30]
    cmp r0, #0x2
    beq .L_5c
    bl func_0201fb64
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r3, r4, pc}
    mov r0, #0x9
    bl func_0201f0e4
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
.L_5c:
    ldrh r0, [r4, #0x8]
    cmp r0, #0x3
    addeq sp, sp, #0xc
    ldmeqia sp!, {r3, r4, pc}
    cmp r0, #0x4
    beq .L_1fc
    cmp r0, #0x5
    bne .L_1fc
    ldr r0, [ip, #0x38]
    cmp r0, #0x0
    beq .L_b8
    ldrb r1, [r4, #0xd]
    ldr r0, _LIT1
    str r1, [sp]
    ldrb r1, [r4, #0xe]
    str r1, [sp, #0x4]
    ldrb r1, [r4, #0xf]
    str r1, [sp, #0x8]
    ldrb r1, [r4, #0xa]
    ldrb r2, [r4, #0xb]
    ldrb r3, [r4, #0xc]
    ldr ip, [ip, #0x38]
    blx ip
.L_b8:
    ldr r0, _LIT2
    mov r1, #0xc0
    bl func_020927e4
    ldr r0, _LIT0
    ldr r0, [r0, #0x14]
    cmp r0, #0x0
    beq .L_118
    ldr r0, _LIT2
    bl func_020a6830
    cmp r0, #0x0
    beq .L_118
    ldr r0, _LIT0
    ldr r1, [r0, #0x38]
    cmp r1, #0x0
    beq .L_fc
    ldr r0, _LIT3
    blx r1
.L_fc:
    ldr r0, _LIT0
    ldr r1, [r0, #0x28]
    cmp r1, #0x0
    beq .L_1fc
    ldr r0, _LIT2
    blx r1
    b .L_1fc
.L_118:
    ldrh r0, [r4, #0x36]
    mov r1, #0x0
    cmp r0, #0x10
    bcc .L_134
    ldrh r0, [r4, #0x38]
    cmp r0, #0x1
    moveq r1, #0x1
.L_134:
    cmp r1, #0x0
    beq .L_154
    ldr r0, _LIT0
    ldr r1, [r4, #0x3c]
    ldr r0, [r0, #0xa8]
    cmp r1, r0
    cmpne r1, #0x53
    beq .L_170
.L_154:
    ldr r0, _LIT0
    ldr r1, [r0, #0x38]
    cmp r1, #0x0
    beq .L_1fc
    ldr r0, _LIT4
    blx r1
    b .L_1fc
.L_170:
    ldrb r0, [r4, #0x43]
    and r0, r0, #0x3
    cmp r0, #0x1
    beq .L_19c
    ldr r0, _LIT0
    ldr r1, [r0, #0x38]
    cmp r1, #0x0
    beq .L_1fc
    ldr r0, _LIT5
    blx r1
    b .L_1fc
.L_19c:
    ldr r0, _LIT0
    ldr r1, [r0, #0x38]
    cmp r1, #0x0
    beq .L_1b4
    ldr r0, _LIT6
    blx r1
.L_1b4:
    ldr r0, _LIT0
    ldr r1, [r0, #0x28]
    cmp r1, #0x0
    beq .L_1cc
    ldr r0, _LIT2
    blx r1
.L_1cc:
    ldr r0, _LIT0
    ldrh r0, [r0]
    cmp r0, #0x0
    beq .L_1fc
    bl func_0201fb64
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r3, r4, pc}
    mov r0, #0x9
    bl func_0201f0e4
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
.L_1fc:
    bl func_0201f820
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r3, r4, pc}
    mov r0, #0x9
    bl func_0201f0e4
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_02191e60
_LIT1: .word data_020c6504
_LIT2: .word data_02191f40
_LIT3: .word data_020c653c
_LIT4: .word data_020c6554
_LIT5: .word data_020c656c
_LIT6: .word data_020c6580
