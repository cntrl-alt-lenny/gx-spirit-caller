; func_0201a778 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b59e0
        .extern data_020b5ab8
        .extern data_020c5c7c
        .extern data_020c5c90
        .extern func_0201a4dc
        .extern OS_SPrintf
        .global func_0201a778
        .arm
func_0201a778:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x5c
    mov r5, r0
    mov r4, r1
    bl func_0201a4dc
    ldr r1, _LIT0
    mov r7, r0
    add r3, sp, #0x0
    ldmia r1, {r0, r1, r2}
    stmia r3, {r0, r1, r2}
    ldr r6, _LIT1
    add lr, sp, #0xc
    mov ip, #0x5
.L_34:
    ldmia r6!, {r0, r1, r2, r3}
    stmia lr!, {r0, r1, r2, r3}
    subs ip, ip, #0x1
    bne .L_34
    cmp r5, #0x0
    add r0, sp, #0xc
    bne .L_68
    ldr r2, [r0, r5, lsl #0x2]
    ldr r1, _LIT2
    mov r0, r4
    bl OS_SPrintf
    add sp, sp, #0x5c
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_68:
    cmp r7, #0x3
    moveq r1, #0xa
    movne r1, #0x0
    add r2, sp, #0x0
    sub r3, r7, #0x1
    add r1, r5, r1
    ldr r2, [r2, r3, lsl #0x2]
    ldr r3, [r0, r1, lsl #0x2]
    ldr r1, _LIT3
    mov r0, r4
    bl OS_SPrintf
    add sp, sp, #0x5c
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_020b59e0
_LIT1: .word data_020b5ab8+0x78
_LIT2: .word data_020c5c7c
_LIT3: .word data_020c5c90
