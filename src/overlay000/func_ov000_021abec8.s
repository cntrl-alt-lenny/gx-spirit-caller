; func_ov000_021abec8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020b3a7c
        .global func_ov000_021abec8
        .arm
func_ov000_021abec8:
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x4]
    ldr r4, [r0, #0xc]
    ldr r3, [r0]
    mov r2, r1, lsl #0x10
    mov r2, r2, lsr #0x18
    mov lr, r3, lsl #0x8
    mov r3, r4, lsl #0x18
    ldr ip, [r0, #0x8]
    mov r0, r3, lsr #0x18
    mov r4, r4, lsl #0x6
    add r3, r2, lr, lsr #0x17
    rsb r3, r3, r4, lsr #0x17
    rsb r0, r0, ip, lsr #0x10
    mul r4, r3, r0
    mov r3, r1, lsl #0x18
    mov r0, r2, lsl #0x1
    rsb r2, r0, r3, lsr #0x18
    mov r0, r1, lsl #0x8
    sub r1, r2, r0, lsr #0x18
    add r0, r1, r1, lsr #0x1f
    add r0, r4, r0, asr #0x1
    bl func_020b3a7c
    ldmia sp!, {r4, pc}
