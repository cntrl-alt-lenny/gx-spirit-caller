; func_ov002_022a57b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cbe28
        .extern data_ov002_022cbfec
        .extern data_ov002_022cc008
        .extern data_ov002_022d0f2c
        .extern func_02006c0c
        .extern Task_Invoke
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_02037208
        .extern OS_SPrintf
        .extern func_ov002_0229a414
        .extern func_ov002_022a392c
        .extern func_ov002_022a3f44
        .extern func_ov002_022a4874
        .extern func_ov002_022a4c90
        .extern func_ov002_022a51cc
        .global func_ov002_022a57b8
        .arm
func_ov002_022a57b8:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x70
    mov r4, r2
    stmia r0, {r1, r4}
    mov r2, #0x0
    str r2, [r0, #0x8]
    str r2, [r0, #0xc]
    cmp r1, #0xa
    addls pc, pc, r1, lsl #0x2
    b .L_780
    b .L_780
    b .L_62c
    b .L_638
    b .L_644
    b .L_650
    b .L_668
    b .L_65c
    b .L_65c
    b .L_65c
    b .L_65c
    b .L_720
.L_62c:
    bl func_ov002_022a392c
    add sp, sp, #0x70
    ldmia sp!, {r4, pc}
.L_638:
    bl func_ov002_022a3f44
    add sp, sp, #0x70
    ldmia sp!, {r4, pc}
.L_644:
    bl func_ov002_022a4874
    add sp, sp, #0x70
    ldmia sp!, {r4, pc}
.L_650:
    bl func_ov002_022a4c90
    add sp, sp, #0x70
    ldmia sp!, {r4, pc}
.L_65c:
    bl func_ov002_022a51cc
    add sp, sp, #0x70
    ldmia sp!, {r4, pc}
.L_668:
    ldr r0, _LIT0
    ldr r0, [r0, #0xc8]
    cmp r0, #0x0
    beq .L_680
    mov r0, r2
    bl func_ov002_0229a414
.L_680:
    ldr r1, _LIT1
    add r0, sp, #0x50
    ldr r2, [r1, r4, lsl #0x2]
    ldr r1, _LIT2
    bl OS_SPrintf
    add r0, sp, #0x50
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r4, r0
    add r0, sp, #0x28
    bl func_0201d47c
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
    bl func_0201e5b8
    add r0, sp, #0x28
    bl func_0201d47c
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
    bl func_0201e5b8
    mov r0, r4
    bl Task_Invoke
    add sp, sp, #0x70
    ldmia sp!, {r4, pc}
.L_720:
    add r0, sp, #0x0
    bl func_0201d47c
    ldr r0, _LIT5
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
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
    bl func_0201e5b8
    ldr r0, [sp]
    bl Task_Invoke
    mov r0, #0x57
    sub r1, r0, #0x58
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_780:
    add sp, sp, #0x70
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d0f2c
_LIT1: .word data_ov002_022cbe28
_LIT2: .word data_ov002_022cbfec
_LIT3: .word 0x0000c980
_LIT4: .word 0x00004780
_LIT5: .word data_ov002_022cc008
_LIT6: .word 0x0000b980
