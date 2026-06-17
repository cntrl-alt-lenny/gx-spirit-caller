; func_ov002_0229f3b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_0229f3b4
        .arm
func_ov002_0229f3b4:
    stmdb sp!, {r3, lr}
    ldr r1, [r0]
    cmp r1, #0x0
    ldmeqia sp!, {r3, pc}
    mov r2, #0x0
    str r2, [r0, #0x4]
    ldr r1, [r0, #0x8]
    cmp r1, #0x10
    blt .L_90
    ldr r1, [r0, #0x18]
    cmp r1, #0x10
    streq r2, [r0, #0x18]
.L_90:
    ldr r1, [r0, #0x18]
    cmp r1, #0x0
    ldmeqia sp!, {r3, pc}
    add ip, r1, #0x1
    ldr r3, _LIT0
    mov r1, ip, lsr #0x1f
    smull r2, lr, r3, ip
    add lr, r1, lr, asr #0x3
    mov r3, #0x11
    smull r1, r2, r3, lr
    sub lr, ip, r1
    str lr, [r0, #0x18]
    ldmia sp!, {r3, pc}
_LIT0: .word 0x78787879
