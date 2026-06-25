; func_0205cdcc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100bd8
        .extern func_02053de4
        .extern func_0205405c
        .extern func_020540cc
        .extern func_0205790c
        .global func_0205cdcc
        .arm
func_0205cdcc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0xc
    mov r8, r1
    ldr r1, [r8, #0x30]
    mov r9, r0
    cmp r1, #0x0
    addne sp, sp, #0xc
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, pc}
    ldr r0, [r8, #0x38]
    bl func_020540cc
    cmp r0, #0x0
    beq .L_348
    ldr r5, _LIT0
    add r4, sp, #0x8
    mov r7, #0x0
.L_2c8:
    ldr r0, [r8, #0x38]
    mov r1, r7
    bl func_0205405c
    mov r6, r0
    str r7, [sp]
    str r5, [sp, #0x4]
    ldr r1, [r8, #0x8]
    mov r0, r9
    mov r2, r6
    mov r3, r4
    bl func_0205790c
    ldr r1, [sp, #0x8]
    cmp r1, #0x0
    bne .L_308
    cmp r0, #0x0
    beq .L_31c
.L_308:
    mov r0, #0x6a
    str r0, [r8]
    add sp, sp, #0xc
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_31c:
    ldr r1, [r6, #0xc]
    ldr r0, [r6, #0x8]
    cmp r1, r0
    bne .L_348
    ldr r0, [r8, #0x38]
    mov r1, r7
    bl func_02053de4
    ldr r0, [r8, #0x38]
    bl func_020540cc
    cmp r0, #0x0
    bne .L_2c8
.L_348:
    mov r0, #0x0
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_02100bd8
