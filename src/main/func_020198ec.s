; func_020198ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern data_020b5b80
        .extern func_02019604
        .extern func_0201a170
        .global func_020198ec
        .arm
func_020198ec:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GetSystemWork
    ldr r0, _LIT0
    rsb r1, r5, r5, lsl #0x3
    add r0, r0, r1
    ldrsb r4, [r0, #0x5]
    mov r0, r5
    bl func_02019604
    add r0, r4, r0, asr #0x1
    cmp r0, #0x1e
    movgt r4, #0x1e
    bgt .L_40
    mov r0, r5
    bl func_02019604
    add r4, r4, r0, asr #0x1
.L_40:
    mov r0, #0xa
    bl func_0201a170
    add r0, r0, r4
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_020b5b80
