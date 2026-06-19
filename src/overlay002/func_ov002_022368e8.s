; func_ov002_022368e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021d63fc
        .extern func_ov002_021d8904
        .global func_ov002_022368e8
        .arm
func_ov002_022368e8:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r1
    ldrh r1, [r4, #0x4]
    mov r5, r0
    ldr r6, _LIT0
    orr r2, r1, #0x2
    mov r0, r2, lsl #0x1e
    mov r0, r0, lsr #0x1f
    bic r1, r2, #0x4
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x1d
    strh r0, [r4, #0x4]
    ldrh r1, [r4, #0x4]
    ldr r2, _LIT1
    mov r3, #0x14
    mov r0, r1, lsl #0x1d
    mov r0, r0, lsr #0x1f
    bic r1, r1, #0x8
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x1c
    strh r0, [r4, #0x4]
    ldrh r1, [r4, #0x2]
    ldrh ip, [r4, #0x4]
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsl #0x1a
    and lr, r0, #0x1
    mov r1, r1, lsr #0x1b
    mla r6, lr, r2, r6
    mul r2, r1, r3
    add r3, r6, #0x30
    ldr r3, [r3, r2]
    mov ip, ip, lsl #0x11
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    cmp r2, ip, lsr #0x17
    mov r2, ip, lsr #0x17
    bne .L_ba4
    bl func_ov002_021d8904
    ldrh r1, [r4, #0x2]
    mov r0, r5
    mov r3, #0x0
    mov r4, r1, lsl #0x1f
    mov r2, r1, lsl #0x1a
    mov r1, r4, lsr #0x1f
    mov r2, r2, lsr #0x1b
    bl func_ov002_021d63fc
.L_ba4:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
