; func_ov002_021de9d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021de044
        .global func_ov002_021de9d8
        .arm
func_ov002_021de9d8:
    stmdb sp!, {r4, lr}
    ldr r3, _LIT0
    ldr ip, _LIT1
    and lr, r1, #0x1
    mla ip, lr, r3, ip
    mov r3, #0x14
    mla r3, r2, r3, ip
    ldr r3, [r3, #0x30]
    add ip, r2, r1, lsl #0x4
    mov r2, r3, lsl #0x12
    mov r3, #0x1
    cmp r1, r2, lsr #0x1f
    mov r4, r3, lsl ip
    moveq r3, #0x40000
    movne r3, #0x0
    mov r1, r4
    mov r2, #0xd
    bl func_ov002_021de044
    tst r4, r0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
