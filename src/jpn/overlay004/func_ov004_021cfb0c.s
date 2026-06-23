; func_ov004_021cfb0c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02006e00
        .extern func_0201d428
        .extern func_0201e564
        .extern func_0202bdf8
        .global func_ov004_021cfb0c
        .arm
func_ov004_021cfb0c:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x28
    mov r5, r1
    mov r6, r0
    mov r0, r5
    bl func_0202bdf8
    mov r4, r0
    add r0, sp, #0x0
    bl func_0201d428
    mov r0, r6, lsl #0xa
    add r1, r0, #0x10000
    ldrh r2, [sp, #0x14]
    str r1, [sp, #0xc]
    cmp r5, #0x0
    bic r0, r2, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0x14]
    ldrh r0, [sp, #0x14]
    mvnne r1, #0x0
    moveq r1, #0x400
    orr r0, r0, #0x10
    strh r0, [sp, #0x14]
    add r0, sp, #0x0
    str r4, [sp]
    strh r1, [sp, #0x10]
    bl func_0201e564
    mov r0, r4
    bl func_02006e00
    add sp, sp, #0x28
    ldmia sp!, {r4, r5, r6, pc}
