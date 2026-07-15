; func_02019494 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b5ab8
        .extern func_0201942c
        .extern func_0202c0c0
        .global func_02019494
        .arm
func_02019494:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x48
    ldr r4, _LIT0
    add lr, sp, #0x0
    mov r6, r0
    mov r5, r1
    mov ip, #0x4
.L_1c:
    ldmia r4!, {r0, r1, r2, r3}
    stmia lr!, {r0, r1, r2, r3}
    subs ip, ip, #0x1
    bne .L_1c
    ldmia r4, {r0, r1}
    stmia lr, {r0, r1}
    mov r0, r6
    bl func_0201942c
    cmp r0, #0x0
    beq .L_58
    add r0, sp, #0x0
    sub r1, r6, #0x4c
    add sp, sp, #0x48
    ldr r0, [r0, r1, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_58:
    ldr r0, _LIT1
    cmp r5, #0x0
    addne r0, r0, #0x64
    cmp r6, #0x5e
    beq .L_78
    cmp r6, #0x5f
    moveq r6, #0x3a
    b .L_7c
.L_78:
    mov r6, #0x3
.L_7c:
    add r0, r0, r6
    bl func_0202c0c0
    add sp, sp, #0x48
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_020b5ab8+0x30
_LIT1: .word 0x00000578
