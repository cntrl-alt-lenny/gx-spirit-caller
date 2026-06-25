; func_02034be4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fe3a0
        .extern data_0219b200
        .extern data_0219b264
        .extern data_0219b274
        .extern data_0219b28c
        .extern data_0219b2a4
        .extern data_0219b2bc
        .extern data_0219b2f0
        .extern data_0219b680
        .extern func_0203856c
        .extern func_0203875c
        .extern func_020388a0
        .extern func_02087de0
        .extern func_0209275c
        .global func_02034be4
        .arm
func_02034be4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r0, _LIT0
    mov r2, #0x0
    strh r2, [r0, #0x8]
    str r2, [r0, #0x48]
    sub r1, r2, #0x1
    strh r1, [r0, #0x4]
    ldr r0, _LIT1
    mov r4, r2
.L_24:
    str r4, [r0, r2, lsl #0x2]
    add r2, r2, #0x1
    cmp r2, #0x4
    blt .L_24
    ldr r8, _LIT2
    mov r7, #0x7f
    mov r5, r8
    mov r6, r7
.L_44:
    mov r0, r8
    mov r1, r7
    bl func_0203856c
    add r0, r5, r4, lsl #0x4
    add r4, r4, #0x1
    strh r6, [r0, #0xc]
    cmp r4, #0x3
    add r8, r8, #0x10
    blt .L_44
    mov r8, #0x0
    ldr r7, _LIT3
    mov r6, r8
    mvn r5, #0x0
    mov r4, r8
.L_7c:
    str r6, [r7, #0x34]
    strb r5, [r7, #0x6e]
    ldrsb r1, [r7, #0x6e]
    add r0, r7, #0x4
    strb r1, [r7, #0x6d]
    strb r1, [r7, #0x6a]
    strb r5, [r7, #0x6f]
    bl func_02087de0
    add r8, r8, #0x1
    str r4, [r7, #0x4]
    cmp r8, #0x1c
    add r7, r7, #0x78
    blt .L_7c
    bl func_0203875c
    ldr r0, _LIT4
    bl func_0209275c
    ldr r0, _LIT5
    bl func_0209275c
    ldr r0, _LIT6
    bl func_0209275c
    ldr r0, _LIT7
    bl func_0209275c
    mov r3, #0x0
    ldr r2, _LIT0
    ldr r1, _LIT8
    strh r3, [r2, #0x6]
    ldr r0, _LIT9
    str r3, [r2, #0x54]
    sub r2, r3, #0x1
    strh r2, [r1]
    bl func_020388a0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_0219b200
_LIT1: .word data_0219b264
_LIT2: .word data_0219b2f0
_LIT3: .word data_0219b680
_LIT4: .word data_0219b2a4
_LIT5: .word data_0219b28c
_LIT6: .word data_0219b274
_LIT7: .word data_0219b2bc
_LIT8: .word data_020fe3a0
_LIT9: .word 0x55555555
