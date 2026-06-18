; func_ov002_022912e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021ba6cc
        .extern func_ov002_021bae7c
        .extern func_ov002_021c3ae4
        .extern func_ov002_0220eb00
        .global func_ov002_022912e0
        .arm
func_ov002_022912e0:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT0
    mvn r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bae7c
    cmp r0, #0x0
    addne sp, sp, #0x8
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    add r1, sp, #0x0
    mov r0, r4
    bl func_ov002_0220eb00
    ldrh r1, [r4, #0x2]
    add r0, sp, #0x0
    mov r1, r1, lsl #0x1f
    mov r4, r1, lsr #0x1f
    rsb r1, r4, #0x1
    ldr r3, [r0, r1, lsl #0x2]
    cmp r3, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT1
    and r1, r1, #0x1
    mul r2, r1, r0
    ldr r0, _LIT2
    ldr r0, [r0, r2]
    cmp r0, r3
    addle sp, sp, #0x8
    movle r0, #0x1
    ldmleia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT0
    mov r0, r4
    bl func_ov002_021c3ae4
    mov r5, r0
    ldr r1, _LIT0
    mov r0, r4
    bl func_ov002_021ba6cc
    adds r0, r5, r0
    moveq r0, #0x1
    movne r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x0000159b
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf16c
