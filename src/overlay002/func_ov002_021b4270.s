; func_ov002_021b4270 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf1a6
        .extern data_ov002_022d0650
        .global func_ov002_021b4270
        .arm
func_ov002_021b4270:
    stmdb sp!, {r4, lr}
    ldr r3, _LIT0
    mov ip, #0x14
    ldr lr, _LIT1
    and r4, r0, #0x1
    mul ip, r1, ip
    mla r0, r4, r3, lr
    ldrh r4, [ip, r0]
    mov r0, #0x0
    cmp r4, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r3, _LIT2
.L_30:
    add ip, r3, r4, lsl #0x3
    ldrh r1, [ip, #0x2]
    ldrh r4, [ip, #0x6]
    mov r1, r1, lsl #0x1c
    mov r1, r1, lsr #0x1c
    cmp r1, #0x6
    bcs .L_5c
    ldrh r1, [ip]
    cmp r1, r2
    ldreqh r1, [ip, #0x4]
    addeq r0, r0, r1
.L_5c:
    cmp r4, #0x0
    bne .L_30
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1a6
_LIT2: .word data_ov002_022d0650
