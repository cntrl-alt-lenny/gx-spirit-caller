; func_ov013_021ca15c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov013_021cb750
        .extern func_02006c0c
        .extern Task_Invoke
        .extern func_020139b4
        .extern func_0201d47c
        .extern func_0201e5b8
        .global func_ov013_021ca15c
        .arm
func_ov013_021ca15c:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x30
    bl func_020139b4
    ldr r1, _LIT0
    add r0, sp, #0x8
    ldr r2, [r1, #0x20]
    ldr r1, [r1, #0x24]
    str r2, [sp]
    str r1, [sp, #0x4]
    bl func_0201d47c
    ldrh r0, [sp, #0x1c]
    ldr r1, [sp, #0x20]
    mov r2, #0x0
    bic r0, r0, #0xf
    orr r3, r0, #0x1
    ldr r0, [sp, #0x24]
    strh r3, [sp, #0x1c]
    bic r3, r1, #0x7f
    bic r0, r0, #0xff
    ldrh r1, [sp, #0x1c]
    bic ip, r3, #0x3f80
    orr r0, r0, #0x20
    bic r3, r0, #0xff00
    bic r0, ip, #0x1c000
    orr lr, r3, #0x2000
    orr r3, r0, #0xc000
    orr ip, r1, #0x10
    ldr r0, [sp]
    mov r1, #0x4
    str lr, [sp, #0x24]
    str r2, [sp, #0x10]
    str r2, [sp, #0x14]
    strh r2, [sp, #0x18]
    strh ip, [sp, #0x1c]
    str r3, [sp, #0x20]
    bl func_02006c0c
    str r0, [sp, #0x8]
    add r0, sp, #0x8
    bl func_0201e5b8
    ldr r0, [sp, #0x8]
    bl Task_Invoke
    add r0, sp, #0x8
    bl func_0201d47c
    mov r2, #0x0
    ldr r0, [sp, #0x24]
    ldr r1, [sp, #0x20]
    bic r0, r0, #0xff
    ldrh r3, [sp, #0x1c]
    orr r0, r0, #0x20
    bic r1, r1, #0x7f
    bic r0, r0, #0xff00
    orr r0, r0, #0x2000
    bic r3, r3, #0xf
    orr r3, r3, #0x6
    bic r1, r1, #0x3f80
    str r0, [sp, #0x24]
    bic r0, r1, #0x1c000
    orr r0, r0, #0xc000
    str r0, [sp, #0x20]
    mov r0, #0x2000
    strh r3, [sp, #0x1c]
    str r0, [sp, #0x14]
    ldrh r0, [sp, #0x1c]
    mov r1, #0x4
    str r2, [sp, #0x10]
    orr r0, r0, #0x10
    strh r0, [sp, #0x1c]
    ldr r0, [sp, #0x4]
    strh r2, [sp, #0x18]
    bl func_02006c0c
    str r0, [sp, #0x8]
    add r0, sp, #0x8
    bl func_0201e5b8
    ldr r0, [sp, #0x8]
    bl Task_Invoke
    add sp, sp, #0x30
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov013_021cb750
