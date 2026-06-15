; func_ov006_021c480c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_ov006_021cdddc
        .extern func_02001d0c
        .extern func_02001d68
        .extern func_02001d98
        .extern func_02004f58
        .extern func_02005554
        .extern func_0202c0c0
        .extern func_0208dd9c
        .extern func_02094504
        .global func_ov006_021c480c
        .arm
func_ov006_021c480c:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r5, r0
    bl func_0208dd9c
    mov r4, r0
    add r1, r4, #0xc40
    mov r0, #0x0
    mov r2, #0xc00
    bl func_02094504
    add r0, r5, #0x10
    mov r1, #0x20
    mov r2, #0x3
    bl func_02001d0c
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    add r0, r5, #0x10
    mov r1, #0x5
    bl func_02001d98
    ldr r1, [r5, #0x60]
    ldr r2, [r5, #0x5c]
    mov r1, r1, lsl #0x2
    add r1, r1, #0x1
    add r1, r2, r1
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1
    ldrsh r0, [r0, r1]
    bl func_0202c0c0
    mov r1, #0xc
    mov r2, #0x5
    mov r6, r0
    bl func_02005554
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    rsb r3, r0, #0x74
    mov r0, #0x7
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    mov r1, r6
    add r2, r4, #0xc40
    add r0, r5, #0x10
    bl func_02004f58
    add r0, r5, #0x10
    mvn r1, #0x0
    bl func_02001d98
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02104f4c
_LIT1: .word data_ov006_021cdddc
