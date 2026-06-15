; func_0201a044 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern data_0210594c
        .extern func_0201a170
        .global func_0201a044
        .arm
func_0201a044:
    stmdb sp!, {r4, lr}
    bl GetSystemWork
    mov r4, r0
    mov r0, #0x5
    bl func_0201a170
    ldr r1, _LIT0
    ldr r3, [r4, #0x8e4]
    ldr r2, [r4, #0x8e0]
    ldrh r1, [r1, #0x52]
    ldr ip, [r4, #0x8d4]
    mov r3, r3, lsl #0x10
    mov r2, r2, lsl #0xb
    mov ip, ip, lsl #0x10
    mov r3, r3, lsr #0x10
    mov r2, r2, lsr #0x18
    mov r1, r1, asr #0x1
    rsb r3, r3, ip, lsr #0x10
    add r1, r1, r2, lsl #0x1
    add r1, r1, r3, lsl #0x1
    add r2, r1, #0x1
    mov r1, #0x32
    mul r1, r2, r1
    mul r1, r0, r1
    ldr r0, _LIT1
    umull r0, r2, r1, r0
    mov r0, r2, lsr #0x11
    ldmia sp!, {r4, pc}
_LIT0: .word data_0210594c
_LIT1: .word 0x51eb851f
