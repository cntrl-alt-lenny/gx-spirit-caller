; func_ov002_022449e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cf1a4
        .extern func_ov002_021d6714
        .extern func_ov002_021e2b1c
        .global func_ov002_022449e4
        .arm
func_ov002_022449e4:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    ldr r2, _LIT1
    ldr r0, [r1, #0x4]
    ldr r1, [r1, #0x20]
    mov r3, #0x14
    ldr ip, _LIT2
    and lr, r0, #0x1
    mul r3, r1, r3
    mla r2, lr, r2, ip
    ldrh r2, [r3, r2]
    cmp r2, #0x0
    bne .L_248
    mov r2, #0x1
    bl func_ov002_021d6714
    mov r0, #0x1e
    bl func_ov002_021e2b1c
    ldr r1, _LIT0
    mov r2, #0x0
    ldr r0, [r1, #0x4]
    ldr r1, [r1, #0x20]
    bl func_ov002_021d6714
.L_248:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022cd3f4
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf1a4
