; func_ov002_021de528 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_0202e2c8
        .extern func_ov002_021de134
        .global func_ov002_021de528
        .arm
func_ov002_021de528:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r3, _LIT0
    and lr, r1, #0x1
    ldr ip, _LIT1
    mov r5, r0
    mla ip, lr, r3, ip
    mov r3, #0x14
    mla r3, r2, r3, ip
    ldr r3, [r3, #0x30]
    add r1, r2, r1, lsl #0x4
    mov r0, r3, lsl #0x13
    mov r2, #0x1
    mov r0, r0, lsr #0x13
    mov r4, r2, lsl r1
    bl func_0202e2c8
    cmp r0, #0x0
    movne r2, #0xc
    moveq r2, #0xd
    mov r0, r5
    mov r1, r4
    mov r3, #0x2
    bl func_ov002_021de134
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
