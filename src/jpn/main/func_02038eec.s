; func_02038eec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fe3e0
        .extern data_0219c3a0
        .global func_02038eec
        .arm
func_02038eec:
    stmdb sp!, {r3, r4, r5, lr}
    ldr ip, _LIT0
    mov r5, r1
    cmp r1, #0x0
    movlt r5, #0x0
    ldr r3, _LIT1
    add r4, r0, #0x14
    strh r2, [ip, #0x6]
    add lr, r0, #0x34
    strh r5, [r3]
    add r2, r4, r5, lsl #0x2
    str r2, [ip, #0x10]
    add r2, lr, r5, lsl #0x2
    str r2, [ip, #0xc]
    cmp r1, #0x0
    ldmgeia sp!, {r3, r4, r5, pc}
    mov r4, #0x0
    ldr r1, _LIT2
    mov r3, r4
.L_1ac:
    add r2, r0, r4, lsl #0x2
    str r3, [r2, #0x34]
    add r4, r4, #0x1
    str r1, [r2, #0x14]
    cmp r4, #0x8
    blt .L_1ac
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_0219c3a0
_LIT1: .word data_020fe3e0
_LIT2: .word 0x0000ffff
