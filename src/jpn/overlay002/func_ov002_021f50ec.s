; func_ov002_021f50ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .global func_ov002_021f50ec
        .arm
func_ov002_021f50ec:
    stmdb sp!, {r3, lr}
    ldrh r2, [r0, #0x2]
    ldrh r3, [r0, #0x4]
    ldr r0, _LIT0
    mov r1, r2, lsl #0x1f
    mov r1, r1, lsr #0x1f
    and r1, r1, #0x1
    mul r0, r1, r0
    mov r2, r2, lsl #0x1a
    ldr r1, _LIT1
    mov lr, r2, lsr #0x1b
    add ip, r1, r0
    mov r2, #0x14
    mul r1, lr, r2
    add ip, ip, #0x30
    mov lr, r3, lsl #0x11
    ldr ip, [ip, r1]
    mov lr, lr, lsr #0x17
    mov r3, ip, lsl #0x2
    mov r3, r3, lsr #0x18
    mov ip, ip, lsl #0x12
    mov r3, r3, lsl #0x1
    add r3, r3, ip, lsr #0x1f
    cmp lr, r3
    subne r0, r2, #0x15
    ldmneia sp!, {r3, pc}
    ldr r3, _LIT2
    add r0, r3, r0
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    movne r0, #0x1
    subeq r0, r2, #0x15
    ldmia sp!, {r3, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
