; func_02087f34 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a4cb4
        .extern func_0207d12c
        .extern func_02087640
        .extern func_020897fc
        .extern func_02089938
        .global func_02087f34
        .arm
func_02087f34:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r5, r2
    mov r6, r0
    mov r0, r1
    mov r3, #0x0
    ldr r2, _LIT0
    add r1, r5, #0x14
    str r3, [sp]
    bl func_020897fc
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
    bl func_02089938
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
    bl func_0207d12c
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word func_02087640
_LIT1: .word data_021a4cb4
