; func_ov006_021b79ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern func_02009278
        .global func_ov006_021b79ac
        .arm
func_ov006_021b79ac:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    mov r4, r1
    add r0, r5, #0x248
    mov r2, #0x124
    mla r1, r4, r2, r0
    mov r0, #0x0
    bl Fill32
    add r1, r5, r4, lsl #0x1
    mov r0, r4, asr #0x4
    mov lr, r4, lsr #0x1f
    add r2, r5, #0xb4
    add r3, r4, r0, lsr #0x1b
    rsb ip, lr, r4, lsl #0x1b
    add r1, r1, #0x5f00
    mov r0, #0x0
    strh r0, [r1, #0xd0]
    add r6, r2, #0x6000
    mov r5, r3, asr #0x5
    add r1, lr, ip, ror #0x1b
    mov r2, #0x1
    mvn r2, r2, lsl r1
    ldr r3, [r6, r5, lsl #0x2]
    mov r1, r4
    and r2, r3, r2
    str r2, [r6, r5, lsl #0x2]
    bl func_02009278
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
