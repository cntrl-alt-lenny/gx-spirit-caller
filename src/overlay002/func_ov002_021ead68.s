; func_ov002_021ead68 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern func_0202e2f8
        .extern func_ov002_021c1e44
        .extern func_ov002_021c1ef0
        .global func_ov002_021ead68
        .arm
func_ov002_021ead68:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r1
    ldr r3, _LIT0
    mov r4, r2
    and r6, r5, #0x1
    mov r1, #0x14
    mul r3, r6, r3
    mul ip, r4, r1
    ldr r2, _LIT1
    mov r6, r0
    add r1, r2, r3
    add r1, r1, ip
    ldr r1, [r1, #0x30]
    cmp r4, #0x5
    mov r0, r1, lsl #0x13
    mov r0, r0, lsr #0x13
    movge r0, #0x0
    ldmgeia sp!, {r4, r5, r6, pc}
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r1, _LIT2
    add r1, r1, r3
    ldrh r1, [ip, r1]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    bl func_0202e2f8
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_ov002_021c1ef0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_ov002_021c1e44
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
