; func_ov002_0225968c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d008c
        .extern func_ov002_021b9dec
        .extern func_ov002_021c9310
        .global func_ov002_0225968c
        .arm
func_ov002_0225968c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr ip, _LIT0
    mov r6, r0
    mov r5, r1
    str r6, [ip, #0xd70]
    mov r4, r2
    str r5, [ip, #0xd74]
    str r4, [ip, #0xd78]
    str r3, [ip, #0xd64]
    mov r3, #0x1
    str r3, [ip, #0xd50]
    mov r3, #0x0
    str r3, [ip, #0xd68]
    bl func_ov002_021c9310
    ldr r0, [r0]
    ldr r3, _LIT0
    mov r0, r0, lsl #0x13
    mov r7, r0, lsr #0x13
    mov r0, r6
    mov r1, r5
    mov r2, r4
    str r7, [r3, #0xd5c]
    bl func_ov002_021c9310
    mov r7, r0
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_ov002_021c9310
    ldr r0, [r0]
    ldr r1, [r7]
    mov r0, r0, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r2, r1, lsl #0x12
    mov r1, r0, lsl #0x1
    ldr r0, _LIT0
    add r1, r1, r2, lsr #0x1f
    str r1, [r0, #0xd60]
    mov r1, #0x0
    str r1, [r0, #0xd48]
    cmp r5, #0x4
    ldmgtia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r6
    add r1, r5, r4
    bl func_ov002_021b9dec
    ldr r1, _LIT0
    str r0, [r1, #0xd5c]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022d008c
