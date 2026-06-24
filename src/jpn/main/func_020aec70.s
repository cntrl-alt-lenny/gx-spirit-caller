; func_020aec70 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020acd94
        .global func_020aec70
        .arm
func_020aec70:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r3, [r4, #0x8]
    mov r5, r2
    ldr r2, [r4, #0x4]
    add r0, r3, r5
    cmp r0, r2
    ldr r0, [r4]
    subhi r5, r2, r3
    mov r2, r5
    add r0, r0, r3, lsl #0x1
    bl func_020acd94
    ldr r1, [r4, #0x8]
    add r1, r1, r5
    str r1, [r4, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
