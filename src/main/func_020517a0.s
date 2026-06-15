; func_020517a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dc8c
        .extern func_020498dc
        .extern func_020498f0
        .extern func_02049900
        .extern func_0204b370
        .extern func_0204f3c0
        .extern func_020945f4
        .global func_020517a0
        .arm
func_020517a0:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl func_02049900
    bl func_020498f0
    str r6, [r0]
    bl func_020498f0
    str r5, [r0, #0x4]
    bl func_020498f0
    str r4, [r0, #0x8]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x10]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x1c]
    bl func_020498f0
    mov r1, #0x0
    strh r1, [r0, #0x1a]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0xe4]
    mov r0, r1
    bl func_020498dc
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0xf]
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x19]
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x1af]
    bl func_020498f0
    mov r1, #0x0
    add r0, r0, #0x100
    strh r1, [r0, #0xb6]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x1dc]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x200]
    bl func_020498f0
    ldr r1, [sp, #0x10]
    str r1, [r0, #0x2f4]
    bl func_020498f0
    ldr r1, [sp, #0x14]
    str r1, [r0, #0x2f8]
    bl func_020498f0
    ldr r1, [sp, #0x18]
    str r1, [r0, #0x2fc]
    bl func_020498f0
    ldr r1, [sp, #0x1c]
    str r1, [r0, #0x300]
    bl func_020498f0
    add r0, r0, #0x304
    mov r1, #0x0
    mov r2, #0x40
    bl func_020945f4
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x344]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x464]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x468]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x474]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x478]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x47c]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x480]
    bl func_0204b370
    ldr r1, _LIT0
    mov r0, #0x0
    strb r0, [r1]
    strb r0, [r1, #0x1]
    strh r0, [r1, #0x2]
    bl func_0204f3c0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0219dc8c
