; func_ov002_021b2c6c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022d0570
        .global func_ov002_021b2c6c
        .arm
func_ov002_021b2c6c:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    cmp r3, #0x0
    add r0, r0, r2, lsl #0x3
    bne .L_584
    ldrh r2, [r0, #0x2]
    mov r1, #0x0
    mov r3, #0x1
    bic r2, r2, #0xf0
    strh r2, [r0, #0x2]
    strh r1, [r0]
    b .L_5d8
.L_584:
    ldrh r1, [r0, #0x2]
    mov r1, r1, lsl #0x1c
    mov r1, r1, lsr #0x1c
    cmp r1, #0x6
    bcc .L_5d8
    cmp r3, #0x6
    bge .L_5d8
    ldrh r4, [r0]
    ldr r1, _LIT1
    ldr r2, _LIT2
    and ip, r4, #0xff
    and lr, ip, #0x1
    mla ip, lr, r1, r2
    mov r1, r4, asr #0x8
    and r2, r1, #0xff
    mov r1, #0x14
    mla r1, r2, r1, ip
    ldr r1, [r1, #0x30]
    mov r1, r1, lsl #0x13
    mov r1, r1, lsr #0x13
    strh r1, [r0]
.L_5d8:
    ldrh r2, [r0, #0x2]
    mov r1, r3, lsl #0x10
    mov r1, r1, lsr #0x10
    bic r2, r2, #0xf
    and r1, r1, #0xf
    orr r2, r2, r1
    ldr r1, [sp, #0x8]
    strh r2, [r0, #0x2]
    strh r1, [r0, #0x4]
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d0570
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf08c
