; func_02034c34 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fe480
        .extern data_0219b2e0
        .extern data_0219b344
        .extern data_0219b354
        .extern data_0219b36c
        .extern data_0219b384
        .extern data_0219b39c
        .extern data_0219b3d0
        .extern data_0219b760
        .extern func_020385bc
        .extern func_020387ac
        .extern func_020388f0
        .extern func_02087ec8
        .extern func_02092844
        .global func_02034c34
        .arm
func_02034c34:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r0, _LIT0
    mov r2, #0x0
    strh r2, [r0, #0x8]
    str r2, [r0, #0x48]
    sub r1, r2, #0x1
    strh r1, [r0, #0x4]
    ldr r0, _LIT1
    mov r4, r2
.L_1d4:
    str r4, [r0, r2, lsl #0x2]
    add r2, r2, #0x1
    cmp r2, #0x4
    blt .L_1d4
    ldr r8, _LIT2
    mov r7, #0x7f
    mov r5, r8
    mov r6, r7
.L_1f4:
    mov r0, r8
    mov r1, r7
    bl func_020385bc
    add r0, r5, r4, lsl #0x4
    add r4, r4, #0x1
    strh r6, [r0, #0xc]
    cmp r4, #0x3
    add r8, r8, #0x10
    blt .L_1f4
    mov r8, #0x0
    ldr r7, _LIT3
    mov r6, r8
    mvn r5, #0x0
    mov r4, r8
.L_22c:
    str r6, [r7, #0x34]
    strb r5, [r7, #0x6e]
    ldrsb r1, [r7, #0x6e]
    add r0, r7, #0x4
    strb r1, [r7, #0x6d]
    strb r1, [r7, #0x6a]
    strb r5, [r7, #0x6f]
    bl func_02087ec8
    add r8, r8, #0x1
    str r4, [r7, #0x4]
    cmp r8, #0x1c
    add r7, r7, #0x78
    blt .L_22c
    bl func_020387ac
    ldr r0, _LIT4
    bl func_02092844
    ldr r0, _LIT5
    bl func_02092844
    ldr r0, _LIT6
    bl func_02092844
    ldr r0, _LIT7
    bl func_02092844
    mov r3, #0x0
    ldr r2, _LIT0
    ldr r1, _LIT8
    strh r3, [r2, #0x6]
    ldr r0, _LIT9
    str r3, [r2, #0x54]
    sub r2, r3, #0x1
    strh r2, [r1]
    bl func_020388f0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_0219b2e0
_LIT1: .word data_0219b344
_LIT2: .word data_0219b3d0
_LIT3: .word data_0219b760
_LIT4: .word data_0219b384
_LIT5: .word data_0219b36c
_LIT6: .word data_0219b354
_LIT7: .word data_0219b39c
_LIT8: .word data_020fe480
_LIT9: .word 0x55555555
