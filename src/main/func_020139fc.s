; func_020139fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02019124
        .extern func_0201913c
        .global func_020139fc
        .arm
func_020139fc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02019124
    rsb ip, r4, r4, lsl #0x8
    ldr r3, _LIT0
    mov r1, ip, lsr #0x1f
    smull r2, lr, r3, ip
    add lr, ip, lr
    add lr, r1, lr, asr #0x7
    add r0, r0, lr
    cmp r0, #0xff
    movgt r0, #0xff
    bl func_0201913c
    ldmia sp!, {r4, pc}
_LIT0: .word 0x80808081
