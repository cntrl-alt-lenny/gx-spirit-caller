; func_ov002_0220532c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern func_ov002_021b3fd8
        .extern func_ov002_021b99b4
        .global func_ov002_0220532c
        .arm
func_ov002_0220532c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r1, [r4, #0x2]
    ldrh r0, [r4, #0x4]
    mov r2, r1, lsl #0x1f
    mov r1, r0, lsl #0x11
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x17
    bl func_ov002_021b99b4
    cmp r0, #0x0
    movlt r0, #0x0
    ldmltia sp!, {r4, pc}
    ldrh r3, [r4, #0x2]
    ldr r1, _LIT0
    ldr r2, _LIT1
    mov r3, r3, lsl #0x1f
    mov ip, r3, lsr #0x1f
    and r3, ip, #0x1
    mla r1, r3, r1, r2
    add r0, r1, r0, lsl #0x2
    ldr r0, [r0, #0x418]
    mov r0, r0, lsl #0xe
    movs r0, r0, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r1, [r4, #0x4]
    ldrh r2, [r4]
    mov r0, ip
    mov r1, r1, lsl #0x11
    mov r3, r1, lsr #0x17
    mov r1, #0xb
    bl func_ov002_021b3fd8
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldrh r2, [r4, #0x2]
    ldr r0, _LIT0
    ldr r1, _LIT2
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    rsb r2, r2, #0x1
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf178
