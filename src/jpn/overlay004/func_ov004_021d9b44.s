; func_ov004_021d9b44 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_0220b2a0
        .extern data_ov004_0220e2a0
        .extern data_ov004_02291388
        .extern func_0201cffc
        .extern func_02034768
        .extern func_020371b8
        .extern func_ov004_021c9cac
        .extern func_ov004_021c9e10
        .extern func_ov004_021d8be4
        .extern func_ov004_021d9734
        .extern func_ov004_021d9768
        .extern func_ov004_021d9984
        .global func_ov004_021d9b44
        .arm
func_ov004_021d9b44:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    mvn r1, #0x0
    ldr r4, _LIT1
    str r1, [r0, #0xbd8]
    ldr r0, [r4, #0x5c]
    cmp r0, #0x0
    bne .L_510
    bl func_02034768
    cmp r0, #0x0
    bne .L_410
    mov r0, #0x1
    bl func_ov004_021c9cac
.L_410:
    ldr r0, [r4, #0x54]
    cmp r0, #0x4
    beq .L_428
    cmp r0, #0x5
    beq .L_45c
    b .L_510
.L_428:
    mov r0, #0x0
    bl func_0201cffc
    ldr r0, [r4, #0x220]
    cmp r0, #0x0
    beq .L_510
    ldr r0, _LIT2
    bl func_ov004_021d8be4
    mov r0, #0xe1
    bl func_ov004_021c9e10
    ldr r0, [r4, #0x54]
    add r0, r0, #0x1
    str r0, [r4, #0x54]
    b .L_510
.L_45c:
    bl func_ov004_021d9768
    ldr r0, [r4, #0x224]
    cmp r0, #0x0
    addne r0, r0, #0x1
    strne r0, [r4, #0x224]
    ldr r0, [r4, #0x228]
    cmp r0, #0x0
    addne r0, r0, #0x1
    strne r0, [r4, #0x228]
    ldr r0, [r4, #0x224]
    cmp r0, #0x1e
    ldrgt r0, [r4, #0x228]
    cmpgt r0, #0x1e
    ble .L_510
    bl func_ov004_021d9734
    cmp r0, #0x0
    beq .L_4e8
    ldr r1, [r4, #0x22c]
    mov r0, #0x1
    str r0, [r4, #0x234]
    cmp r1, #0x0
    beq .L_4c0
    cmp r1, #0x1
    beq .L_4c8
    b .L_4d0
.L_4c0:
    bl func_0201cffc
    b .L_4d0
.L_4c8:
    mov r0, #0x2
    bl func_0201cffc
.L_4d0:
    ldr r1, [r4, #0x54]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r4, #0x54]
    str r0, [r4, #0x78]
    b .L_510
.L_4e8:
    mov r1, #0x0
    mov r0, #0xea
    str r1, [r4, #0x228]
    str r1, [r4, #0x224]
    bl func_ov004_021c9e10
    mov r0, #0x42
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_510:
    bl func_ov004_021d9984
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov004_0220e2a0
_LIT1: .word data_ov004_0220b2a0
_LIT2: .word data_ov004_02291388
