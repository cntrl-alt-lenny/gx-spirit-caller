; func_ov006_021ca678 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_021cf094
        .extern func_02006c0c
        .extern func_02006e1c
        .extern func_0201d47c
        .extern func_0201e5b8
        .global func_ov006_021ca678
        .arm
func_ov006_021ca678:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x28
    mov r5, r0
    ldr r0, _LIT0
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r4, r0
    add r0, sp, #0x0
    bl func_0201d47c
    ldrh r1, [sp, #0x14]
    mvn r0, #0x0
    str r0, [sp, #0x8]
    bic r1, r1, #0xf
    orr r1, r1, #0x6
    str r4, [sp]
    strh r1, [sp, #0x14]
    ldr r1, [r5, #0x38]
    add r0, sp, #0x0
    mov r1, r1, lsl #0x5
    str r1, [sp, #0xc]
    ldr r1, [r5, #0x3c]
    mov r1, r1, lsl #0x5
    strh r1, [sp, #0x10]
    bl func_0201e5b8
    mov r0, r4
    bl func_02006e1c
    mov r0, #0x1
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov006_021cf094
