; func_ov004_021d9810 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104bac
        .extern data_ov004_0220b500
        .extern func_02006110
        .extern func_0200617c
        .extern func_02006194
        .extern func_02034888
        .extern func_02037208
        .extern func_ov004_021c9d8c
        .global func_ov004_021d9810
        .arm
func_ov004_021d9810:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0xc
    ldr r4, _LIT0
    mov r5, #0x0
    ldr r0, [r4, #0x5c]
    mov r6, r5
    cmp r0, #0x0
    addne sp, sp, #0xc
    movne r0, r5
    ldmneia sp!, {r3, r4, r5, r6, pc}
    ldr r0, [r4, #0x54]
    cmp r0, #0x5
    addne sp, sp, #0xc
    movne r0, r5
    ldmneia sp!, {r3, r4, r5, r6, pc}
    ldr r0, [r4, #0x224]
    cmp r0, #0x0
    addne sp, sp, #0xc
    movne r0, r5
    ldmneia sp!, {r3, r4, r5, r6, pc}
    bl func_02006194
    cmp r0, #0x0
    bne .L_68
    bl func_0200617c
    cmp r0, #0x0
    beq .L_b0
.L_68:
    add r0, sp, #0x8
    add r1, sp, #0x4
    bl func_02006110
    ldr r0, [sp, #0x8]
    cmp r0, #0xe4
    blt .L_d0
    cmp r0, #0xfe
    bge .L_d0
    ldr r0, [sp, #0x4]
    cmp r0, #0x2
    blt .L_d0
    cmp r0, #0x1e
    bge .L_d0
    mov r5, #0x1
    bl func_0200617c
    cmp r0, #0x0
    movne r6, r5
    b .L_d0
.L_b0:
    ldr r0, _LIT1
    ldrh r0, [r0, #0x54]
    tst r0, #0x2
    beq .L_d0
    ldr r0, [r4, #0x224]
    cmp r0, #0x0
    moveq r5, #0x1
    moveq r6, r5
.L_d0:
    cmp r6, #0x0
    beq .L_124
    ldr r0, [r4, #0x64]
    cmp r0, #0x0
    bne .L_124
    mov r6, #0x1
    rsb r3, r6, #0x10000
    mov r2, #0x4
    add r1, sp, #0x0
    mov r0, #0x3
    str r6, [r4, #0x64]
    strh r2, [sp]
    strh r3, [sp, #0x2]
    bl func_02034888
    mov r0, r6
    bl func_ov004_021c9d8c
    mov r0, #0x42
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, r6
    bl func_02037208
.L_124:
    mov r0, r5
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_ov004_0220b500
_LIT1: .word data_02104bac
