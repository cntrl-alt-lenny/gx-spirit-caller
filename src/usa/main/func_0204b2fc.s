; func_0204b2fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_0219dbd4
        .extern func_0204543c
        .global func_0204b2fc
        .arm
func_0204b2fc:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    ldr r6, _LIT0
    mov r7, #0x0
    mov r4, r7
    mov r5, #0x4
.L_2b8:
    ldr r1, [r6, #0x4]
    cmp r1, #0x0
    beq .L_2d0
    mov r0, r5
    mov r2, r4
    bl func_0204543c
.L_2d0:
    add r7, r7, #0x1
    cmp r7, #0x9a
    add r6, r6, #0xc
    blt .L_2b8
    ldr r1, _LIT0
    ldr r2, _LIT1
    mov r0, #0x0
    bl Fill32
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_0219dbd4
_LIT1: .word 0x00000738
