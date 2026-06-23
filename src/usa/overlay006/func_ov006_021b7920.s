; func_ov006_021b7920 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern func_020091d8
        .extern func_020123e4
        .extern func_ov006_021b7f5c
        .global func_ov006_021b7920
        .arm
func_ov006_021b7920:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl func_ov006_021b7f5c
    add r0, r5, #0x248
    mov r2, #0x124
    mla r1, r4, r2, r0
    add r0, r5, #0x124
    bl Copy32
    add r0, r5, #0x140
    bl func_020123e4
    add r1, r5, r4, lsl #0x1
    mov r2, r4, asr #0x4
    add r1, r1, #0x5f00
    strh r0, [r1, #0xd0]
    add r0, r5, #0xb4
    add lr, r0, #0x6000
    add r0, r4, r2, lsr #0x1b
    mov ip, r0, asr #0x5
    add r2, r5, #0x124
    ldr r5, [lr, ip, lsl #0x2]
    mov r3, #0x1
    mov r1, r4, lsr #0x1f
    rsb r0, r1, r4, lsl #0x1b
    add r0, r1, r0, ror #0x1b
    orr r0, r5, r3, lsl r0
    str r0, [lr, ip, lsl #0x2]
    mov r1, r4
    mov r0, #0x0
    bl func_020091d8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
