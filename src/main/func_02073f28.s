; func_02073f28 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02073fc8
        .global func_02073f28
        .arm
func_02073f28:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r4, r2
    mov r2, r3
    mov r5, r1
    bl func_02073fc8
    mov r2, r0
    add r0, r4, #0xc
    mov r1, #0x8
    bl func_02073fc8
    add r1, r0, r5
    ands r0, r1, #0x10000
    ldrne r0, _LIT0
    addne r1, r1, #0x1
    andne r1, r1, r0
    ldr r0, _LIT0
    cmp r1, r0
    movne r0, #0x1
    moveq r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word 0x0000ffff
