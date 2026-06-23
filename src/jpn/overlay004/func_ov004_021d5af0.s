; func_ov004_021d5af0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fe388
        .extern func_02032638
        .extern func_02032f74
        .extern func_02032f90
        .extern func_02032fc8
        .extern func_020455d0
        .extern func_02093b08
        .extern func_ov004_021d37c4
        .extern func_ov004_021d3bac
        .extern func_ov004_021d3ce8
        .extern func_ov004_021d3cfc
        .extern func_ov004_021d3d04
        .global func_ov004_021d5af0
        .arm
func_ov004_021d5af0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov004_021d37c4
    bl func_020455d0
    cmp r0, #0x4
    bne .L_6c
    bl func_02032638
    ldr r0, [r0, #0xeac]
    tst r0, #0x1
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_50
    mov r0, #0x18
    str r0, [r4, #0x30]
    mov r0, #0x1
    str r0, [r4, #0x38]
    mov r0, #0x0
    str r0, [r4, #0x3c]
    b .L_cc
.L_50:
    mov r0, #0xf
    str r0, [r4, #0x30]
    mov r0, #0x1
    str r0, [r4, #0x38]
    mov r0, #0x0
    str r0, [r4, #0x3c]
    b .L_cc
.L_6c:
    mov r0, r4
    bl func_ov004_021d3bac
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    bge .L_90
    bl func_02093b08
    mvn r0, #0x0
    ldmia sp!, {r4, pc}
.L_90:
    cmp r0, #0x3
    mov r0, #0x1
    bne .L_b0
    mov r1, #0x0
    str r1, [r4, #0x30]
    str r0, [r4, #0x38]
    str r1, [r4, #0x3c]
    b .L_c0
.L_b0:
    str r0, [r4, #0x30]
    str r0, [r4, #0x38]
    mov r0, #0x0
    str r0, [r4, #0x3c]
.L_c0:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0]
.L_cc:
    bl func_02032638
    ldr r1, _LIT1
    bl func_02032fc8
    bl func_02032638
    ldr r1, _LIT2
    bl func_02032f74
    bl func_02032638
    ldr r1, _LIT3
    bl func_02032f90
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_020fe388
_LIT1: .word func_ov004_021d3ce8
_LIT2: .word func_ov004_021d3cfc
_LIT3: .word func_ov004_021d3d04
