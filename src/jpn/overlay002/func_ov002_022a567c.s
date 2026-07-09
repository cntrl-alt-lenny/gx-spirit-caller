; func_ov002_022a567c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cbd34
        .extern data_ov002_022cbef8
        .extern data_ov002_022cbf14
        .extern data_ov002_022d0e4c
        .extern func_02006bf0
        .extern func_02006e00
        .extern func_0201d428
        .extern func_0201e564
        .extern func_020371b8
        .extern func_02091554
        .extern func_ov002_0229a304
        .extern func_ov002_022a381c
        .extern func_ov002_022a3e34
        .extern func_ov002_022a4764
        .extern func_ov002_022a4b80
        .extern func_ov002_022a50bc
        .global func_ov002_022a567c
        .arm
func_ov002_022a567c:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x70
    mov r4, r2
    stmia r0, {r1, r4}
    mov r2, #0x0
    str r2, [r0, #0x8]
    str r2, [r0, #0xc]
    cmp r1, #0xa
    addls pc, pc, r1, lsl #0x2
    b .L_754
    b .L_754
    b .L_600
    b .L_60c
    b .L_618
    b .L_624
    b .L_63c
    b .L_630
    b .L_630
    b .L_630
    b .L_630
    b .L_6f4
.L_600:
    bl func_ov002_022a381c
    add sp, sp, #0x70
    ldmia sp!, {r4, pc}
.L_60c:
    bl func_ov002_022a3e34
    add sp, sp, #0x70
    ldmia sp!, {r4, pc}
.L_618:
    bl func_ov002_022a4764
    add sp, sp, #0x70
    ldmia sp!, {r4, pc}
.L_624:
    bl func_ov002_022a4b80
    add sp, sp, #0x70
    ldmia sp!, {r4, pc}
.L_630:
    bl func_ov002_022a50bc
    add sp, sp, #0x70
    ldmia sp!, {r4, pc}
.L_63c:
    ldr r0, _LIT0
    ldr r0, [r0, #0xc8]
    cmp r0, #0x0
    beq .L_654
    mov r0, r2
    bl func_ov002_0229a304
.L_654:
    ldr r1, _LIT1
    add r0, sp, #0x50
    ldr r2, [r1, r4, lsl #0x2]
    ldr r1, _LIT2
    bl func_02091554
    add r0, sp, #0x50
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    mov r4, r0
    add r0, sp, #0x28
    bl func_0201d428
    ldrh r0, [sp, #0x3c]
    ldr r2, _LIT3
    mvn r1, #0x0
    bic r0, r0, #0xf
    orr r3, r0, #0x9
    add r0, sp, #0x28
    str r4, [sp, #0x28]
    strh r3, [sp, #0x3c]
    str r2, [sp, #0x34]
    strh r1, [sp, #0x38]
    bl func_0201e564
    add r0, sp, #0x28
    bl func_0201d428
    ldrh r0, [sp, #0x3c]
    ldr r2, _LIT4
    mvn r1, #0x0
    bic r0, r0, #0xf
    orr r3, r0, #0x4
    add r0, sp, #0x28
    str r4, [sp, #0x28]
    strh r3, [sp, #0x3c]
    str r2, [sp, #0x34]
    strh r1, [sp, #0x38]
    bl func_0201e564
    mov r0, r4
    bl func_02006e00
    add sp, sp, #0x70
    ldmia sp!, {r4, pc}
.L_6f4:
    add r0, sp, #0x0
    bl func_0201d428
    ldr r0, _LIT5
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    ldr r2, _LIT6
    ldrh r1, [sp, #0x14]
    str r0, [sp]
    str r2, [sp, #0xc]
    bic r0, r1, #0xf
    orr r3, r0, #0x9
    mvn r1, #0x0
    add r0, sp, #0x0
    strh r3, [sp, #0x14]
    strh r1, [sp, #0x10]
    bl func_0201e564
    ldr r0, [sp]
    bl func_02006e00
    mov r0, #0x57
    sub r1, r0, #0x58
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_754:
    add sp, sp, #0x70
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d0e4c
_LIT1: .word data_ov002_022cbd34
_LIT2: .word data_ov002_022cbef8
_LIT3: .word 0x0000c980
_LIT4: .word 0x00004780
_LIT5: .word data_ov002_022cbf14
_LIT6: .word 0x0000b980
