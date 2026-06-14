; func_ov019_021b3488 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov019_021b6920
        .extern func_0208c884
        .extern func_ov019_021b35dc
        .extern func_ov019_021b56f8
        .extern func_ov019_021b573c
        .global func_ov019_021b3488
        .arm
func_ov019_021b3488:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r1, [r5]
    mov r4, #0x0
    cmp r1, #0x0
    beq .L_44c
    cmp r1, #0x1
    beq .L_4cc
    cmp r1, #0x2
    beq .L_528
    b .L_55c
.L_44c:
    ldr r1, [r5, #0x4]
    ldr r0, _LIT0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    sub r1, r1, #0x10
    bl func_0208c884
    ldr r1, [r5, #0x4]
    ldr r0, _LIT1
    sub r1, r1, #0x10
    bl func_0208c884
    ldr r2, [r5, #0x4]
    mov r1, #0xd
    sub r2, r2, #0x10
    mul ip, r2, r1
    rsb r0, r1, #0x20c
    ldr r3, _LIT2
    and r0, ip, r0
    str r0, [r3]
    ldr r2, [r5, #0x4]
    rsb r0, r1, #0x20c
    sub r2, r2, #0x10
    mul r1, r2, r1
    and r0, r1, r0
    str r0, [r3, #0x4]
    ldr r0, [r5, #0x4]
    cmp r0, #0x10
    blt .L_55c
    mov r0, #0x1
    str r0, [r5]
    mov r0, r4
    str r0, [r5, #0x4]
    b .L_55c
.L_4cc:
    ldr r1, _LIT3
    ldr r2, [r1, #0x8]
    cmp r2, #0x0
    beq .L_508
    mov r0, r1
    bl func_ov019_021b573c
    cmp r0, #0x0
    beq .L_55c
    ldr r0, _LIT3
    bl func_ov019_021b56f8
    mov r0, #0x2
    str r0, [r5]
    mov r0, r4
    str r0, [r5, #0x4]
    b .L_55c
.L_508:
    bl func_ov019_021b35dc
    cmp r0, #0x0
    beq .L_55c
    mov r0, #0x2
    str r0, [r5]
    mov r0, r4
    str r0, [r5, #0x4]
    b .L_55c
.L_528:
    ldr r1, [r5, #0x4]
    ldr r0, _LIT0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    rsb r1, r1, #0x0
    bl func_0208c884
    ldr r1, [r5, #0x4]
    ldr r0, _LIT1
    rsb r1, r1, #0x0
    bl func_0208c884
    ldr r0, [r5, #0x4]
    cmp r0, #0x10
    movge r4, #0x1
.L_55c:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x0400006c
_LIT1: .word 0x0400106c
_LIT2: .word 0x04000014
_LIT3: .word data_ov019_021b6920
