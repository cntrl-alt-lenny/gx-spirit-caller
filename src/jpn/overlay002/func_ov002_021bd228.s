; func_ov002_021bd228 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .global func_ov002_021bd228
        .arm
func_ov002_021bd228:
    ldr r2, _LIT0
    ldr r1, _LIT1
    and r0, r0, #0x1
    mla r1, r0, r1, r2
    add r3, r1, #0x94
    add ip, r1, #0x64
    mov r0, #0x0
    mov r2, #0x5
.L_2f8:
    ldr r1, [r3]
    mov r1, r1, lsl #0x13
    movs r1, r1, lsr #0x13
    beq .L_314
    ldrh r1, [ip, #0x38]
    cmp r1, #0x0
    addeq r0, r0, #0x1
.L_314:
    add r2, r2, #0x1
    cmp r2, #0xa
    add r3, r3, #0x14
    add ip, ip, #0x14
    blt .L_2f8
    bx lr
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
