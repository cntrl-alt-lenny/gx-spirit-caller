; func_02085214 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02084ef8
        .extern MTX_Copy44To43_
        .extern func_0208e534
        .extern func_0208e57c
        .global func_02085214
        .arm
func_02085214:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x40
    mov r6, r0
    mov r5, r1
    bl func_02084ef8
    ldr r0, _LIT0
    mov r2, #0x0
    ldr r1, _LIT1
    str r2, [r0]
    ldr r0, _LIT2
    str r2, [r1]
    str r2, [r0]
    cmp r6, #0x0
    beq .L_58
    add r4, sp, #0x0
.L_3c:
    mov r0, r4
    bl func_0208e57c
    cmp r0, #0x0
    bne .L_3c
    add r0, sp, #0x0
    mov r1, r6
    bl MTX_Copy44To43_
.L_58:
    cmp r5, #0x0
    beq .L_70
.L_60:
    mov r0, r5
    bl func_0208e534
    cmp r0, #0x0
    bne .L_60
.L_70:
    ldr r1, _LIT3
    mov r2, #0x1
    ldr r0, _LIT0
    str r2, [r1]
    mov r1, #0x2
    str r1, [r0]
    add sp, sp, #0x40
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x04000440
_LIT1: .word 0x04000444
_LIT2: .word 0x04000454
_LIT3: .word 0x04000448
