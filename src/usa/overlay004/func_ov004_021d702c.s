; func_ov004_021d702c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_02200c44
        .extern func_02005d90
        .extern func_020943b0
        .global func_ov004_021d702c
        .arm
func_ov004_021d702c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x18
    ldr r6, _LIT0
    add r9, sp, #0x8
    ldr r7, _LIT1
    mov ip, r0
    mov r8, #0x40000000
    str r8, [sp]
    mov r5, r1
    mov fp, r2
    mov r4, r3
    ldmia r6, {r0, r1, r2, r3}
    strh r7, [sp, #0x4]
    sub r7, fp, #0xa
    sub r6, r5, #0x3
    sub r5, r4, #0xa
    stmia r9, {r0, r1, r2, r3}
    ldr fp, _LIT2
    ldr r4, _LIT3
    mov sl, #0x0
    sub r8, ip, #0x3
.L_24c:
    cmp sl, #0x1
    movgt r0, #0x1
    movle r0, #0x0
    mla r0, r5, r0, r6
    and r2, r0, #0xff
    and r0, sl, #0x1
    mla r0, r7, r0, r8
    ldr r3, [sp]
    mov r0, r0, lsl #0x17
    and r3, r3, fp
    orr r2, r3, r2
    orr r0, r2, r0, lsr #0x7
    ldr r1, [r9, sl, lsl #0x2]
    and r0, r0, r4
    orr r0, r0, r1
    str r0, [sp]
    mov r0, #0x2
    mov r1, #0x0
    bl func_02005d90
    mov r1, r0
    add r0, sp, #0x0
    mov r2, #0x6
    bl func_020943b0
    add sl, sl, #0x1
    cmp sl, #0x4
    blt .L_24c
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov004_02200c44
_LIT1: .word 0x00001818
_LIT2: .word 0xfe00ff00
_LIT3: .word 0xc1fffcff
