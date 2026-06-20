; func_ov002_02206b00 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b947c
        .global func_ov002_02206b00
        .arm
func_ov002_02206b00:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, [r4, #0x14]
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x3
    bl func_ov002_021b947c
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r0, r0, #0xff
    cmp r0, #0xf
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x14]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x3
    bl func_ov002_021b947c
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r0, r0, #0xff
    cmp r0, #0xf
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, pc}
