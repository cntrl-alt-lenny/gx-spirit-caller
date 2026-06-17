; func_ov002_02234bc0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022d016c
        .extern func_ov002_021de408
        .extern func_ov002_021df818
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .global func_ov002_02234bc0
        .arm
func_ov002_02234bc0:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, _LIT0
    mov r5, r0
    ldr r0, [r1, #0xd0]
    mov r4, #0x0
    tst r0, #0x1
    movne r0, r4
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r0, lsr #0x1
    tst r0, #0x1
    moveq r0, r4
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_ov002_021e2b3c
    ldr r0, _LIT1
    mov ip, #0x1
    ldr r3, [r0, #0x1c]
    ldr r2, [r0]
    ldr r1, [r0, #0x20]
    add r2, r3, r2, lsl #0x4
    ldr r0, [r0, #0x4]
    orr r2, r4, ip, lsl r2
    add r0, r1, r0, lsl #0x4
    orr r1, r2, ip, lsl r0
    mov r0, r5
    bl func_ov002_021de408
    ldrh r1, [r5, #0x2]
    mov r0, r5
    mov r2, #0x320
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_021df818
    bl func_ov002_021e2c5c
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word data_ov002_022cd3f4
