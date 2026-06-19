; func_ov002_0223cf18 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern func_ov002_021bd85c
        .extern func_ov002_0223b5cc
        .global func_ov002_0223cf18
        .arm
func_ov002_0223cf18:
    stmdb sp!, {r3, r4, r5, lr}
    cmp r1, #0xd
    bne .L_860
    ldr r3, _LIT0
    ldr r1, _LIT1
    and r0, r0, #0x1
    mla r1, r0, r1, r3
    add r0, r1, #0x260
    ldr r1, [r0, r2, lsl #0x2]
    mov r0, r1, lsl #0x2
    mov r2, r1, lsl #0x13
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r4, r0, r1, lsr #0x1f
    mov r5, r2, lsr #0x13
    mov r0, r5
    mov r1, r4
    bl func_ov002_021bd85c
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, #0x0
    bl func_ov002_0223b5cc
    cmp r0, #0x0
    bne .L_868
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_860:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_868:
    ldr r1, _LIT2
    mov r2, #0x0
    ldr r5, [r1, #0x6ac]
    cmp r5, #0x0
    bls .L_8ac
    ldr r3, [r1, #0x494]
.L_880:
    add r0, r3, r2
    mov r0, r0, lsl #0x19
    add r0, r1, r0, lsr #0x18
    add r0, r0, #0x400
    ldrh r0, [r0, #0x98]
    cmp r4, r0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    add r2, r2, #0x1
    cmp r2, r5
    bcc .L_880
.L_8ac:
    mov r0, #0x800
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022ce288
