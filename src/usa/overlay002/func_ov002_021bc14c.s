; func_ov002_021bc14c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .global func_ov002_021bc14c
        .arm
func_ov002_021bc14c:
    stmdb sp!, {r3, lr}
    ldr r3, _LIT0
    ldr r2, _LIT1
    and r0, r0, #0x1
    mla lr, r0, r2, r3
    mov r0, #0x0
    mov r3, r0
    add ip, lr, #0x30
.L_178:
    ldr r2, [ip]
    mov r2, r2, lsl #0x13
    movs r2, r2, lsr #0x13
    beq .L_194
    ldrh r2, [lr, #0x36]
    cmp r1, r2
    addeq r0, r0, #0x1
.L_194:
    add r3, r3, #0x1
    cmp r3, #0x5
    add ip, ip, #0x14
    add lr, lr, #0x14
    blt .L_178
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
