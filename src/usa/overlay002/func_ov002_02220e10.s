; func_ov002_02220e10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021e267c
        .global func_ov002_02220e10
        .arm
func_ov002_02220e10:
    stmdb sp!, {r3, lr}
    ldrh r1, [r0]
    ldr r2, _LIT0
    mov r3, #0x0
    cmp r1, r2
    ldreqh r2, [r0, #0x4]
    moveq r2, r2, lsl #0x11
    moveq r3, r2, lsr #0x17
    ldrh r2, [r0, #0x2]
    mov r0, r3, lsl #0x10
    mov r3, r0, lsr #0x10
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r2, #0x1
    bl func_ov002_021e267c
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word 0x000014e2
