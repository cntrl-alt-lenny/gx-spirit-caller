; func_ov002_022a5bec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cc124
        .extern data_ov002_022cc13c
        .extern data_ov002_022cc154
        .extern data_ov002_022cc170
        .extern data_ov002_022cc18c
        .extern data_ov002_022cc1a8
        .extern data_ov002_022cc1bc
        .extern data_ov002_022cc1d4
        .extern data_ov002_022cd65c
        .extern func_02006bf0
        .extern func_02006e00
        .extern func_0201d428
        .extern func_0201e564
        .extern func_ov002_0229d710
        .extern func_ov002_0229e018
        .extern func_ov002_0229e3d8
        .extern func_ov002_0229e490
        .global func_ov002_022a5bec
        .arm
func_ov002_022a5bec:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x140
    mov r5, r0
    mov r2, #0x0
    str r2, [r5, #0x578]
    str r2, [r5, #0x580]
    str r2, [r5, #0x5b4]
    str r2, [r5, #0x5b8]
    str r2, [r5, #0x5c0]
    str r2, [r5, #0x5e4]
    ldr r0, _LIT0
    str r2, [r5, #0x5e8]
    add r3, r5, #0x500
    ldr r0, [r0, #0x4]
    ldrh r1, [r3, #0x90]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x1
    and r0, r0, #0x1
    orr r0, r1, r0
    strh r0, [r3, #0x90]
    ldrh r4, [r3, #0x90]
    ldr r0, _LIT1
    mov r1, #0x4
    bic r4, r4, #0x3e
    orr r4, r4, #0x16
    strh r4, [r3, #0x90]
    ldrh r4, [r3, #0x90]
    bic r4, r4, #0x3fc0
    strh r4, [r3, #0x90]
    ldrh r4, [r3, #0x90]
    bic r4, r4, #0x4000
    strh r4, [r3, #0x90]
    bl func_02006bf0
    mov r4, r0
    add r0, sp, #0x118
    bl func_0201d428
    add r1, sp, #0x100
    ldrh r3, [r1, #0x2c]
    mov r2, #0x0
    add r0, sp, #0x118
    bic r3, r3, #0xf
    str r4, [sp, #0x118]
    orr r3, r3, #0x9
    strh r3, [r1, #0x2c]
    str r2, [sp, #0x124]
    strh r2, [r1, #0x28]
    bl func_0201e564
    mov r0, r4
    bl func_02006e00
    ldr r0, _LIT2
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    mov r4, r0
    add r0, sp, #0xf0
    bl func_0201d428
    str r4, [sp, #0xf0]
    add r1, sp, #0x100
    ldrh r3, [r1, #0x4]
    ldr r2, _LIT3
    mov r0, #0x200
    strh r0, [r1]
    bic r0, r3, #0xf
    str r2, [sp, #0xfc]
    orr r0, r0, #0x9
    strh r0, [r1, #0x4]
    ldrh r2, [r1, #0x4]
    add r0, sp, #0xf0
    orr r2, r2, #0x10
    strh r2, [r1, #0x4]
    bl func_0201e564
    mov r0, r4
    bl func_02006e00
    ldr r0, _LIT4
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    mov r4, r0
    add r0, sp, #0xc8
    bl func_0201d428
    ldr r0, _LIT5
    mvn r1, #0x0
    ldrh r2, [sp, #0xdc]
    str r0, [sp, #0xd4]
    strh r1, [sp, #0xd8]
    bic r0, r2, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0xdc]
    ldrh r2, [sp, #0xdc]
    add r0, sp, #0xc8
    str r4, [sp, #0xc8]
    orr r1, r2, #0x10
    strh r1, [sp, #0xdc]
    bl func_0201e564
    mov r0, r4
    bl func_02006e00
    ldr r0, _LIT6
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    mov r4, r0
    add r0, sp, #0xa0
    bl func_0201d428
    mvn r0, #0x0
    ldr r1, _LIT7
    ldrh r2, [sp, #0xb4]
    strh r0, [sp, #0xb0]
    str r1, [sp, #0xac]
    bic r0, r2, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0xb4]
    ldrh r1, [sp, #0xb4]
    add r0, sp, #0xa0
    str r4, [sp, #0xa0]
    orr r1, r1, #0x10
    strh r1, [sp, #0xb4]
    bl func_0201e564
    mov r0, r4
    bl func_02006e00
    ldr r0, _LIT8
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    mov r4, r0
    add r0, sp, #0x78
    bl func_0201d428
    mvn r0, #0x0
    ldr r1, _LIT9
    ldrh r2, [sp, #0x8c]
    strh r0, [sp, #0x88]
    str r1, [sp, #0x84]
    bic r0, r2, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0x8c]
    ldrh r1, [sp, #0x8c]
    add r0, sp, #0x78
    str r4, [sp, #0x78]
    orr r1, r1, #0x10
    strh r1, [sp, #0x8c]
    bl func_0201e564
    mov r0, r4
    bl func_02006e00
    ldr r0, _LIT10
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    mov r4, r0
    add r0, sp, #0x50
    bl func_0201d428
    ldrh r0, [sp, #0x64]
    mov r2, #0x3400
    mov r1, #0x80
    bic r0, r0, #0xf
    orr r3, r0, #0x9
    add r0, sp, #0x50
    str r4, [sp, #0x50]
    strh r3, [sp, #0x64]
    str r2, [sp, #0x5c]
    strh r1, [sp, #0x60]
    bl func_0201e564
    mov r0, r4
    bl func_02006e00
    ldr r0, _LIT11
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    mov r4, r0
    add r0, sp, #0x28
    bl func_0201d428
    mov r0, #0x1a0
    ldr r1, _LIT12
    ldrh r2, [sp, #0x3c]
    strh r0, [sp, #0x38]
    str r4, [sp, #0x28]
    bic r0, r2, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0x3c]
    add r0, sp, #0x28
    str r1, [sp, #0x34]
    bl func_0201e564
    mov r0, r4
    bl func_02006e00
    ldr r0, _LIT13
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    mov r4, r0
    add r0, sp, #0x0
    bl func_0201d428
    mvn r0, #0x0
    ldrh r1, [sp, #0x14]
    str r0, [sp, #0xc]
    str r4, [sp]
    bic r0, r1, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0x14]
    mov r0, #0x1c0
    strh r0, [sp, #0x10]
    add r0, sp, #0x0
    bl func_0201e564
    mov r0, r4
    bl func_02006e00
    bl func_ov002_0229e3d8
    bl func_ov002_0229d710
    mov r6, #0x0
    add r7, r5, #0x280
    add r8, r5, #0x3e0
    mov r4, r6
.L_344:
    mov r5, r4
    mov r9, r7
.L_34c:
    mov r0, r9
    mov r1, r6
    add r2, r5, #0xc
    bl func_ov002_0229e490
    add r5, r5, #0x1
    cmp r5, #0x4
    add r9, r9, #0x2c
    blt .L_34c
    mov r0, r8
    mov r1, r6
    bl func_ov002_0229e018
    add r6, r6, #0x1
    cmp r6, #0x2
    add r7, r7, #0xb0
    add r8, r8, #0xcc
    blt .L_344
    add sp, sp, #0x140
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022cd65c
_LIT1: .word data_ov002_022cc124
_LIT2: .word data_ov002_022cc13c
_LIT3: .word 0x00009480
_LIT4: .word data_ov002_022cc154
_LIT5: .word 0x0000a080
_LIT6: .word data_ov002_022cc170
_LIT7: .word 0x0000a480
_LIT8: .word data_ov002_022cc18c
_LIT9: .word 0x0000b280
_LIT10: .word data_ov002_022cc1a8
_LIT11: .word data_ov002_022cc1bc
_LIT12: .word 0x00008980
_LIT13: .word data_ov002_022cc1d4
