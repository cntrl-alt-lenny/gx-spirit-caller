; func_020387c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b550
        .extern func_020385d8
        .global func_020387c0
        .arm
func_020387c0:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r0, #0x84
    mul r0, r6, r0
    ldr r1, _LIT0
    mov r6, #0x0
    add r2, r1, r0
    strh r6, [r1, r0]
    strh r6, [r2, #0x2]
    add r5, r2, #0x4
    mov r4, #0x7f
.L_2c:
    mov r0, r5
    mov r1, r4
    bl func_020385d8
    add r6, r6, #0x1
    cmp r6, #0x10
    add r5, r5, #0x8
    bcc .L_2c
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0219b550
