; func_0202b380 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202b30c
        .global func_0202b380
        .arm
func_0202b380:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r1
    add r1, sp, #0x0
    bl func_0202b30c
    mov r0, r4, asr #0x4
    add r0, r4, r0, lsr #0x1b
    add r1, sp, #0x0
    mov r0, r0, asr #0x5
    ldr r1, [r1, r0, lsl #0x2]
    and r0, r4, #0x1f
    mov r0, r1, lsr r0
    and r0, r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
