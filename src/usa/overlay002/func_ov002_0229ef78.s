; func_ov002_0229ef78 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ca2c8
        .extern data_ov002_022cba64
        .extern func_02006bf0
        .extern func_02006e00
        .extern func_0201d428
        .extern func_0201e564
        .extern OS_SPrintf
        .global func_ov002_0229ef78
        .arm
func_ov002_0229ef78:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x48
    mov ip, #0x1
    str ip, [r0]
    mov lr, #0x0
    str lr, [r0, #0x18]
    ldr ip, [sp, #0x54]
    str lr, [r0, #0x4]
    str ip, [r0, #0x1c]
    str lr, [r0, #0x18]
    str r1, [r0, #0xc]
    mov r4, r3
    str r2, [r0, #0x10]
    ldr r1, [sp, #0x50]
    str r4, [r0, #0x8]
    cmp r4, #0xf
    str r1, [r0, #0x14]
    addeq sp, sp, #0x48
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT0
    add r0, sp, #0x28
    ldr r2, [r1, r4, lsl #0x3]
    ldr r1, _LIT1
    bl OS_SPrintf
    add r0, sp, #0x0
    bl func_0201d428
    add r0, sp, #0x28
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    mvn r2, #0x0
    ldrh r3, [sp, #0x14]
    ldr r1, [sp, #0x50]
    str r0, [sp]
    cmp r4, #0x10
    movge r0, #0x7
    movlt r0, #0x8
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r3, r3, #0xf
    and r0, r0, #0xf
    orr r3, r3, r0
    add r0, sp, #0x0
    strh r3, [sp, #0x14]
    str r2, [sp, #0x8]
    str r1, [sp, #0xc]
    strh r2, [sp, #0x10]
    bl func_0201e564
    ldr r0, [sp]
    bl func_02006e00
    add sp, sp, #0x48
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ca2c8
_LIT1: .word data_ov002_022cba64
