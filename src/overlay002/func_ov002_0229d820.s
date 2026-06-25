; func_ov002_0229d820 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cba18
        .extern func_02006c0c
        .extern Task_Invoke
        .extern func_0201d47c
        .extern func_0201e5b8
        .global func_ov002_0229d820
        .arm
func_ov002_0229d820:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x28
    ldr r0, _LIT0
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r4, r0
    add r0, sp, #0x0
    bl func_0201d47c
    ldrh r0, [sp, #0x14]
    mov r3, #0x400
    mov r1, #0x200
    bic r0, r0, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0x14]
    ldrh r2, [sp, #0x14]
    add r0, sp, #0x0
    str r4, [sp]
    orr r2, r2, #0x10
    str r3, [sp, #0xc]
    strh r2, [sp, #0x14]
    strh r1, [sp, #0x10]
    bl func_0201e5b8
    mov r0, r4
    bl Task_Invoke
    add sp, sp, #0x28
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cba18
