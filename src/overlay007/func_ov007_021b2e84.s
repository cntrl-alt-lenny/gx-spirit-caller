; func_ov007_021b2e84 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov007_021b30b8
        .global func_ov007_021b2e84
        .arm
func_ov007_021b2e84:
    ldr r1, [r0, #0x4]
    cmp r1, #0x0
    moveq r0, #0x0
    bxeq lr
    ldr r3, [r0, #0x10]
    ldr r2, _LIT0
    ldr r1, [r0, #0x14]
    add r2, r2, r3, lsl #0x5
    add r1, r2, r1, lsl #0x2
    ldr r3, [r1, #0x14]
    mov ip, #0x0
.L_174:
    mov r1, ip, lsl #0x1
    ldrsh r2, [r3, r1]
    cmp r2, #0x0
    movlt r0, #0x0
    bxlt lr
    ldr r1, [r0, #0x20]
    cmp r1, r2
    moveq r0, #0x1
    bxeq lr
    add ip, ip, #0x1
    b .L_174
    bx lr
_LIT0: .word data_ov007_021b30b8
