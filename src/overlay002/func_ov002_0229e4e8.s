; func_ov002_0229e4e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cba2c
        .extern data_ov002_022cba40
        .extern func_02006c0c
        .extern Task_Invoke
        .extern func_0201d47c
        .extern func_0201e5b8
        .global func_ov002_0229e4e8
        .arm
func_ov002_0229e4e8:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x50
    ldr r0, _LIT0
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r4, r0
    add r0, sp, #0x28
    bl func_0201d47c
    ldrh r0, [sp, #0x3c]
    mov r2, #0x800
    mov r1, #0x40
    bic r0, r0, #0xf
    orr r3, r0, #0x9
    add r0, sp, #0x28
    str r4, [sp, #0x28]
    strh r3, [sp, #0x3c]
    str r2, [sp, #0x34]
    strh r1, [sp, #0x38]
    bl func_0201e5b8
    mov r0, r4
    bl Task_Invoke
    ldr r0, _LIT1
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r4, r0
    add r0, sp, #0x0
    bl func_0201d47c
    mov r0, #0x3600
    ldrh r1, [sp, #0x14]
    str r0, [sp, #0xc]
    str r4, [sp]
    bic r0, r1, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0x14]
    mov r0, #0xa0
    strh r0, [sp, #0x10]
    add r0, sp, #0x0
    bl func_0201e5b8
    mov r0, r4
    bl Task_Invoke
    add sp, sp, #0x50
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cba2c
_LIT1: .word data_ov002_022cba40
