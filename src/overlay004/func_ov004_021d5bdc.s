; func_ov004_021d5bdc - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fe468
        .extern func_0203268c
        .extern func_02032fc8
        .extern func_02032fe4
        .extern func_0203301c
        .extern func_02045678
        .extern func_02093bfc
        .extern func_ov004_021d38a4
        .extern func_ov004_021d3c8c
        .extern func_ov004_021d3dc8
        .extern func_ov004_021d3ddc
        .extern func_ov004_021d3de4
        .global func_ov004_021d5bdc
        .arm
func_ov004_021d5bdc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov004_021d38a4
    bl func_02045678
    cmp r0, #0x4
    bne .L_6c
    bl func_0203268c
    ldr r0, [r0, #0xeb4]
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
    bl func_ov004_021d3c8c
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    bge .L_90
    bl func_02093bfc
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
    bl func_0203268c
    ldr r1, _LIT1
    bl func_0203301c
    bl func_0203268c
    ldr r1, _LIT2
    bl func_02032fc8
    bl func_0203268c
    ldr r1, _LIT3
    bl func_02032fe4
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_020fe468
_LIT1: .word func_ov004_021d3dc8
_LIT2: .word func_ov004_021d3ddc
_LIT3: .word func_ov004_021d3de4
