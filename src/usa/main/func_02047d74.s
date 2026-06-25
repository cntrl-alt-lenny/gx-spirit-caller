; func_02047d74 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219db98
        .extern func_02047f44
        .extern func_02055dec
        .extern func_02092fc8
        .extern func_020aad04
        .global func_02047d74
        .arm
func_02047d74:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    ldr r4, _LIT0
    mov r6, r1
    ldr r4, [r4]
    mov r1, r0
    add r0, r4, #0x48
    mov r5, r2
    mov r4, r3
    bl func_020aad04
    ldr r0, _LIT0
    mov r1, r6
    ldr r0, [r0]
    add r0, r0, #0x148
    bl func_020aad04
    ldr r0, _LIT0
    ldr r6, [r0]
    bl func_02092fc8
    str r0, [r6, #0x34]
    str r1, [r6, #0x38]
    mov r3, #0x1
    ldr r0, _LIT0
    str r3, [r6, #0x30]
    ldr r2, [r0]
    mov r1, #0x0
    str r1, [sp]
    str r5, [sp, #0x4]
    str r1, [sp, #0x8]
    ldr r0, [r2]
    add r1, r2, #0x48
    add r2, r2, #0x148
    bl func_02055dec
    bl func_02047f44
    cmp r0, #0x0
    ldreq r0, _LIT0
    ldreq r0, [r0]
    streq r4, [r0, #0x4]
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0219db98
