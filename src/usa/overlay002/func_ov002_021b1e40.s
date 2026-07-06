; func_ov002_021b1e40 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022d0570
        .extern data_ov002_022d0576
        .extern func_ov002_021b1c68
        .global func_ov002_021b1e40
        .arm
func_ov002_021b1e40:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl func_ov002_021b1c68
    mov r2, #0x14
    ldr ip, _LIT0
    ldr r1, _LIT1
    and r3, r7, #0x1
    mla r1, r3, r1, ip
    ldr ip, _LIT2
    mul r2, r6, r2
    add r3, r1, #0x3a
    ldrh lr, [r3, r2]
    add r1, ip, r0, lsl #0x3
    add r6, r3, r2
    cmp lr, #0x0
    beq .L_64
    ldr r3, _LIT3
.L_50:
    mov r2, lr, lsl #0x3
    add r6, r3, lr, lsl #0x3
    ldrh lr, [r3, r2]
    cmp lr, #0x0
    bne .L_50
.L_64:
    strh r0, [r6]
    ldrh r2, [r1, #0x2]
    and r0, r5, #0xf
    and r0, r0, #0xf
    bic r2, r2, #0xf
    orr r0, r2, r0
    strh r0, [r1, #0x2]
    and r0, r5, #0xf0
    ldrh r2, [r1, #0x2]
    mov r0, r0, asr #0x4
    and r0, r0, #0xff
    bic r2, r2, #0xf0
    mov r0, r0, lsl #0x1c
    orr r0, r2, r0, lsr #0x18
    strh r0, [r1, #0x2]
    ldr r0, [sp, #0x18]
    strh r4, [r1]
    strh r0, [r1, #0x4]
    mov r0, #0x0
    strh r0, [r1, #0x6]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022d0570
_LIT3: .word data_ov002_022d0576
