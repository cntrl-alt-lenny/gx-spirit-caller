; func_0205d770 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100cac
        .extern data_02100cb4
        .extern data_02100ce4
        .extern data_02100cf0
        .extern func_02045398
        .extern func_020584b4
        .extern func_02058560
        .extern func_0205bce4
        .extern func_0205ff4c
        .extern func_0205ff60
        .extern func_02060250
        .extern func_02060358
        .extern func_020aaf60
        .extern func_020acd0c
        .global func_0205d770
        .arm
func_0205d770:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x20
    mov r6, r2
    mov r4, r1
    mov r1, r6
    mov r2, #0x1
    mov r5, r0
    bl func_02060358
    cmp r0, #0x0
    addne sp, sp, #0x20
    movne r0, #0x4
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r1, _LIT0
    mov r0, r6
    mov r2, #0x5
    bl func_020aaf60
    cmp r0, #0x0
    beq .L_74
    ldr r2, _LIT1
    mov r0, r5
    mov r1, #0x1
    bl func_0205ff60
    mov r0, r5
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    add sp, sp, #0x20
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, pc}
.L_74:
    ldr r1, _LIT2
    add r2, sp, #0x10
    mov r0, r6
    mov r3, #0x10
    bl func_02060250
    cmp r0, #0x0
    bne .L_bc
    ldr r2, _LIT1
    mov r0, r5
    mov r1, #0x1
    bl func_0205ff60
    mov r0, r5
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    add sp, sp, #0x20
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, pc}
.L_bc:
    add r0, sp, #0x10
    bl func_020acd0c
    ldr r2, [r4, #0xc]
    ldr r1, [r4, #0x10]
    mov r6, r0
    str r2, [sp, #0x8]
    str r1, [sp, #0xc]
    cmp r2, #0x0
    beq .L_138
    mov r0, #0x8
    bl func_02045398
    movs r3, r0
    bne .L_108
    ldr r1, _LIT3
    mov r0, r5
    bl func_0205ff4c
    add sp, sp, #0x20
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_108:
    str r6, [r3, #0x4]
    mov r0, #0x0
    str r0, [r3]
    str r4, [sp]
    str r0, [sp, #0x4]
    add r1, sp, #0x8
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_020584b4
    cmp r0, #0x0
    addne sp, sp, #0x20
    ldmneia sp!, {r4, r5, r6, pc}
.L_138:
    mov r0, r5
    mov r1, r4
    bl func_0205bce4
    mov r0, #0x0
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02100cac
_LIT1: .word data_02100cb4
_LIT2: .word data_02100ce4
_LIT3: .word data_02100cf0
