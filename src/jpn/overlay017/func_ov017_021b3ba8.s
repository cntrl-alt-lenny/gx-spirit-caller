; func_ov017_021b3ba8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104acc
        .extern data_02104e6c
        .extern data_ov017_021b7fa0
        .extern data_ov017_021b8510
        .extern data_ov017_021b899c
        .extern func_020371b8
        .extern func_ov017_021b2c5c
        .extern func_ov017_021b33c4
        .extern func_ov017_021b3d6c
        .extern func_ov017_021b4cb0
        .extern func_ov017_021b5030
        .extern func_ov017_021b7a5c
        .extern func_ov017_021b7aa0
        .global func_ov017_021b3ba8
        .arm
func_ov017_021b3ba8:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r2, [r1, #0x8]
    cmp r2, #0x0
    beq .L_830
    mov r0, r1
    bl func_ov017_021b7aa0
    cmp r0, #0x0
    beq .L_828
    ldr r0, _LIT0
    bl func_ov017_021b7a5c
    ldr r1, _LIT1
    mov r2, #0x0
    mov r0, r4
    str r2, [r1, #0xa78]
    bl func_ov017_021b33c4
.L_828:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_830:
    ldr r1, [r4, #0x4]
    cmp r1, #0x0
    beq .L_848
    cmp r1, #0x1
    beq .L_924
    b .L_98c
.L_848:
    ldr r1, _LIT2
    ldrh r2, [r1, #0x52]
    cmp r2, #0x0
    beq .L_8fc
    ldrh r1, [r1, #0x54]
    tst r1, #0x10
    beq .L_894
    ldr r0, [r4, #0xc]
    mov r2, #0x0
    add r0, r0, #0x1
    str r0, [r4, #0xc]
    cmp r0, #0x4
    movgt r0, #0x0
    strgt r0, [r4, #0xc]
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r3, #0x1
    bl func_020371b8
    b .L_98c
.L_894:
    tst r1, #0x20
    beq .L_8c8
    ldr r0, [r4, #0xc]
    mov r2, #0x0
    subs r0, r0, #0x1
    str r0, [r4, #0xc]
    movmi r0, #0x4
    strmi r0, [r4, #0xc]
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r3, #0x1
    bl func_020371b8
    b .L_98c
.L_8c8:
    tst r1, #0x1
    beq .L_8d8
    bl func_ov017_021b3d6c
    ldmia sp!, {r4, pc}
.L_8d8:
    tst r1, #0x2
    beq .L_98c
    mov r0, #0x42
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_8fc:
    ldr r1, [r4, #0xc]
    ldr r2, _LIT3
    mov r0, #0xa
    mla r0, r1, r0, r2
    bl func_ov017_021b2c5c
    cmp r0, #0x0
    beq .L_98c
    mov r0, r4
    bl func_ov017_021b3d6c
    ldmia sp!, {r4, pc}
.L_924:
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_93c
    cmp r0, #0x1
    beq .L_95c
    b .L_98c
.L_93c:
    ldr r0, _LIT4
    bl func_ov017_021b5030
    cmp r0, #0x0
    beq .L_98c
    ldr r0, [r4, #0x8]
    add r0, r0, #0x1
    str r0, [r4, #0x8]
    b .L_98c
.L_95c:
    ldr r0, _LIT4
    bl func_ov017_021b4cb0
    cmp r0, #0x0
    beq .L_98c
    mov r0, r4
    bl func_ov017_021b33c4
    mov r1, #0x0
    str r1, [r4, #0x4]
    ldr r0, _LIT4
    str r1, [r4, #0x8]
    ldr r0, [r0, #0x4]
    str r0, [r4, #0xc]
.L_98c:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov017_021b899c
_LIT1: .word data_02104e6c
_LIT2: .word data_02104acc
_LIT3: .word data_ov017_021b7fa0
_LIT4: .word data_ov017_021b8510
