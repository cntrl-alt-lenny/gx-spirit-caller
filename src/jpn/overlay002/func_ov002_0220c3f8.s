; func_ov002_0220c3f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cf0c4
        .extern data_ov002_022cf0c8
        .extern func_ov002_021c921c
        .global func_ov002_0220c3f8
        .arm
func_ov002_0220c3f8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x14
    bne .L_a4
    ldr r1, _LIT0
    ldr r0, [r1, #0x8]
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, [r1, #0x4]
    ldr r1, [r1, #0x20]
    mov r3, #0x14
    ldr r2, _LIT1
    ldr ip, _LIT2
    and lr, r0, #0x1
    mul r3, r1, r3
    mla r2, lr, r2, ip
    ldrh r2, [r3, r2]
    cmp r2, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_ov002_021c921c
    ldrh r2, [r4, #0x2]
    ldr r1, _LIT1
    ldr r4, _LIT3
    mov r3, r2, lsl #0x1f
    mov r3, r3, lsr #0x1f
    and ip, r3, #0x1
    mov r2, r2, lsl #0x1a
    mov r3, r2, lsr #0x1b
    mov r2, #0x14
    mul r2, r3, r2
    mla r1, ip, r1, r4
    ldr r1, [r2, r1]
    tst r1, r0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
.L_a4:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cd314
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf0c4
_LIT3: .word data_ov002_022cf0c8
