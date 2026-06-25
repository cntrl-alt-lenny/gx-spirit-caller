; func_02048b4c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dba0
        .extern func_02094500
        .global func_02048b4c
        .arm
func_02048b4c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r3, _LIT0
    mov r5, r1
    ldr r1, [r3]
    mov r4, r2
    cmp r1, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
    mov r2, #0xc
    mla r0, r5, r2, r0
    mov r1, #0x0
    bl func_02094500
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r3, [r0, #0x3c]
    cmp r3, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
    ldr r2, [r0, #0x40]
    mov r0, r5
    mov r1, r4
    blx r3
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_0219dba0
