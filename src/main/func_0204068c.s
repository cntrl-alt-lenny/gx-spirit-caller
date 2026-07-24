; func_0204068c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fe68c
        .extern data_020fe698
        .extern data_020fe6a0
        .extern data_020fe6a8
        .extern data_020fe6b0
        .extern data_020fe6b8
        .extern data_020fe6c0
        .extern data_020fe6c8
        .extern data_020fe6d0
        .extern data_020fe6d8
        .extern data_020fe6e0
        .extern data_020fe6e8
        .extern data_020fe6f0
        .extern data_020fe6f8
        .extern data_020fe700
        .extern data_020fe708
        .extern data_020fe720
        .extern data_020fe72c
        .extern func_020415c8
        .extern func_020416f8
        .extern OS_SNPrintf
        .extern func_020aaddc
        .extern func_020aee3c
        .global func_0204068c
        .arm
func_0204068c:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x28
    mov r4, r2
    mov r6, r0
    mov r5, r1
    mov ip, #0x2
    ldr r2, _LIT0
    add r0, sp, #0x4
    mov r1, #0x21
    mov r3, #0x1
    str ip, [sp]
    bl OS_SNPrintf
    add r0, sp, #0x4
    bl func_020aaddc
    mov r3, r0
    ldr r1, _LIT1
    mov r0, r6
    add r2, sp, #0x4
    bl func_020415c8
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, r5
    bl func_020aaddc
    mov r3, r0
    ldr r1, _LIT2
    mov r0, r6
    mov r2, r5
    bl func_020415c8
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    add r0, r5, #0xe
    bl func_020aaddc
    mov r3, r0
    ldr r1, _LIT3
    mov r0, r6
    add r2, r5, #0xe
    bl func_020415c8
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    add r0, r5, #0x41
    bl func_020aaddc
    mov r3, r0
    ldr r1, _LIT4
    mov r0, r6
    add r2, r5, #0x41
    bl func_020415c8
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    add r0, r5, #0x6f
    bl func_020aaddc
    mov r3, r0
    ldr r1, _LIT5
    mov r0, r6
    add r2, r5, #0x6f
    bl func_020415c8
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    add r0, r5, #0x15
    bl func_020aaddc
    mov r3, r0
    ldr r1, _LIT6
    mov r0, r6
    add r2, r5, #0x15
    bl func_020415c8
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    add r0, r5, #0x1a
    bl func_020aaddc
    mov r3, r0
    ldr r1, _LIT7
    mov r0, r6
    add r2, r5, #0x1a
    bl func_020415c8
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    add r0, r5, #0x1d
    bl func_020aaddc
    mov r3, r0
    ldr r1, _LIT8
    mov r0, r6
    add r2, r5, #0x1d
    bl func_020415c8
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    add r0, r5, #0x1f
    bl func_020aaddc
    mov r3, r0
    ldr r1, _LIT9
    mov r0, r6
    add r2, r5, #0x1f
    bl func_020415c8
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    add r0, r5, #0x2c
    bl func_020aaddc
    mov r3, r0
    ldr r1, _LIT10
    mov r0, r6
    add r2, r5, #0x2c
    bl func_020415c8
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    add r0, r5, #0x2f
    bl func_020aaddc
    mov r3, r0
    ldr r1, _LIT11
    mov r0, r6
    add r2, r5, #0x2f
    bl func_020415c8
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    add r0, r5, #0x34
    bl func_020aaddc
    mov r3, r0
    ldr r1, _LIT12
    mov r0, r6
    add r2, r5, #0x34
    bl func_020415c8
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    add r0, r5, #0x7e
    bl func_020aee3c
    mov r3, r0
    ldr r1, _LIT13
    mov r0, r6
    add r2, r5, #0x7e
    mov r3, r3, lsl #0x1
    bl func_020415c8
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    cmp r4, #0x1
    bne .L_2a4
    add r0, r5, #0x4e
    bl func_020aaddc
    mov r3, r0
    ldr r1, _LIT14
    mov r0, r6
    add r2, r5, #0x4e
    bl func_020415c8
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
.L_2a4:
    ldr r2, _LIT15
    mov ip, #0x2
    add r0, sp, #0x4
    mov r1, #0x21
    mov r3, #0x1
    str ip, [sp]
    bl OS_SNPrintf
    ldr r1, _LIT16
    add r2, sp, #0x4
    mov r0, r6
    bl func_020416f8
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r1, _LIT17
    mov r0, r6
    add r2, r5, #0x15
    bl func_020416f8
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    add sp, sp, #0x28
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_020fe68c
_LIT1: .word data_020fe698
_LIT2: .word data_020fe6a0
_LIT3: .word data_020fe6a8
_LIT4: .word data_020fe6b0
_LIT5: .word data_020fe6b8
_LIT6: .word data_020fe6c0
_LIT7: .word data_020fe6c8
_LIT8: .word data_020fe6d0
_LIT9: .word data_020fe6d8
_LIT10: .word data_020fe6e0
_LIT11: .word data_020fe6e8
_LIT12: .word data_020fe6f0
_LIT13: .word data_020fe6f8
_LIT14: .word data_020fe700
_LIT15: .word data_020fe708
_LIT16: .word data_020fe720
_LIT17: .word data_020fe72c
