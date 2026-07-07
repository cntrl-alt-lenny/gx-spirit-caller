; func_ov002_0223ae58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021d8814
        .extern func_ov002_021e0f5c
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .global func_ov002_0223ae58
        .arm
func_ov002_0223ae58:
    stmdb sp!, {r4, r5, r6, lr}
    ldrh r0, [r1, #0x4]
    ldr ip, _LIT0
    ldr r2, _LIT1
    orr r4, r0, #0x2
    mov r0, r4, lsl #0x1e
    mov r0, r0, lsr #0x1f
    bic r3, r4, #0x4
    mov r0, r0, lsl #0x1f
    orr r0, r3, r0, lsr #0x1d
    strh r0, [r1, #0x4]
    ldrh r4, [r1, #0x4]
    mov r3, #0x14
    mov r0, r4, lsl #0x1d
    mov r0, r0, lsr #0x1f
    bic r4, r4, #0x8
    mov r0, r0, lsl #0x1f
    orr r0, r4, r0, lsr #0x1c
    strh r0, [r1, #0x4]
    ldrh r5, [r1, #0x2]
    ldrh r4, [r1, #0x4]
    mov r0, r5, lsl #0x1f
    mov r1, r5, lsl #0x1a
    mov r0, r0, lsr #0x1f
    and r5, r0, #0x1
    mov r1, r1, lsr #0x1b
    mla ip, r5, r2, ip
    mul r2, r1, r3
    add r3, ip, #0x30
    ldr r3, [r3, r2]
    mov r4, r4, lsl #0x11
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    cmp r2, r4, lsr #0x17
    mov r2, r4, lsr #0x17
    bne .L_a0
    bl func_ov002_021d8814
.L_a0:
    bl func_ov002_021e2a4c
    ldr r4, _LIT2
    mov r6, #0x0
    mov r5, #0x1
.L_b0:
    ldr r0, [r4, #0xcec]
    mov r1, r5
    eor r0, r0, r6
    bl func_ov002_021e0f5c
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_b0
    bl func_ov002_021e2b6c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022d008c
