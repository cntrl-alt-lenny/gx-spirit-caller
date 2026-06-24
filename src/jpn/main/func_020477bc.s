; func_020477bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219db94
        .extern data_0219db98
        .extern data_0219db9c
        .extern func_020477bc
        .extern func_02047b94
        .extern func_02047e14
        .extern func_02047f44
        .extern func_02052fb0
        .extern func_02053308
        .extern func_02055b90
        .extern func_02055bfc
        .extern func_02055db4
        .extern func_020aae4c
        .global func_020477bc
        .arm
func_020477bc:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4c
    mov r4, r1
    ldr r1, [r4]
    mov r5, r0
    cmp r1, #0x0
    addne sp, sp, #0x4c
    ldmneia sp!, {r4, r5, pc}
    ldr r1, _LIT0
    ldr r2, [r1]
    ldr r1, [r2, #0x4]
    cmp r1, #0x3
    bne .L_dc
    ldrsb r1, [r4, #0x8e]
    cmp r1, #0x0
    bne .L_b4
    ldr r0, [r2, #0x1c]
    ldr r1, [r2, #0xc]
    add r2, sp, #0x8
    add r0, r0, #0x4
    bl func_02053308
    ldr r1, _LIT1
    add r2, sp, #0x8
    mov r0, r5
    bl func_02055b90
    bl func_02047f44
    cmp r0, #0x0
    addne sp, sp, #0x4c
    ldmneia sp!, {r4, r5, pc}
    ldr r0, _LIT0
    mov r3, #0x4
    ldr r1, [r0]
    ldr r0, _LIT2
    str r3, [r1, #0x4]
    mov r2, #0x0
    str r0, [sp]
    str r2, [sp, #0x4]
    ldr r1, [r4, #0x4]
    mov r0, r5
    mov r3, r2
    bl func_02055bfc
    bl func_02047f44
    add sp, sp, #0x4c
    cmp r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_b4:
    bl func_02055db4
    ldr r0, _LIT3
    mov r1, #0x0
    bl func_02047b94
    ldr r0, _LIT0
    mov r1, #0x1
    ldr r0, [r0]
    add sp, sp, #0x4c
    str r1, [r0, #0x4]
    ldmia sp!, {r4, r5, pc}
.L_dc:
    cmp r1, #0x4
    addne sp, sp, #0x4c
    ldmneia sp!, {r4, r5, pc}
    ldr r0, [r2, #0x1c]
    ldr r1, [r2, #0xc]
    add r2, sp, #0x1d
    add r0, r0, #0x4
    bl func_02053308
    add r1, sp, #0x1d
    add r0, r4, #0x8e
    bl func_020aae4c
    cmp r0, #0x0
    bne .L_174
    ldr r0, _LIT0
    add r2, sp, #0x32
    ldr r0, [r0]
    ldr r1, [r0, #0xc]
    add r0, r0, #0x3c
    bl func_02053308
    ldr r0, _LIT0
    ldr r2, [r4, #0x4]
    ldr r1, [r0]
    ldr r0, [r1, #0x1c]
    add r1, r1, #0x3c
    bl func_02052fb0
    mov r0, r5
    bl func_02055db4
    ldr r0, _LIT0
    ldr r1, _LIT4
    ldr r4, [r0]
    ldr r0, _LIT5
    ldr r2, [r1]
    ldr r3, [r0]
    add r0, r4, #0x48
    add r1, r4, #0x148
    blx r3
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, pc}
.L_174:
    ldr r0, _LIT2
    mov r2, #0x0
    str r0, [sp]
    str r2, [sp, #0x4]
    ldr r1, [r4, #0x4]
    mov r0, r5
    mov r3, r2
    bl func_02055bfc
    bl func_02047f44
    cmp r0, #0x0
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_0219db98
_LIT1: .word 0x00000705
_LIT2: .word func_020477bc
_LIT3: .word func_02047e14
_LIT4: .word data_0219db94
_LIT5: .word data_0219db9c
