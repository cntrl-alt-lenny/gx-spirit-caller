; func_ov002_02237e94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021c3b60
        .extern func_ov002_021ca3f0
        .extern func_ov002_021d5a6c
        .extern func_ov002_021ff3bc
        .extern func_ov002_0227adb8
        .global func_ov002_02237e94
        .arm
func_ov002_02237e94:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldrh r0, [r5, #0x2]
    mov r6, r1
    ldrh r1, [r5]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c3b60
    movs r4, r0
    movmi r0, #0x0
    ldmmiia sp!, {r4, r5, r6, pc}
    mov r0, r5
    mov r1, r6
    bl func_ov002_021ff3bc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r5, #0x2]
    ldrh r1, [r5]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca3f0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r5, #0x4]
    ldrh r1, [r5]
    ldrh r3, [r5, #0x8]
    mov r0, r0, lsl #0x11
    mov r0, r0, lsr #0x17
    mov r2, #0x1
    bl func_ov002_021d5a6c
    ldrh r0, [r5, #0x2]
    ldr r3, _LIT0
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mla r1, r2, r1, r3
    ldrh r2, [r5]
    add r1, r1, #0x120
    add r1, r1, r4, lsl #0x2
    mov r3, r2, lsl #0x10
    mov r2, #0x1
    bl func_ov002_0227adb8
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
