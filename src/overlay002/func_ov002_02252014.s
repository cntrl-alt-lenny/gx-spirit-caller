; func_ov002_02252014 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022ce884
        .extern data_ov002_022cf16c
        .extern func_0202e234
        .extern func_ov002_021ca440
        .extern func_ov002_02253458
        .global func_ov002_02252014
        .arm
func_ov002_02252014:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    ldr r0, _LIT0
    ldr r1, _LIT1
    and r3, r5, #0x1
    mla r0, r3, r0, r1
    mov r4, r2
    add r6, r0, #0x120
    ldr r0, [r6, r4, lsl #0x2]
    mov r0, r0, lsl #0x13
    mov r7, r0, lsr #0x13
    mov r0, r7
    bl func_0202e234
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r5
    mov r1, r7
    bl func_ov002_021ca440
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r3, [r6, r4, lsl #0x2]
    ldr r0, _LIT2
    mov r1, r3, lsl #0x2
    mov r2, r1, lsr #0x18
    ldr r1, [r0, #0x5d4]
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    mov r6, #0x0
    cmp r1, #0x0
    add ip, r2, r3, lsr #0x1f
    ldmlsia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r7, _LIT3
.L_80:
    ldrb r2, [r0, #0x5dc]
    cmp r2, #0x19
    ldreq r2, [r7]
    moveq r3, r2, lsl #0x16
    cmpeq r5, r3, lsr #0x1f
    moveq r2, r2, lsl #0x17
    cmpeq ip, r2, lsr #0x17
    bne .L_b4
    mov r0, r5
    mov r2, r4
    mov r1, #0xb
    bl func_ov002_02253458
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_b4:
    add r6, r6, #0x1
    cmp r6, r1
    add r0, r0, #0x1
    add r7, r7, #0x4
    bcc .L_80
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022ce288
_LIT3: .word data_ov002_022ce884
