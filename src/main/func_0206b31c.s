; func_0206b31c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101db0
        .extern data_02101df8
        .extern data_02101e18
        .extern data_02101e28
        .extern data_0219e3f0
        .extern func_02055320
        .extern func_02055330
        .extern func_02068c08
        .extern func_0206a314
        .extern func_0206b568
        .extern func_020a6d54
        .extern func_020a9950
        .extern func_020aadf8
        .global func_0206b31c
        .arm
func_0206b31c:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    movs r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bne .L_2e0
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x11c
    bl func_020a6d54
.L_2e0:
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    bne .L_300
    ldr r0, _LIT2
    ldr r0, [r0]
    cmp r0, #0x1
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, r6, r7, pc}
.L_300:
    mov r1, #0x1
    mov r0, r7
    str r1, [r7]
    bl func_0206b568
    mov r0, r7
    bl func_02068c08
    mov r1, r6
    add r0, r7, #0xc
    bl func_020aadf8
    mov r1, r5
    add r0, r7, #0x30
    bl func_020aadf8
    mov r1, r4
    add r0, r7, #0x54
    bl func_020aadf8
    ldr r0, [sp, #0x20]
    mov r2, #0x0
    str r0, [r7, #0x488]
    cmp r0, #0x0
    str r2, [r7, #0x48c]
    bne .L_364
    ldr r0, _LIT3
    ldr r1, _LIT1
    ldr r3, _LIT4
    bl func_020a6d54
.L_364:
    ldr r0, [sp, #0x24]
    ldr r1, _LIT5
    str r0, [r7, #0x494]
    str r1, [r7, #0x498]
    mov r3, #0x0
    str r3, [r7, #0x4a0]
    mvn r0, #0x0
    str r0, [r7, #0x4b0]
    str r3, [r7, #0x7c]
    str r3, [r7, #0x80]
    str r3, [r7, #0x8]
    str r0, [r7, #0x484]
    str r3, [r7, #0x480]
    ldr r2, [sp, #0x18]
    str r3, [r7, #0x4a4]
    mov r0, r7
    str r2, [r7, #0x4b8]
    bl func_0206a314
    mov r0, #0x0
    str r0, [r7, #0x5cc]
    bl func_02055330
    bl func_020a9950
    bl func_02055320
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_02101e18
_LIT1: .word data_02101db0
_LIT2: .word data_0219e3f0
_LIT3: .word data_02101e28
_LIT4: .word 0x00000132
_LIT5: .word data_02101df8
