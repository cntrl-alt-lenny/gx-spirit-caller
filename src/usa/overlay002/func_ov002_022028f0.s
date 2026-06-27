; func_ov002_022028f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern func_ov002_021c1e10
        .global func_ov002_022028f0
        .arm
func_ov002_022028f0:
    stmdb sp!, {r4, lr}
    ldrh r1, [r0, #0x2]
    ldr r2, _LIT0
    mov r1, r1, lsl #0x14
    mov r3, r1, lsr #0x1a
    cmp r3, #0x12
    ldr r1, [r2]
    cmpne r3, #0x13
    ldr r2, [r2, #0x1c]
    cmpne r3, #0x14
    bne .L_198
    ldr ip, _LIT1
    and lr, r1, #0x1
    mov r3, #0x14
    mul r4, lr, ip
    ldr ip, _LIT2
    mul lr, r2, r3
    add r3, ip, r4
    add r3, r3, lr
    ldr r3, [r3, #0x30]
    mov r3, r3, lsl #0x13
    movs r3, r3, lsr #0x13
    beq .L_198
    ldr r3, _LIT3
    add r3, r3, r4
    ldrh r3, [lr, r3]
    cmp r3, #0x0
    beq .L_198
    bl func_ov002_021c1e10
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
.L_198:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cd314
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf08c
_LIT3: .word data_ov002_022cf0c4
