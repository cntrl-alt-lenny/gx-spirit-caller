; func_02064f84 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101588
        .extern data_02101590
        .extern data_02101594
        .extern data_0219e928
        .extern data_0219e92c
        .extern func_0206e778
        .extern func_020a978c
        .global func_02064f84
        .arm
func_02064f84:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    movs r5, r2
    mov r4, r1
    bne .L_204
    ldr r2, _LIT0
    ldr r3, _LIT1
    ldr ip, [r2]
    mov r1, #0x16
    eor ip, ip, #0x1
    mla r5, ip, r1, r3
    str ip, [r2]
.L_204:
    cmp r0, #0x0
    beq .L_25c
    str r0, [sp]
    cmp r4, #0x0
    beq .L_23c
    add r0, sp, #0x0
    ldmia r0, {r0}
    bl func_0206e778
    mov r2, r0
    ldr r1, _LIT2
    mov r0, r5
    mov r3, r4
    bl func_020a978c
    b .L_27c
.L_23c:
    add r0, sp, #0x0
    ldmia r0, {r0}
    bl func_0206e778
    mov r2, r0
    ldr r1, _LIT3
    mov r0, r5
    bl func_020a978c
    b .L_27c
.L_25c:
    cmp r4, #0x0
    moveq r0, #0x0
    streqb r0, [r5]
    beq .L_27c
    ldr r1, _LIT4
    mov r0, r5
    mov r2, r4
    bl func_020a978c
.L_27c:
    mov r0, r5
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_0219e928
_LIT1: .word data_0219e92c
_LIT2: .word data_02101588
_LIT3: .word data_02101590
_LIT4: .word data_02101594
