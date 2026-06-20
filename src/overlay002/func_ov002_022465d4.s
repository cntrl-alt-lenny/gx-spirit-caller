; func_ov002_022465d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cacbc
        .extern data_ov002_022cd744
        .extern data_ov002_022cd968
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern func_0202e234
        .extern func_ov002_021ae4a0
        .extern func_ov002_021af9d0
        .extern func_ov002_021b04c8
        .extern func_ov002_02245100
        .extern func_ov002_02245dd4
        .extern func_ov002_022461d8
        .extern func_ov002_02258168
        .extern func_ov002_022582b4
        .extern func_ov002_022583b4
        .extern func_ov002_02258500
        .extern func_ov002_022592b8
        .extern func_ov002_0228c1d0
        .extern func_ov002_0229cd88
        .extern func_ov002_0229cdb8
        .global func_ov002_022465d4
        .arm
func_ov002_022465d4:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x100
    ldr r1, _LIT0
    ldr r3, [r1, #0x680]
    ldr r4, [r1, #0x684]
    cmp r3, #0x15
    bgt .L_46c
    bge .L_728
    cmp r3, #0xb
    bgt .L_460
    cmp r3, #0x0
    addge pc, pc, r3, lsl #0x2
    b .L_858
    b .L_488
    b .L_4c0
    b .L_5f8
    b .L_858
    b .L_858
    b .L_4c0
    b .L_858
    b .L_858
    b .L_858
    b .L_858
    b .L_638
    b .L_65c
.L_460:
    cmp r3, #0x14
    beq .L_6ec
    b .L_858
.L_46c:
    cmp r3, #0x1e
    bgt .L_47c
    beq .L_778
    b .L_858
.L_47c:
    cmp r3, #0x32
    beq .L_81c
    b .L_858
.L_488:
    bl func_ov002_021b04c8
    cmp r0, #0x0
    mov r1, #0x0
    beq .L_4ac
    ldr r0, _LIT0
    add sp, sp, #0x100
    str r1, [r0, #0x688]
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_4ac:
    ldr r0, _LIT0
    str r1, [r0, #0x68c]
    ldr r1, [r0, #0x680]
    add r1, r1, #0x1
    str r1, [r0, #0x680]
.L_4c0:
    ldr r0, _LIT0
    ldrb r0, [r0, #0x5dc]
    cmp r0, #0x1f
    cmpne r0, #0x20
    cmpne r0, #0x21
    bne .L_504
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_02245dd4
    cmp r0, #0x0
    bne .L_504
    ldr r0, _LIT0
    mov r1, #0x32
    str r1, [r0, #0x680]
    add sp, sp, #0x100
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_504:
    ldr r0, _LIT1
    ldr r0, [r0, r4, lsl #0x2]
    cmp r0, #0x1
    bne .L_55c
    mov r0, r4
    mov r1, #0x1
    bl func_ov002_02245dd4
    cmp r0, #0x0
    beq .L_54c
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_0228c1d0
    cmp r0, #0x0
    beq .L_54c
    ldr r0, _LIT0
    mov r1, #0xb
    str r1, [r0, #0x680]
    b .L_5ec
.L_54c:
    ldr r0, _LIT0
    mov r1, #0x32
    str r1, [r0, #0x680]
    b .L_5ec
.L_55c:
    cmp r0, #0x2
    bne .L_574
    ldr r0, _LIT0
    mov r1, #0x14
    str r1, [r0, #0x680]
    b .L_5ec
.L_574:
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_02245dd4
    cmp r0, #0x0
    add r0, sp, #0x0
    bne .L_5b4
    mov r1, #0xcc
    bl func_ov002_0229cd88
    ldr r1, _LIT2
    add r0, sp, #0x0
    bl func_ov002_0229cdb8
    add r0, sp, #0x0
    mov r1, #0xce
    bl func_ov002_0229cdb8
    mov r1, #0x0
    b .L_5c8
.L_5b4:
    bl func_ov002_022461d8
    mov r0, r4
    mov r1, #0x1
    bl func_ov002_02245dd4
    add r1, r0, #0x1
.L_5c8:
    ldr r0, _LIT0
    ldr r0, [r0, #0x680]
    cmp r0, #0x5
    moveq r1, #0x3
    add r0, sp, #0x0
    bl func_ov002_021ae4a0
    ldr r0, _LIT0
    mov r1, #0x2
    str r1, [r0, #0x680]
.L_5ec:
    add sp, sp, #0x100
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_5f8:
    ldr r0, _LIT3
    ldr r2, [r0, #0xd44]
    cmp r2, #0x0
    bne .L_61c
    mov r0, #0x32
    str r0, [r1, #0x680]
    add sp, sp, #0x100
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_61c:
    mov r2, #0xa
    str r2, [r1, #0x680]
    mov r1, #0x0
    str r1, [r0, #0xd50]
    add sp, sp, #0x100
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_638:
    mov r0, #0x4
    bl func_ov002_022592b8
    ldr r1, _LIT0
    add sp, sp, #0x100
    ldr r2, [r1, #0x680]
    mov r0, #0x1
    add r2, r2, #0x1
    str r2, [r1, #0x680]
    ldmia sp!, {r4, pc}
.L_65c:
    ldr r0, _LIT3
    ldr r2, [r0, #0xd50]
    cmp r2, #0x0
    bne .L_680
    mov r0, #0x5
    str r0, [r1, #0x680]
    add sp, sp, #0x100
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_680:
    ldr r2, [r0, #0xd64]
    cmp r2, #0x1
    beq .L_6a8
    cmp r2, #0x3
    bne .L_6d8
    mov r0, #0x1e
    str r0, [r1, #0x680]
    add sp, sp, #0x100
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_6a8:
    ldr r3, [r0, #0xd74]
    ldr r0, [r0, #0xd70]
    sub r1, r3, #0xb
    mvn r2, #0x0
    bl func_ov002_021af9d0
    ldr r1, _LIT0
    add sp, sp, #0x100
    ldr r2, [r1, #0x680]
    mov r0, #0x1
    sub r2, r2, #0x1
    str r2, [r1, #0x680]
    ldmia sp!, {r4, pc}
.L_6d8:
    sub r0, r3, #0x1
    str r0, [r1, #0x680]
    add sp, sp, #0x100
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_6ec:
    mov r0, #0x1
    bl func_ov002_02245100
    ldr r2, _LIT0
    mov r0, #0x0
    str r0, [r2, #0x68c]
    ldr r1, _LIT4
    add sp, sp, #0x100
    ldr r3, [r1, #0x300]
    mov r0, #0x1
    bic r3, r3, #0x20
    str r3, [r1, #0x300]
    ldr r1, [r2, #0x680]
    add r1, r1, #0x1
    str r1, [r2, #0x680]
    ldmia sp!, {r4, pc}
.L_728:
    ldr r0, _LIT4
    ldr r0, [r0, #0x300]
    mov r0, r0, lsl #0x1a
    movs r0, r0, lsr #0x1f
    addeq sp, sp, #0x100
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
    ldr r0, [r1, #0x68c]
    cmp r0, #0x0
    bne .L_764
    mov r0, #0x32
    str r0, [r1, #0x680]
    add sp, sp, #0x100
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_764:
    mov r0, #0x1e
    str r0, [r1, #0x680]
    add sp, sp, #0x100
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_778:
    ldr r0, _LIT3
    ldr r2, [r0, #0xd74]
    sub r1, r2, #0xb
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b .L_7e4
    b .L_7a4
    b .L_7d4
    b .L_7d4
    b .L_7d4
    b .L_7d4
.L_7a4:
    ldr r0, [r0, #0xd5c]
    bl func_0202e234
    cmp r0, #0x0
    beq .L_7c0
    mov r0, #0x0
    bl func_ov002_022582b4
    b .L_7ec
.L_7c0:
    mov r1, #0x0
    mov r2, r1
    mov r0, #0x1
    bl func_ov002_022583b4
    b .L_7ec
.L_7d4:
    ldr r1, [r0, #0xd70]
    mov r0, #0x0
    bl func_ov002_02258500
    b .L_7ec
.L_7e4:
    mov r0, #0x0
    bl func_ov002_02258168
.L_7ec:
    ldr r0, _LIT3
    ldr r0, [r0, #0xd50]
    cmp r0, #0x0
    addne sp, sp, #0x100
    mov r0, #0x1
    ldmneia sp!, {r4, pc}
    ldr r1, _LIT0
    mov r2, #0x0
    str r0, [r1, #0x68c]
    str r2, [r1, #0x688]
    add sp, sp, #0x100
    ldmia sp!, {r4, pc}
.L_81c:
    rsb r2, r4, #0x1
    ldr r0, _LIT3
    str r2, [r1, #0x684]
    ldr r0, [r0, #0xcec]
    cmp r2, r0
    mov r0, #0x0
    strne r0, [r1, #0x680]
    addne sp, sp, #0x100
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
    str r0, [r1, #0x5d4]
    str r0, [r1, #0x688]
    add sp, sp, #0x100
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_858:
    mov r0, #0x1
    add sp, sp, #0x100
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cd744
_LIT2: .word data_ov002_022cacbc
_LIT3: .word data_ov002_022d016c
_LIT4: .word data_ov002_022cd968
