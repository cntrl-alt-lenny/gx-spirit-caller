; func_020532f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02053230
        .extern func_02053600
        .extern func_020945f4
        .extern func_020a66e8
        .extern func_020a67cc
        .global func_020532f4
        .arm
func_020532f4:
    stmdb sp!, {r4, r5, lr}
    ldr ip, _LIT0
    sub sp, sp, ip
    mov r4, r1
    mov r1, #0x0
    mov r2, #0x40
    mov r5, r0
    bl func_020945f4
    mov r0, #0x40
    str r0, [r5]
    mov r0, #0x0
    str r0, [r5, #0x1c]
    add r0, r5, #0x4
    str r4, [r5, #0x24]
    bl func_02053230
    add r0, r5, #0x10
    mov r1, #0x0
    bl func_02053600
    ldr r1, _LIT1
    add r0, sp, #0x0
    bl func_020a67cc
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x3c
    bl func_020a66e8
    str r0, [r5, #0x3c]
    ldr r0, [r5, #0x20]
    orr r0, r0, #0x1
    str r0, [r5, #0x20]
    ldr ip, _LIT0
    add sp, sp, ip
    ldmia sp!, {r4, r5, pc}
_LIT0: .word 0x00000404
_LIT1: .word 0xedb88320
