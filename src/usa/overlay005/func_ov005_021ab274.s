; func_ov005_021ab274 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov005_021ab274
        .arm
func_ov005_021ab274:
    stmdb sp!, {r3, lr}
    ldr lr, [r0, #0x10]
    mov ip, r1, lsl #0x1
    ldrh r3, [lr, ip]
    mvn r1, r2
    and r1, r3, r1
    strh r1, [lr, ip]
    ldr r1, [r0, #0x18]
    bic r1, r1, #0x1
    orr r1, r1, #0x1
    str r1, [r0, #0x18]
    ldmia sp!, {r3, pc}
