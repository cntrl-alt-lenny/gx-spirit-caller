; func_ov002_022a37c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cbe40
        .extern data_ov002_022cbe58
        .extern func_02006c0c
        .extern Task_Invoke
        .extern func_0201d47c
        .extern func_0201e5b8
        .global func_ov002_022a37c4
        .arm
func_ov002_022a37c4:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x50
    mov r2, #0x0
    str r2, [r0]
    str r2, [r0, #0x4]
    str r2, [r0, #0x8]
    ldr r0, _LIT0
    mov r1, #0x4
    bl func_02006c0c
    mov r4, r0
    add r0, sp, #0x28
    bl func_0201d47c
    mvn ip, #0x0
    ldrh r1, [sp, #0x3c]
    ldr r0, [sp, #0x40]
    str r4, [sp, #0x28]
    bic r1, r1, #0xf
    orr r1, r1, #0x7
    strh r1, [sp, #0x3c]
    ldrh r1, [sp, #0x3c]
    bic r0, r0, #0x1c000
    orr r2, r0, #0x8000
    orr r3, r1, #0x10
    mov r1, #0x200
    add r0, sp, #0x28
    str ip, [sp, #0x30]
    str ip, [sp, #0x34]
    strh r3, [sp, #0x3c]
    str r2, [sp, #0x40]
    strh r1, [sp, #0x38]
    bl func_0201e5b8
    add r0, sp, #0x28
    bl func_0201d47c
    mvn r0, #0x0
    ldrh r2, [sp, #0x3c]
    str r0, [sp, #0x30]
    str r0, [sp, #0x34]
    mov r0, #0x200
    strh r0, [sp, #0x38]
    bic r0, r2, #0xf
    orr r0, r0, #0x8
    ldr r1, [sp, #0x40]
    strh r0, [sp, #0x3c]
    bic r0, r1, #0x1c000
    ldrh r1, [sp, #0x3c]
    orr r0, r0, #0xc000
    str r0, [sp, #0x40]
    orr r1, r1, #0x10
    str r4, [sp, #0x28]
    add r0, sp, #0x28
    strh r1, [sp, #0x3c]
    bl func_0201e5b8
    ldr r0, [sp, #0x28]
    bl Task_Invoke
    ldr r0, _LIT1
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r4, r0
    add r0, sp, #0x0
    bl func_0201d47c
    mvn r0, #0x0
    ldrh r1, [sp, #0x14]
    str r0, [sp, #0x8]
    str r0, [sp, #0xc]
    bic r0, r1, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0x14]
    ldrh r0, [sp, #0x14]
    ldr r1, [sp, #0x18]
    str r4, [sp]
    bic r2, r1, #0x1c000
    orr r0, r0, #0x10
    strh r0, [sp, #0x14]
    mov r1, #0xe00
    add r0, sp, #0x0
    str r2, [sp, #0x18]
    strh r1, [sp, #0x10]
    bl func_0201e5b8
    ldr r0, [sp]
    bl Task_Invoke
    add sp, sp, #0x50
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cbe40
_LIT1: .word data_ov002_022cbe58
