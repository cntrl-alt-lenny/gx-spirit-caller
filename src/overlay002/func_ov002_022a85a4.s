; func_ov002_022a85a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_ov002_022d0f98
        .extern func_0207f05c
        .global func_ov002_022a85a4
        .arm
func_ov002_022a85a4:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    ldr r1, [r0, #0x584]
    cmp r1, #0x1e
    addle sp, sp, #0x8
    ldmleia sp!, {r3, pc}
    mov r0, r1, asr #0x4
    add r0, r1, r0, lsr #0x1b
    mov r0, r0, asr #0x5
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1e
    add r0, r1, r0, ror #0x1e
    ldr r2, _LIT0
    mov r0, r0, lsl #0xa
    ldr r1, [r2, #0x4]
    add r0, r0, #0x980
    add r2, r0, #0xc000
    mov r1, r1, lsl #0x1b
    mov r0, r2, asr #0x6
    mov ip, r1, lsr #0x1e
    add r0, r2, r0, lsr #0x19
    mov r3, r0, asr #0x7
    add r1, ip, ip, lsr #0x1f
    movs r0, r1, asr #0x1
    moveq r2, #0x1
    mov r1, ip, lsr #0x1f
    movne r2, #0x0
    rsb r0, r1, ip, lsl #0x1f
    adds r0, r1, r0, ror #0x1f
    mov r2, r2, lsl #0x4
    and r0, r2, #0xff
    movne r1, #0x18
    moveq r1, #0x0
    rsb r1, r1, #0xe0
    orr r0, r0, #0x2000
    orr r3, r3, #0x3000
    mov r1, r1, lsl #0x17
    orr r0, r0, #-2147483648
    orr ip, r0, r1, lsr #0x7
    ldr r0, _LIT1
    add r1, sp, #0x0
    mov r2, #0x1
    str ip, [sp]
    strh r3, [sp, #0x4]
    bl func_0207f05c
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
_LIT0: .word data_02104f4c
_LIT1: .word data_ov002_022d0f98
