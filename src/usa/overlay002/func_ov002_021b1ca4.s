; func_ov002_021b1ca4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cf08c
        .extern data_ov002_022d0570
        .extern data_ov002_022d0576
        .extern func_ov002_0229cc4c
        .global func_ov002_021b1ca4
        .arm
func_ov002_021b1ca4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r5, r0
    ldr r2, _LIT0
    mov r3, r5, lsl #0x3
    ldr r1, _LIT1
    ldrh r4, [r2, r3]
    add r0, r1, r5, lsl #0x3
    mov r1, #0x8
    bl func_ov002_0229cc4c
    mov r0, r4, lsl #0x10
    mov lr, #0x0
    mov r2, r0, lsr #0x10
    ldr r7, _LIT2
    ldr r3, _LIT3
    ldr r0, _LIT4
    mov ip, lr
.L_40:
    and r1, lr, #0x1
    mla r8, r1, r0, r3
    mov r6, ip
.L_4c:
    ldrh r1, [r8, #0x3a]
    add r6, r6, #0x1
    cmp r5, r1
    streqh r2, [r8, #0x3a]
    cmp r6, #0xb
    add r8, r8, #0x14
    ble .L_4c
    ldrh r1, [r7, #0xce]
    add lr, lr, #0x1
    cmp r5, r1
    streqh r2, [r7, #0xce]
    cmp lr, #0x2
    add r7, r7, #0x14
    blt .L_40
    mov r0, r4, lsl #0x10
    ldr r3, _LIT3
    mov r6, #0x1
    mov r1, r0, lsr #0x10
.L_94:
    add r0, r3, r6, lsl #0x2
    add r0, r0, #0x1000
    ldrh r2, [r0, #0xe6]
    add r6, r6, #0x1
    cmp r5, r2
    streqh r1, [r0, #0xe6]
    cmp r6, #0x100
    blt .L_94
    mov r0, r4, lsl #0x10
    ldr r3, _LIT3
    mov r6, #0x1
    mov r1, r0, lsr #0x10
.L_c4:
    add r0, r3, r6, lsl #0x3
    add r0, r0, #0x1400
    ldrh r2, [r0, #0xea]
    add r6, r6, #0x1
    cmp r5, r2
    streqh r1, [r0, #0xea]
    cmp r6, #0x100
    blt .L_c4
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022d0576
_LIT1: .word data_ov002_022d0570
_LIT2: .word data_ov002_022cd314
_LIT3: .word data_ov002_022cf08c
_LIT4: .word 0x00000868
