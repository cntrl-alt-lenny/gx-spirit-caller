; func_02064f10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021014a8
        .extern data_021014b0
        .extern data_021014b4
        .extern data_0219e848
        .extern data_0219e84c
        .extern func_0206e704
        .extern func_020a9698
        .global func_02064f10
        .arm
func_02064f10:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    movs r5, r2
    mov r4, r1
    bne .L_1b8
    ldr r2, _LIT0
    ldr r3, _LIT1
    ldr ip, [r2]
    mov r1, #0x16
    eor ip, ip, #0x1
    mla r5, ip, r1, r3
    str ip, [r2]
.L_1b8:
    cmp r0, #0x0
    beq .L_210
    str r0, [sp]
    cmp r4, #0x0
    beq .L_1f0
    add r0, sp, #0x0
    ldmia r0, {r0}
    bl func_0206e704
    mov r2, r0
    ldr r1, _LIT2
    mov r0, r5
    mov r3, r4
    bl func_020a9698
    b .L_230
.L_1f0:
    add r0, sp, #0x0
    ldmia r0, {r0}
    bl func_0206e704
    mov r2, r0
    ldr r1, _LIT3
    mov r0, r5
    bl func_020a9698
    b .L_230
.L_210:
    cmp r4, #0x0
    moveq r0, #0x0
    streqb r0, [r5]
    beq .L_230
    ldr r1, _LIT4
    mov r0, r5
    mov r2, r4
    bl func_020a9698
.L_230:
    mov r0, r5
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_0219e848
_LIT1: .word data_0219e84c
_LIT2: .word data_021014a8
_LIT3: .word data_021014b0
_LIT4: .word data_021014b4
