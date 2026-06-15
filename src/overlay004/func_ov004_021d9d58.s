; func_ov004_021d9d58 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_0220b500
        .extern data_ov004_0220e500
        .extern data_ov004_022915e8
        .extern func_0201d050
        .extern func_020347b8
        .extern func_02037208
        .extern func_ov004_021c9d8c
        .extern func_ov004_021c9ef0
        .extern func_ov004_021d8cd0
        .extern func_ov004_021d9948
        .extern func_ov004_021d997c
        .extern func_ov004_021d9b98
        .global func_ov004_021d9d58
        .arm
func_ov004_021d9d58:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    mvn r1, #0x0
    ldr r4, _LIT1
    str r1, [r0, #0xbd8]
    ldr r0, [r4, #0x5c]
    cmp r0, #0x0
    bne .L_510
    bl func_020347b8
    cmp r0, #0x0
    bne .L_410
    mov r0, #0x1
    bl func_ov004_021c9d8c
.L_410:
    ldr r0, [r4, #0x54]
    cmp r0, #0x4
    beq .L_428
    cmp r0, #0x5
    beq .L_45c
    b .L_510
.L_428:
    mov r0, #0x0
    bl func_0201d050
    ldr r0, [r4, #0x220]
    cmp r0, #0x0
    beq .L_510
    ldr r0, _LIT2
    bl func_ov004_021d8cd0
    mov r0, #0xe1
    bl func_ov004_021c9ef0
    ldr r0, [r4, #0x54]
    add r0, r0, #0x1
    str r0, [r4, #0x54]
    b .L_510
.L_45c:
    bl func_ov004_021d997c
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
    bl func_ov004_021d9948
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
    bl func_0201d050
    b .L_4d0
.L_4c8:
    mov r0, #0x2
    bl func_0201d050
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
    bl func_ov004_021c9ef0
    mov r0, #0x42
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_510:
    bl func_ov004_021d9b98
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov004_0220e500
_LIT1: .word data_ov004_0220b500
_LIT2: .word data_ov004_022915e8
