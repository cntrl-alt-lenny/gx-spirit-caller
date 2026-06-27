; func_ov002_02216e4c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021d8814
        .extern func_ov002_021de4a8
        .global func_ov002_02216e4c
        .arm
func_ov002_02216e4c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0x14]
    ldr r1, _LIT0
    mov r0, r2, lsl #0x16
    mov r0, r0, lsr #0x1f
    ldr r3, _LIT1
    and lr, r0, #0x1
    mla ip, lr, r1, r3
    mov r1, r2, lsl #0x12
    mov r1, r1, lsr #0x1c
    mov r3, #0x14
    mla r3, r1, r3, ip
    ldr r3, [r3, #0x30]
    mov r3, r3, lsl #0x13
    movs r3, r3, lsr #0x13
    beq .L_5a0
    mov r2, r2, lsl #0x17
    mov r2, r2, lsr #0x17
    bl func_ov002_021d8814
    ldr r1, [r4, #0x14]
    mov r0, r4
    mov r3, r1, lsl #0x16
    mov r2, r1, lsl #0x12
    mov r1, r3, lsr #0x1f
    mov r2, r2, lsr #0x1c
    bl func_ov002_021de4a8
.L_5a0:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
