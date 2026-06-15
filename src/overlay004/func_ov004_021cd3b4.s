; func_ov004_021cd3b4 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_02104c94
        .extern data_02104f4c
        .extern data_ov004_02209cc8
        .extern data_ov004_0220b500
        .extern func_02001d68
        .extern func_02005dac
        .extern func_02006c0c
        .extern func_02006e1c
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_0202c0c0
        .extern func_0208e0a0
        .extern func_02091554
        .extern func_02094504
        .extern func_02094550
        .extern func_ov004_021ca0a4
        .extern func_ov004_021cb568
        .extern func_ov004_021cb63c
        .extern func_ov004_021cb778
        .global func_ov004_021cd3b4
        .arm
func_ov004_021cd3b4:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x58
    ldr r5, _LIT0
    ldr r0, [r5, #0x8c]
    cmp r0, #0x100
    addle sp, sp, #0x58
    ldmleia sp!, {r4, r5, r6, pc}
    ldr r0, [r5, #0x74]
    cmp r0, #0x0
    ldr r0, [r5, #0x94]
    beq .L_eb4
    cmp r0, #0x0
    bne .L_d34
    bl func_0208e0a0
    mov r1, r0
    add r0, r5, #0x258
    add r0, r0, #0x5000
    add r1, r1, #0x200
    mov r2, #0x280
    bl func_02094550
    ldr r0, _LIT1
    add r0, r0, #0xb00
    ldrsb r0, [r0, #0xcd]
    bl func_02001d68
    ldr r1, _LIT2
    mov r0, #0x2
    mov r2, #0x80
    bl func_ov004_021cb63c
    ldr r1, _LIT1
    add r0, sp, #0x38
    ldr r2, [r1, #0xba8]
    ldr r1, _LIT3
    and r4, r2, #0x1f
    and r2, r2, #0x3e0
    mov r2, r2, asr #0x5
    sub r3, r2, #0x1
    mov r2, #0xa
    mla r2, r3, r2, r4
    bl func_02091554
    add r0, sp, #0x38
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r4, r0
    add r0, sp, #0x10
    bl func_0201d47c
    mvn r0, #0x0
    ldr r1, _LIT4
    ldrh r2, [sp, #0x24]
    strh r0, [sp, #0x20]
    str r1, [sp, #0x1c]
    bic r0, r2, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0x24]
    ldrh r1, [sp, #0x24]
    add r0, sp, #0x10
    str r4, [sp, #0x10]
    orr r1, r1, #0x10
    strh r1, [sp, #0x24]
    bl func_0201e5b8
    mov r0, r4
    bl func_02006e1c
    ldr r0, _LIT5
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    mov r6, #0x0
    mov r4, #0x80
.L_d0c:
    add r0, r6, #0xbb
    add r0, r0, #0x300
    bl func_0202c0c0
    mov r1, r0
    mov r2, r4
    add r0, r6, #0x3
    bl func_ov004_021cb63c
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_d0c
.L_d34:
    ldr r0, [r5, #0xa4]
    ldr r1, [r5, #0x8c]
    rsb r0, r0, #0x81
    and r0, r0, #0xff
    add r1, r1, #0x17
    orr r0, r0, #0x2000
    ldr r2, _LIT6
    mov r1, r1, lsl #0x17
    orr r0, r0, #-1073741824
    orr r0, r0, r1, lsr #0x7
    str r0, [sp, #0x8]
    mov r0, #0x2
    mov r1, #0x0
    strh r2, [sp, #0xc]
    bl func_02005dac
    ldr r3, [sp, #0x8]
    ldr r1, [sp, #0xc]
    str r3, [r0]
    str r1, [r0, #0x4]
    mov r0, #0x80
    str r0, [sp]
    ldr r0, [r5, #0xa4]
    mov r2, #0x2
    rsb r1, r0, #0x81
    mov r3, r2
    mov r0, #0x4e
    bl func_ov004_021cb778
    ldr r0, [r5, #0xb0]
    mov r2, #0x9
    cmp r0, #0x1
    moveq r1, #0x1
    mov r0, #0x3
    movne r1, #0x0
    str r0, [sp]
    add r0, r1, #0xf
    str r0, [sp, #0x4]
    ldr r1, [r5, #0xa4]
    add r0, r5, #0xf90
    rsb r3, r1, #0x63
    add r0, r0, #0x5000
    mov r1, #0x2
    bl func_ov004_021ca0a4
    ldr r0, [r5, #0xb0]
    mov r2, #0x75
    cmp r0, #0x2
    moveq r1, #0x1
    mov r0, #0x3
    movne r1, #0x0
    str r0, [sp]
    add r0, r1, #0xf
    str r0, [sp, #0x4]
    ldr r1, [r5, #0xa4]
    add r0, r5, #0xf90
    rsb r3, r1, #0x63
    add r0, r0, #0x5000
    mov r1, #0x2
    bl func_ov004_021ca0a4
    mov r0, #0x80
    str r0, [sp]
    ldr r1, [r5, #0xa4]
    mov r2, #0x3
    mov r3, r2
    sub r0, r0, #0x84
    rsb r1, r1, #0x68
    bl func_ov004_021cb778
    mov r0, #0x80
    str r0, [sp]
    ldr r1, [r5, #0xa4]
    mov r0, #0x68
    rsb r1, r1, #0x68
    mov r2, #0x4
    mov r3, #0x3
    bl func_ov004_021cb778
    ldr r0, [r5, #0x90]
    cmp r0, #0x0
    bne .L_e80
    ldr r1, [r5, #0xa4]
    mov r0, #0x9
    rsb r1, r1, #0x63
    mov r2, #0x67
    mov r3, #0x18
    bl func_ov004_021cb568
    b .L_ea0
.L_e80:
    cmp r0, #0x1
    bne .L_ea0
    ldr r1, [r5, #0xa4]
    mov r0, #0x75
    rsb r1, r1, #0x63
    mov r2, #0x67
    mov r3, #0x18
    bl func_ov004_021cb568
.L_ea0:
    ldr r0, [r5, #0x94]
    cmp r0, #0x5
    addlt r0, r0, #0x1
    strlt r0, [r5, #0x94]
    b .L_edc
.L_eb4:
    cmp r0, #0x0
    ble .L_edc
    subs r0, r0, #0x1
    str r0, [r5, #0x94]
    bne .L_edc
    bl func_0208e0a0
    add r1, r0, #0x200
    mov r0, #0x0
    mov r2, #0x280
    bl func_02094504
.L_edc:
    mov r0, #0x0
    str r0, [r5, #0xa4]
    add sp, sp, #0x58
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov004_0220b500
_LIT1: .word data_021040ac
_LIT2: .word data_02104c94
_LIT3: .word data_ov004_02209cc8
_LIT4: .word 0x00004080
_LIT5: .word data_02104f4c
_LIT6: .word 0x00002881
