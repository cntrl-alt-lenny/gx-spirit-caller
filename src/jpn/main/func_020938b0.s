; func_020938b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020943b0
        .global func_020938b0
        .arm
func_020938b0:
    stmdb sp!, {r4, lr}
    ldr ip, _LIT0
    mov r4, r0
    ldrh r2, [ip, #0x64]
    add r0, ip, #0x6
    add r1, r4, #0x4
    mov r2, r2, lsl #0x1d
    mov r2, r2, lsr #0x1d
    strb r2, [r4]
    ldrb r3, [ip, #0x2]
    mov r2, #0x14
    mov r3, r3, lsl #0x1c
    mov r3, r3, lsr #0x1c
    strb r3, [r4, #0x1]
    ldrb r3, [ip, #0x3]
    strb r3, [r4, #0x2]
    ldrb r3, [ip, #0x4]
    strb r3, [r4, #0x3]
    ldrb r3, [ip, #0x1a]
    strh r3, [r4, #0x18]
    ldrb r3, [ip, #0x50]
    strh r3, [r4, #0x4e]
    bl func_020943b0
    ldr r0, _LIT0
    add r1, r4, #0x1a
    add r0, r0, #0x1c
    mov r2, #0x34
    bl func_020943b0
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word 0x027ffc80
