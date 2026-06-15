; func_0201f954 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c65e4
        .extern data_020c661c
        .extern data_020c6634
        .extern data_020c664c
        .extern data_020c6660
        .extern data_02191f40
        .extern data_02192020
        .extern func_0201f138
        .extern func_0201f19c
        .extern func_0201f874
        .extern func_0201fbb8
        .extern func_020928cc
        .extern func_020a6924
        .global func_0201f954
        .arm
func_0201f954:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0xc
    mov r4, r0
    ldrh r0, [r4, #0x2]
    cmp r0, #0x0
    beq .L_190
    bl func_0201f19c
    mov r0, #0x9
    bl func_0201f138
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
.L_190:
    ldr ip, _LIT0
    ldr r0, [ip, #0x30]
    cmp r0, #0x2
    beq .L_1c0
    bl func_0201fbb8
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r3, r4, pc}
    mov r0, #0x9
    bl func_0201f138
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
.L_1c0:
    ldrh r0, [r4, #0x8]
    cmp r0, #0x3
    addeq sp, sp, #0xc
    ldmeqia sp!, {r3, r4, pc}
    cmp r0, #0x4
    beq .L_360
    cmp r0, #0x5
    bne .L_360
    ldr r0, [ip, #0x38]
    cmp r0, #0x0
    beq .L_21c
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
.L_21c:
    ldr r0, _LIT2
    mov r1, #0xc0
    bl func_020928cc
    ldr r0, _LIT0
    ldr r0, [r0, #0x14]
    cmp r0, #0x0
    beq .L_27c
    ldr r0, _LIT2
    bl func_020a6924
    cmp r0, #0x0
    beq .L_27c
    ldr r0, _LIT0
    ldr r1, [r0, #0x38]
    cmp r1, #0x0
    beq .L_260
    ldr r0, _LIT3
    blx r1
.L_260:
    ldr r0, _LIT0
    ldr r1, [r0, #0x28]
    cmp r1, #0x0
    beq .L_360
    ldr r0, _LIT2
    blx r1
    b .L_360
.L_27c:
    ldrh r0, [r4, #0x36]
    mov r1, #0x0
    cmp r0, #0x10
    bcc .L_298
    ldrh r0, [r4, #0x38]
    cmp r0, #0x1
    moveq r1, #0x1
.L_298:
    cmp r1, #0x0
    beq .L_2b8
    ldr r0, _LIT0
    ldr r1, [r4, #0x3c]
    ldr r0, [r0, #0xa8]
    cmp r1, r0
    cmpne r1, #0x53
    beq .L_2d4
.L_2b8:
    ldr r0, _LIT0
    ldr r1, [r0, #0x38]
    cmp r1, #0x0
    beq .L_360
    ldr r0, _LIT4
    blx r1
    b .L_360
.L_2d4:
    ldrb r0, [r4, #0x43]
    and r0, r0, #0x3
    cmp r0, #0x1
    beq .L_300
    ldr r0, _LIT0
    ldr r1, [r0, #0x38]
    cmp r1, #0x0
    beq .L_360
    ldr r0, _LIT5
    blx r1
    b .L_360
.L_300:
    ldr r0, _LIT0
    ldr r1, [r0, #0x38]
    cmp r1, #0x0
    beq .L_318
    ldr r0, _LIT6
    blx r1
.L_318:
    ldr r0, _LIT0
    ldr r1, [r0, #0x28]
    cmp r1, #0x0
    beq .L_330
    ldr r0, _LIT2
    blx r1
.L_330:
    ldr r0, _LIT0
    ldrh r0, [r0]
    cmp r0, #0x0
    beq .L_360
    bl func_0201fbb8
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r3, r4, pc}
    mov r0, #0x9
    bl func_0201f138
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
.L_360:
    bl func_0201f874
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r3, r4, pc}
    mov r0, #0x9
    bl func_0201f138
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_02191f40
_LIT1: .word data_020c65e4
_LIT2: .word data_02192020
_LIT3: .word data_020c661c
_LIT4: .word data_020c6634
_LIT5: .word data_020c664c
_LIT6: .word data_020c6660
