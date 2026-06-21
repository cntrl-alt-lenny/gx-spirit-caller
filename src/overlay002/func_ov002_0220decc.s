; func_ov002_0220decc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cf1a4
        .extern func_ov002_021b90a8
        .global func_ov002_0220decc
        .arm
func_ov002_0220decc:
    stmdb sp!, {r3, lr}
    ldrh r1, [r0, #0x2]
    mov r2, r1, lsl #0x14
    mov r2, r2, lsr #0x1a
    cmp r2, #0x12
    bne .L_78
    ldr r0, [r0, #0x14]
    cmp r0, #0x0
    beq .L_78
    ldr r2, _LIT0
    mov r3, r1, lsl #0x1f
    ldr r0, [r2, #0x4]
    ldr r1, [r2, #0x20]
    cmp r0, r3, lsr #0x1f
    ldreq r2, [r2, #0x8]
    cmpeq r2, #0x0
    bne .L_78
    ldr r2, _LIT1
    mov r3, #0x14
    ldr ip, _LIT2
    and lr, r0, #0x1
    mul r3, r1, r3
    mla r2, lr, r2, ip
    ldrh r2, [r3, r2]
    cmp r2, #0x0
    beq .L_78
    bl func_ov002_021b90a8
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, pc}
.L_78:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022cd3f4
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf1a4
