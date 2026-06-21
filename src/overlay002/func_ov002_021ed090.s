; func_ov002_021ed090 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a2
        .extern data_ov002_022cf1a4
        .global func_ov002_021ed090
        .arm
func_ov002_021ed090:
    stmdb sp!, {r4, lr}
    ldr r3, _LIT0
    and r4, r1, #0x1
    mul r3, r4, r3
    ldr r4, _LIT1
    mov ip, #0x14
    ldrh lr, [r0, #0x2]
    mul r0, r2, ip
    add r4, r4, r3
    mov ip, lr, lsl #0x1f
    add r4, r4, r0
    ldr lr, [r4, #0x30]
    mov ip, ip, lsr #0x1f
    rsb ip, ip, #0x1
    cmp r1, ip
    mov r4, lr, lsl #0x13
    mov r1, r4, lsr #0x13
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    cmp r2, #0x5
    movge r0, #0x0
    ldmgeia sp!, {r4, pc}
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT2
    add r1, r1, r3
    ldrh r1, [r0, r1]
    cmp r1, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r1, _LIT3
    add r1, r1, r3
    ldrh r0, [r0, r1]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
_LIT3: .word data_ov002_022cf1a2
