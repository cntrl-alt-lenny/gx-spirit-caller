; func_ov002_021f526c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b3618
        .extern func_ov002_021b9ecc
        .extern func_ov002_021deb84
        .global func_ov002_021f526c
        .arm
func_ov002_021f526c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldrh r0, [r6, #0x2]
    mov r2, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b3618
    ldrh r1, [r6, #0x2]
    mov r2, r0, lsl #0x10
    mov r3, r2, lsr #0x10
    mov r2, r1, lsl #0x1f
    mov r2, r2, lsr #0x1f
    mov r3, r3, asr #0x8
    mov r5, r1, lsl #0x1a
    mov r4, r2, lsl #0x4
    add r4, r4, r5, lsr #0x1b
    mov r5, #0x0
    mov ip, #0x1
    orr lr, r5, ip, lsl r4
    and r5, r0, #0xff
    and r4, r3, #0xff
    add r3, r4, r5, lsl #0x4
    mov r0, r1, lsl #0x11
    orr r1, lr, ip, lsl r3
    eor r0, r2, r0, lsr #0x1f
    bl func_ov002_021deb84
    mov r0, r5
    mov r1, r4
    bl func_ov002_021b9ecc
    strh r0, [r6, #0x8]
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
