; func_020569e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffe84
        .extern func_02045364
        .extern func_020576bc
        .extern func_0205d44c
        .extern func_0205d600
        .extern func_0205d648
        .extern func_0205ff4c
        .global func_020569e4
        .arm
func_020569e4:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r4, r0
    add r2, sp, #0x0
    ldr r5, [r4]
    bl func_0205d648
    cmp r0, #0x0
    bne .L_38
    ldr r1, _LIT0
    mov r0, r4
    bl func_0205ff4c
    add sp, sp, #0x4
    mov r0, #0x2
    ldmia sp!, {r4, r5, pc}
.L_38:
    ldr r1, [sp]
    ldr r0, [r1, #0x10]
    cmp r0, #0x0
    bne .L_60
    ldr r1, _LIT0
    mov r0, r4
    bl func_0205ff4c
    add sp, sp, #0x4
    mov r0, #0x2
    ldmia sp!, {r4, r5, pc}
.L_60:
    mov r0, r4
    bl func_020576bc
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, pc}
    ldr r1, [sp]
    ldr r0, [r1, #0x14]
    sub r0, r0, #0x1
    str r0, [r1, #0x14]
    ldr r0, [r5, #0x100]
    cmp r0, #0x0
    bne .L_d0
    ldr r1, [sp]
    ldr r0, [r1, #0x14]
    cmp r0, #0x0
    bgt .L_d0
    ldr r0, [r1, #0x10]
    bl func_02045364
    ldr r0, [sp]
    mov r1, #0x0
    str r1, [r0, #0x10]
    ldr r0, [sp]
    bl func_0205d44c
    cmp r0, #0x0
    beq .L_d0
    ldr r1, [sp]
    mov r0, r4
    bl func_0205d600
.L_d0:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_020ffe84
