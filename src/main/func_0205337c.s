; func_0205337c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffa9c
        .extern func_0205340c
        .extern func_02053720
        .extern func_02053728
        .extern func_0209150c
        .global func_0205337c
        .arm
func_0205337c:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x40
    mov r6, r0
    mov r4, r1
    mov r5, r2
    bl func_02053728
    add r3, sp, #0x14
    mov r2, #0x2b
    bl func_0205340c
    mov r0, r6
    bl func_02053720
    mov r1, #0x0
    mov r2, #0x20
    add r3, sp, #0x29
    bl func_0205340c
    mov r1, r4, lsr #0x18
    and r1, r1, #0xff
    str r1, [sp]
    mov r1, r4, lsr #0x10
    and r1, r1, #0xff
    str r1, [sp, #0x4]
    mov r1, r4, lsr #0x8
    and r1, r1, #0xff
    str r1, [sp, #0x8]
    and r1, r4, #0xff
    str r1, [sp, #0xc]
    add r2, sp, #0x29
    str r2, [sp, #0x10]
    ldr r2, _LIT0
    mov r0, r5
    mov r1, #0x15
    add r3, sp, #0x14
    bl func_0209150c
    add sp, sp, #0x40
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_020ffa9c
