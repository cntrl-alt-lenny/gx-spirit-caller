; func_02087e4c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a4bd4
        .extern func_0207d044
        .extern func_02087558
        .extern func_02089714
        .extern func_02089850
        .global func_02087e4c
        .arm
func_02087e4c:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r5, r2
    mov r6, r0
    mov r0, r1
    mov r3, #0x0
    ldr r2, _LIT0
    add r1, r5, #0x14
    str r3, [sp]
    bl func_02089714
    movs r4, r0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r2, #0x0
    str r2, [r4, #0xc]
    str r6, [r4, #0x10]
    mov r1, r5
    add r0, r4, #0x14
    str r2, [r4, #0x8]
    bl func_02089850
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r2, _LIT1
    mov r1, #0x24
    mla r2, r6, r1, r2
    str r0, [r4, #0x8]
    mov r1, r4
    add r0, r2, #0xc
    bl func_0207d044
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word func_02087558
_LIT1: .word data_021a4bd4
