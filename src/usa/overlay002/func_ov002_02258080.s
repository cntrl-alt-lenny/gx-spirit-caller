; func_ov002_02258080 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf0c4
        .extern data_ov002_022d008c
        .extern func_ov002_021d668c
        .extern func_ov002_021e302c
        .extern func_ov002_021e3264
        .global func_ov002_02258080
        .arm
func_ov002_02258080:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    ldr r1, _LIT0
    ldr r4, _LIT1
    ldr r9, [r1, #0xd70]
    ldr r5, [r1, #0xd74]
    ldr r2, [r1, #0xd78]
    ldr r1, _LIT2
    and r3, r9, #0x1
    add r6, r5, r2
    mov r2, #0x14
    mla r5, r3, r1, r4
    mul r4, r6, r2
    ldrh r7, [r5, r4]
    mov r8, r0
    mov sl, #0x3
    cmp r7, #0x0
    bne .L_410
    mov r0, r9
    mov r1, r6
    mov sl, #0x0
    bl func_ov002_021d668c
    mov r0, #0x1
    strh r0, [r5, r4]
.L_410:
    cmp r8, #0x0
    beq .L_480
    ldr r0, _LIT0
    ldr r3, _LIT0
    ldr r0, [r0, #0xd6c]
    ldr r2, [r3, #0xd5c]
    cmp r9, r0
    movne r0, #0x1
    moveq r0, #0x0
    mov ip, r9, lsl #0x1f
    mov r9, r0, lsl #0x18
    mov r0, sl, lsl #0x15
    mov r1, r6, lsl #0x10
    and r6, r9, #0x1000000
    ldr r3, [r3, #0xd60]
    and sl, ip, #-2147483648
    and r9, r0, #0xe00000
    orr r0, sl, r6
    and r6, r1, #0x1f0000
    orr r1, r9, r0
    mov r0, r2, lsl #0x10
    orr r1, r6, r1
    mov r3, r3, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    mov r2, r8
    mov r1, r3, lsr #0x10
    bl func_ov002_021e3264
    b .L_4e0
.L_480:
    ldr r0, _LIT0
    ldr r3, _LIT0
    ldr r0, [r0, #0xd6c]
    ldr r2, [r3, #0xd5c]
    cmp r9, r0
    movne r0, #0x1
    moveq r0, #0x0
    mov r9, r9, lsl #0x1f
    mov r8, r0, lsl #0x18
    mov r1, r6, lsl #0x10
    ldr r3, [r3, #0xd60]
    mov r0, sl, lsl #0x15
    and r6, r8, #0x1000000
    and r9, r9, #-2147483648
    and r8, r0, #0xe00000
    orr r0, r9, r6
    and r6, r1, #0x1f0000
    orr r1, r8, r0
    mov r3, r3, lsl #0x10
    mov r0, r2, lsl #0x10
    orr r1, r6, r1
    orr r0, r1, r0, lsr #0x10
    mov r1, r3, lsr #0x10
    bl func_ov002_021e302c
.L_4e0:
    ldr r0, _LIT0
    strh r7, [r5, r4]
    mov r1, #0x0
    str r1, [r0, #0xd50]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word data_ov002_022cf0c4
_LIT2: .word 0x00000868
