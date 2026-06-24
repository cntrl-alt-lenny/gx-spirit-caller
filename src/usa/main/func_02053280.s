; func_02053280 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020531bc
        .extern func_0205358c
        .extern func_02094500
        .extern func_020a65f4
        .extern func_020a66d8
        .global func_02053280
        .arm
func_02053280:
    stmdb sp!, {r4, r5, lr}
    ldr ip, _LIT0
    sub sp, sp, ip
    mov r4, r1
    mov r1, #0x0
    mov r2, #0x40
    mov r5, r0
    bl func_02094500
    mov r0, #0x40
    str r0, [r5]
    mov r0, #0x0
    str r0, [r5, #0x1c]
    add r0, r5, #0x4
    str r4, [r5, #0x24]
    bl func_020531bc
    add r0, r5, #0x10
    mov r1, #0x0
    bl func_0205358c
    ldr r1, _LIT1
    add r0, sp, #0x0
    bl func_020a66d8
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x3c
    bl func_020a65f4
    str r0, [r5, #0x3c]
    ldr r0, [r5, #0x20]
    orr r0, r0, #0x1
    str r0, [r5, #0x20]
    ldr ip, _LIT0
    add sp, sp, ip
    ldmia sp!, {r4, r5, pc}
_LIT0: .word 0x00000404
_LIT1: .word 0xedb88320
