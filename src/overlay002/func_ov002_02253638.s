; func_ov002_02253638 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cad34
        .global func_ov002_02253638
        .arm
func_ov002_02253638:
    stmdb sp!, {r3, lr}
    ldr ip, _LIT0
    ldr r2, _LIT1
    mov lr, #0x0
.L_48c:
    add r1, lr, ip
    add r1, r1, r1, lsr #0x1f
    mov r3, r1, asr #0x1
    ldr r1, [r2, r3, lsl #0x3]
    cmp r1, r0
    addcc lr, r3, #0x1
    movcs ip, r3
    cmp lr, ip
    blt .L_48c
    ldr r1, _LIT1
    ldr r1, [r1, lr, lsl #0x3]
    cmp r0, r1
    mvnne lr, #0x0
    mov r0, lr
    ldmia sp!, {r3, pc}
_LIT0: .word 0x00000186
_LIT1: .word data_ov002_022cad34
