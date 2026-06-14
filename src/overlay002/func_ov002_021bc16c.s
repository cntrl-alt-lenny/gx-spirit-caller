; func_ov002_021bc16c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .global func_ov002_021bc16c
        .arm
func_ov002_021bc16c:
    stmdb sp!, {r4, lr}
    ldr ip, _LIT0
    ldr r3, _LIT1
    and r0, r0, #0x1
    mla r4, r0, r3, ip
    mov r0, #0x0
    mov ip, r0
    add lr, r4, #0x30
.L_b8:
    ldr r3, [lr]
    mov r3, r3, lsl #0x13
    movs r3, r3, lsr #0x13
    beq .L_dc
    ldrh r3, [r4, #0x38]
    cmp r1, r3
    ldreqh r3, [r4, #0x36]
    cmpeq r2, r3
    addeq r0, r0, #0x1
.L_dc:
    add ip, ip, #0x1
    cmp ip, #0x5
    add lr, lr, #0x14
    add r4, r4, #0x14
    blt .L_b8
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
