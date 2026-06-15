; func_02011a94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b4a0c
        .global func_02011a94
        .arm
func_02011a94:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x20
    ldr r4, _LIT0
    add lr, sp, #0x0
    mov r5, r0
    mov ip, lr
    ldmia r4!, {r0, r1, r2, r3}
    stmia lr!, {r0, r1, r2, r3}
    ldmia r4, {r0, r1, r2, r3}
    stmia lr, {r0, r1, r2, r3}
    ldr r1, [sp]
    mov r0, #0x0
    cmp r5, r1
    addlt sp, sp, #0x20
    ldmltia sp!, {r3, r4, r5, pc}
.L_3c:
    add r0, r0, #0x1
    ldr r1, [ip, r0, lsl #0x2]
    cmp r5, r1
    bge .L_3c
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_020b4a0c
