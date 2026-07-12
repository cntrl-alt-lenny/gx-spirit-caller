; func_ov008_021aef84 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b2cc4
        .extern func_02006e00
        .extern func_0201d428
        .extern func_0201e564
        .extern func_0202bdf8
        .global func_ov008_021aef84
        .arm
func_ov008_021aef84:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x28
    ldr r2, _LIT0
    add r0, r0, r0, lsl #0x2
    ldr r2, [r2, #0xc0]
    add r7, r1, r1, lsl #0x2
    add r6, r2, r0, lsl #0x1
    mov r5, #0x0
    add r4, sp, #0x0
.L_1b4:
    mov r0, r5, lsl #0x1
    ldrh r8, [r6, r0]
    mov r0, r4
    bl func_0201d428
    mov r0, r8
    bl func_0202bdf8
    ldrh r3, [sp, #0x14]
    mov r1, r7, lsl #0x3
    ldr r2, [sp, #0x18]
    bic r3, r3, #0xf
    orr r3, r3, #0x9
    strh r3, [sp, #0x14]
    ldrh r3, [sp, #0x14]
    add r1, r1, #0xf3
    add ip, r1, #0x200
    bic r1, r2, #0x1c000
    str r0, [sp]
    mov ip, ip, lsl #0x7
    orr r2, r3, #0x10
    orr r1, r1, #0x1c000
    mov r0, r4
    str ip, [sp, #0xc]
    strh r2, [sp, #0x14]
    str r1, [sp, #0x18]
    bl func_0201e564
    ldr r0, [sp]
    bl func_02006e00
    add r5, r5, #0x1
    cmp r5, #0x5
    add r7, r7, #0x1
    blt .L_1b4
    add sp, sp, #0x28
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov008_021b2cc4
