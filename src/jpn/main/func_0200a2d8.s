; func_0200a2d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_02106730
        .extern data_0210685c
        .global func_0200a2d8
        .arm
func_0200a2d8:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    ldr r3, _LIT1
    ldrh r2, [r1, #0xb4]
    ldr r1, _LIT2
    cmp r2, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    add r2, r3, #0x1a00
    ldrh r3, [r2, #0xa4]
    cmp r0, r3
    movge r0, #0x0
    ldmgeia sp!, {r3, pc}
    ldrh r2, [r2, #0xa6]
    rsb r0, r0, #0x4f
    ldr r3, _LIT3
    add ip, r2, r0
    smull r2, lr, r3, ip
    mov r0, ip, lsr #0x1f
    add lr, r0, lr, asr #0x5
    mov r3, #0x50
    smull r0, r2, r3, lr
    sub lr, ip, r0
    mov r0, #0x6
    mul r0, lr, r0
    ldrh r2, [r1, r0]
    add r0, r1, r0
    mov r1, r2, lsl #0x18
    movs r1, r1, lsr #0x18
    moveq r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_0210685c
_LIT1: .word data_02104e6c
_LIT2: .word data_02106730
_LIT3: .word 0x66666667
