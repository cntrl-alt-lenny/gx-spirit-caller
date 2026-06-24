; func_0205c34c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100a74
        .extern data_02100a84
        .extern data_02100ac4
        .extern data_02100ad4
        .extern data_02100ad8
        .extern data_02100ae0
        .extern func_02054008
        .extern func_02054b28
        .extern func_02057fc4
        .extern func_02057ffc
        .extern func_0205802c
        .extern func_02058134
        .extern func_020a6c60
        .extern func_020aace8
        .global func_0205c34c
        .arm
func_0205c34c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x18
    movs r7, r1
    mov r8, r0
    mov r6, r2
    mov r5, r3
    bne .L_30
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x340
    bl func_020a6c60
.L_30:
    cmp r5, #0x0
    bne .L_4c
    ldr r0, _LIT2
    ldr r1, _LIT1
    ldr r3, _LIT3
    mov r2, #0x0
    bl func_020a6c60
.L_4c:
    mov r0, r5
    bl func_020aace8
    add r1, sp, #0x0
    mov r2, #0x0
    str r2, [r1]
    str r2, [r1, #0x4]
    str r2, [r1, #0x8]
    str r2, [r1, #0xc]
    str r2, [r1, #0x10]
    str r2, [r1, #0x14]
    mov r4, r0
    ldr r2, _LIT4
    mov r0, r8
    str r6, [sp, #0x10]
    bl func_02057ffc
    cmp r0, #0x0
    addne sp, sp, #0x18
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    add r1, sp, #0x0
    mov r0, r8
    mov r2, r6
    bl func_02057fc4
    cmp r0, #0x0
    addne sp, sp, #0x18
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r2, _LIT5
    add r1, sp, #0x0
    mov r0, r8
    bl func_02057ffc
    cmp r0, #0x0
    addne sp, sp, #0x18
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    add r1, sp, #0x0
    mov r0, r8
    mov r2, r4
    bl func_02057fc4
    cmp r0, #0x0
    addne sp, sp, #0x18
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r2, _LIT6
    add r1, sp, #0x0
    mov r0, r8
    bl func_02057ffc
    cmp r0, #0x0
    addne sp, sp, #0x18
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr ip, [sp, #0x8]
    add r1, sp, #0x0
    mov r0, r8
    mov r2, r5
    mov r3, r4
    str ip, [sp, #0x14]
    bl func_0205802c
    cmp r0, #0x0
    addne sp, sp, #0x18
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    add r1, sp, #0x0
    mov r0, r8
    mov r2, #0x0
    bl func_02058134
    cmp r0, #0x0
    addne sp, sp, #0x18
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, [r7, #0x38]
    add r1, sp, #0x0
    bl func_02054008
    mov r0, #0x0
    bl func_02054b28
    add r0, r0, #0x12c
    str r0, [r7, #0x10]
    mov r0, #0x0
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_02100a74
_LIT1: .word data_02100a84
_LIT2: .word data_02100ac4
_LIT3: .word 0x00000341
_LIT4: .word data_02100ad4
_LIT5: .word data_02100ad8
_LIT6: .word data_02100ae0
