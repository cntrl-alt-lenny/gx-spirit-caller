; func_ov002_02271518 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd220
        .extern data_ov002_022cf0c4
        .extern func_ov002_021bc7e8
        .extern func_ov002_021c8400
        .global func_ov002_02271518
        .arm
func_ov002_02271518:
    stmdb sp!, {r3, r4, r5, lr}
    add r4, r1, r2
    mov r5, r0
    cmp r4, #0x4
    movgt r0, #0x0
    ldmgtia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT0
    ldr r1, [r1]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    cmp r5, r1
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT1
    mov r2, #0x14
    ldr r3, _LIT2
    and ip, r5, #0x1
    mul r2, r4, r2
    mla r1, ip, r1, r3
    ldrh r1, [r2, r1]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r1, r5
    mov r2, r4
    bl func_ov002_021bc7e8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021c8400
    cmp r0, #0x3
    movgt r0, #0x0
    movle r0, #0x800
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cd220
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf0c4
