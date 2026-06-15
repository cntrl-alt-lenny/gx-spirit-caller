; func_0205d7e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100d8c
        .extern data_02100d94
        .extern data_02100dc4
        .extern data_02100dd0
        .extern func_020453e8
        .extern func_02058528
        .extern func_020585d4
        .extern func_0205bd58
        .extern func_0205ffc0
        .extern func_0205ffd4
        .extern func_020602c4
        .extern func_020603cc
        .extern func_020ab054
        .extern func_020ace00
        .global func_0205d7e4
        .arm
func_0205d7e4:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x20
    mov r6, r2
    mov r4, r1
    mov r1, r6
    mov r2, #0x1
    mov r5, r0
    bl func_020603cc
    cmp r0, #0x0
    addne sp, sp, #0x20
    movne r0, #0x4
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r1, _LIT0
    mov r0, r6
    mov r2, #0x5
    bl func_020ab054
    cmp r0, #0x0
    beq .L_19c
    ldr r2, _LIT1
    mov r0, r5
    mov r1, #0x1
    bl func_0205ffd4
    mov r0, r5
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    add sp, sp, #0x20
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, pc}
.L_19c:
    ldr r1, _LIT2
    add r2, sp, #0x10
    mov r0, r6
    mov r3, #0x10
    bl func_020602c4
    cmp r0, #0x0
    bne .L_1e4
    ldr r2, _LIT1
    mov r0, r5
    mov r1, #0x1
    bl func_0205ffd4
    mov r0, r5
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    add sp, sp, #0x20
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, pc}
.L_1e4:
    add r0, sp, #0x10
    bl func_020ace00
    ldr r2, [r4, #0xc]
    ldr r1, [r4, #0x10]
    mov r6, r0
    str r2, [sp, #0x8]
    str r1, [sp, #0xc]
    cmp r2, #0x0
    beq .L_260
    mov r0, #0x8
    bl func_020453e8
    movs r3, r0
    bne .L_230
    ldr r1, _LIT3
    mov r0, r5
    bl func_0205ffc0
    add sp, sp, #0x20
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_230:
    str r6, [r3, #0x4]
    mov r0, #0x0
    str r0, [r3]
    str r4, [sp]
    str r0, [sp, #0x4]
    add r1, sp, #0x8
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_02058528
    cmp r0, #0x0
    addne sp, sp, #0x20
    ldmneia sp!, {r4, r5, r6, pc}
.L_260:
    mov r0, r5
    mov r1, r4
    bl func_0205bd58
    mov r0, #0x0
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02100d8c
_LIT1: .word data_02100d94
_LIT2: .word data_02100dc4
_LIT3: .word data_02100dd0
