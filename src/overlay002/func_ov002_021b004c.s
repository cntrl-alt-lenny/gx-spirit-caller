; func_ov002_021b004c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cdc78
        .extern data_ov002_022cdc88
        .global func_ov002_021b004c
        .arm
func_ov002_021b004c:
    ldr r2, _LIT0
    mov r3, #0x0
    ldr ip, [r2, #0xc]
    cmp ip, #0x0
    bls .L_f8
.L_d0:
    add r1, r2, r3, lsl #0x1
    add r1, r1, #0x400
    ldrh r1, [r1, #0x10]
    cmp r0, r1, asr #0x8
    ldreq r0, _LIT1
    addeq r0, r0, r3, lsl #0x2
    bxeq lr
    add r3, r3, #0x1
    cmp r3, ip
    bcc .L_d0
.L_f8:
    ldr r0, _LIT1
    add r0, r0, r3, lsl #0x2
    bx lr
_LIT0: .word data_ov002_022cdc78
_LIT1: .word data_ov002_022cdc88
