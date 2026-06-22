; func_ov002_021d7a64 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_0202b878
        .extern func_0202e2c8
        .extern func_ov002_021bb068
        .extern func_ov002_021d730c
        .extern func_ov002_021e276c
        .extern func_ov002_02254a2c
        .global func_ov002_021d7a64
        .arm
func_ov002_021d7a64:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    mov r7, r2
    mov r6, r0
    mov r5, r1
    mov r4, #0xe
    bl func_ov002_02254a2c
    cmp r7, #0x0
    beq .L_64
    ldr r0, _LIT0
    bl func_ov002_021bb068
    cmp r0, #0x0
    beq .L_64
    ldr r0, _LIT1
    ldr r1, _LIT2
    and r2, r6, #0x1
    mla r0, r2, r0, r1
    add r0, r0, r5, lsl #0x2
    ldr r0, [r0, #0x120]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e2c8
    cmp r0, #0x0
    movne r4, #0xc
    moveq r4, #0xd
.L_64:
    ldr r2, _LIT2
    ldr r0, _LIT1
    and r1, r6, #0x1
    mla r0, r1, r0, r2
    mov r1, #0x0
    str r1, [sp]
    add r7, r0, #0x120
    str r1, [sp, #0x4]
    mov r0, r6
    mov r3, r4
    add r1, r7, r5, lsl #0x2
    mov r2, #0x1000
    bl func_ov002_021d730c
    ldr r0, [r7, r5, lsl #0x2]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b878
    cmp r0, #0x1
    addne sp, sp, #0x8
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r1, _LIT3
    mov r0, r6
    mov r2, #0x2
    mov r3, #0x0
    bl func_ov002_021e276c
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x000019da
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf16c
_LIT3: .word 0x000014e2
