; func_ov011_021cf2fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02018b94
        .global func_ov011_021cf2fc
        .arm
func_ov011_021cf2fc:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl func_02018b94
    ldr r2, [r0, #0x14]
    and r1, r6, #0xff
    bic r2, r2, #0xff
    orr r1, r2, r1
    str r1, [r0, #0x14]
    bl func_02018b94
    ldr r2, [r0, #0x1c]
    mov r1, r5, lsl #0x1b
    bic r2, r2, #0x1f0000
    orr r1, r2, r1, lsr #0xb
    str r1, [r0, #0x1c]
    bl func_02018b94
    ldr r2, [r0, #0x1c]
    mov r1, r4, lsl #0x18
    bic r2, r2, #0xff00
    orr r1, r2, r1, lsr #0x10
    str r1, [r0, #0x1c]
    ldmia sp!, {r4, r5, r6, pc}
