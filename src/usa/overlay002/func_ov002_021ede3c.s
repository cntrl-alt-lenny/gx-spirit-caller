; func_ov002_021ede3c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0cc
        .extern func_ov002_021c1d64
        .global func_ov002_021ede3c
        .arm
func_ov002_021ede3c:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r4, _LIT0
    and ip, r1, #0x1
    mul r5, ip, r4
    mov r3, #0x14
    mul r4, r2, r3
    ldr ip, _LIT1
    cmp r2, #0x5
    add r3, ip, r5
    add r3, r3, r4
    ldr r3, [r3, #0x30]
    movge r0, #0x0
    mov r3, r3, lsl #0x13
    mov r3, r3, lsr #0x13
    ldmgeia sp!, {r3, r4, r5, pc}
    cmp r3, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_ov002_021c1d64
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT2
    add r0, r0, r5
    ldr r0, [r4, r0]
    mov r0, r0, lsr #0x4
    and r0, r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0cc
