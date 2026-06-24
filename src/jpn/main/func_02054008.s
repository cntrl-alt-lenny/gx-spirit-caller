; func_02054008 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffa24
        .extern data_020ffa7c
        .extern func_02053f50
        .extern func_020a6c60
        .global func_02054008
        .arm
func_02054008:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    movs r5, r0
    mov r4, r1
    bne .L_2a8
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0xa0
    bl func_020a6c60
.L_2a8:
    cmp r5, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
    ldr r2, [r5]
    mov r0, r5
    mov r1, r4
    bl func_02053f50
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_020ffa7c
_LIT1: .word data_020ffa24
