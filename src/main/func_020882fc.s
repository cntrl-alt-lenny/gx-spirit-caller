; func_020882fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020950a0
        .extern func_0209a824
        .extern func_0209a83c
        .global func_020882fc
        .arm
func_020882fc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x40]
    mov r2, #0x1
    mov r1, #0x0
    mov r2, r2, lsl r0
    ldr r0, [r4, #0x44]
    mov r3, r1
    bl func_020950a0
    ldr r0, [r4, #0x24]
    mov r0, r0, lsl #0x1e
    movs r0, r0, asr #0x1f
    ldmneia sp!, {r4, pc}
    add r0, r4, #0x8
    bl func_0209a83c
    add r0, r4, #0x14
    bl func_0209a824
    ldr r0, [r4, #0x24]
    orr r0, r0, #0x2
    str r0, [r4, #0x24]
    ldmia sp!, {r4, pc}
