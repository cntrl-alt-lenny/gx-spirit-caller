; func_ov002_021ee578 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c2
        .extern data_ov002_022cf0c4
        .global func_ov002_021ee578
        .arm
func_ov002_021ee578:
    stmdb sp!, {r3, lr}
    cmp r2, #0x5
    movge r0, #0x0
    ldmgeia sp!, {r3, pc}
    ldr r3, _LIT0
    and lr, r1, #0x1
    mov ip, #0x14
    mul r3, lr, r3
    mul ip, r2, ip
    ldr lr, _LIT1
    add r2, lr, r3
    add r2, r2, ip
    ldr r2, [r2, #0x30]
    mov r2, r2, lsl #0x13
    movs r2, r2, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldrh r0, [r0, #0x2]
    mov r0, r0, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r0, _LIT2
    add r0, r0, r3
    ldrh r0, [ip, r0]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r0, _LIT3
    add r0, r0, r3
    ldrh r0, [ip, r0]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
_LIT3: .word data_ov002_022cf0c2
