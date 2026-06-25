; func_020a94ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020a7274
        .global func_020a94ac
        .arm
func_020a94ac:
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
    add r0, r0, r3
    bl func_020a7274
    ldr r1, [r4, #0x8]
    mov r0, #0x1
    add r1, r1, r5
    str r1, [r4, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
