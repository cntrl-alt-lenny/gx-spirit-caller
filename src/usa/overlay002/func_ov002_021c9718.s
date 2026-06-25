; func_ov002_021c9718 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cd3d8
        .extern data_ov002_022cd3ec
        .extern data_ov002_022cf0c2
        .global func_ov002_021c9718
        .arm
func_ov002_021c9718:
    stmdb sp!, {r3, lr}
    sub r3, r1, #0xb
    cmp r3, #0x4
    addls pc, pc, r3, lsl #0x2
    b .L_438
    b .L_430
    b .L_430
    b .L_430
    b .L_430
    b .L_430
.L_430:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_438:
    add lr, r1, r2
    cmp lr, #0xa
    ble .L_468
    ldr r2, _LIT0
    ldr r3, [r2]
    cmp r0, r3
    ldreq r0, [r2, #0x1c]
    cmpeq r1, r0
    ldreq r0, _LIT1
    ldrne r0, _LIT2
    ldrh r0, [r0, #0x6]
    ldmia sp!, {r3, pc}
.L_468:
    ldr r1, _LIT3
    mov r2, #0x14
    ldr r3, _LIT4
    and ip, r0, #0x1
    mul r2, lr, r2
    mla r0, ip, r1, r3
    ldrh r0, [r2, r0]
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022cd314
_LIT1: .word data_ov002_022cd3d8
_LIT2: .word data_ov002_022cd3ec
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022cf0c2
