; func_ov000_021af474 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov000_021c74ac
        .extern func_ov000_021b0a4c_unk
        .global func_ov000_021af474
        .arm
func_ov000_021af474:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl func_ov000_021b0a4c_unk
    ldr r0, _LIT0
    and r3, r6, #0xff
    ldr ip, [r0, #0x28]
    and r2, r5, #0xff
    and r1, r4, #0xff
    bic ip, ip, #0xff000
    mov r3, r3, lsl #0x18
    orr r3, ip, r3, lsr #0xc
    bic r3, r3, #0xff00000
    mov r2, r2, lsl #0x18
    orr r2, r3, r2, lsr #0x4
    str r2, [r0, #0x28]
    ldr r2, [r0, #0x2c]
    and r1, r1, #0x1f
    bic r2, r2, #0x1f
    orr r1, r2, r1
    str r1, [r0, #0x2c]
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov000_021c74ac
