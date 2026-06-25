; func_ov002_021ecd44 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern func_0202e274
        .extern func_ov002_021c1e10
        .global func_ov002_021ecd44
        .arm
func_ov002_021ecd44:
    stmdb sp!, {r3, r4, r5, lr}
    ldr ip, _LIT0
    and lr, r1, #0x1
    mul r4, lr, ip
    mov r3, #0x14
    mul lr, r2, r3
    ldr ip, _LIT1
    cmp r2, #0x5
    add r3, ip, r4
    add r3, r3, lr
    ldr r3, [r3, #0x30]
    movge r0, #0x0
    mov r3, r3, lsl #0x13
    mov r5, r3, lsr #0x13
    ldmgeia sp!, {r3, r4, r5, pc}
    cmp r5, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r3, _LIT2
    add r3, r3, r4
    ldrh r3, [lr, r3]
    cmp r3, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_ov002_021c1e10
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r5
    bl func_0202e274
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
