; func_0205fe48 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0210110c
        .extern data_02101114
        .extern data_02101144
        .extern func_02045398
        .extern func_020584b4
        .extern func_02058560
        .extern func_0205bce4
        .extern func_0205ff4c
        .extern func_0205ff60
        .extern func_02060358
        .extern func_020aaf60
        .global func_0205fe48
        .arm
func_0205fe48:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r4, r2
    mov r5, r1
    mov r1, r4
    mov r2, #0x1
    mov r6, r0
    bl func_02060358
    cmp r0, #0x0
    addne sp, sp, #0x10
    movne r0, #0x4
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r1, _LIT0
    mov r0, r4
    mov r2, #0x4
    bl func_020aaf60
    cmp r0, #0x0
    beq .L_118
    ldr r2, _LIT1
    mov r0, r6
    mov r1, #0x1
    bl func_0205ff60
    mov r0, r6
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    add sp, sp, #0x10
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, pc}
.L_118:
    ldr r1, [r5, #0xc]
    ldr r0, [r5, #0x10]
    cmp r1, #0x0
    str r1, [sp, #0x8]
    str r0, [sp, #0xc]
    beq .L_184
    mov r0, #0x4
    bl func_02045398
    movs r3, r0
    bne .L_158
    ldr r1, _LIT2
    mov r0, r6
    bl func_0205ff4c
    add sp, sp, #0x10
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_158:
    mov r0, #0x0
    str r0, [r3]
    str r5, [sp]
    str r0, [sp, #0x4]
    add r1, sp, #0x8
    mov r0, r6
    ldmia r1, {r1, r2}
    bl func_020584b4
    cmp r0, #0x0
    addne sp, sp, #0x10
    ldmneia sp!, {r4, r5, r6, pc}
.L_184:
    mov r0, r6
    mov r1, r5
    bl func_0205bce4
    mov r0, #0x0
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0210110c
_LIT1: .word data_02101114
_LIT2: .word data_02101144
