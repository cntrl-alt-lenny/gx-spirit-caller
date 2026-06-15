; func_02018cdc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_02019210
        .global func_02018cdc
        .arm
func_02018cdc:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GetSystemWork
    mov r4, r0
    mov r0, r5
    bl func_02019210
    sub r1, r0, #0x1
    mov r0, #0x18
    mla r0, r1, r0, r4
    ldr r0, [r0, #0xc]
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    cmp r0, #0x0
    movle r0, #0x1
    movgt r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
