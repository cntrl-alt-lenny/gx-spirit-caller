; func_ov002_02203474 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .global func_ov002_02203474
        .arm
func_ov002_02203474:
    stmdb sp!, {r4, lr}
    ldrh r0, [r0, #0x2]
    mov ip, #0x0
    ldr r3, _LIT0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, _LIT1
    and r2, r0, #0x1
    mla r4, r2, r1, r3
    mov lr, ip
    add r3, r4, #0x30
.L_d4:
    ldr r1, [r3]
    mov r1, r1, lsl #0x13
    movs r1, r1, lsr #0x13
    addne r2, r4, lr
    ldrneh r1, [r2, #0x38]
    cmpne r1, #0x0
    ldrne r1, [r2, #0x30]
    movne r1, r1, lsl #0x12
    cmpne r0, r1, lsr #0x1f
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
    add ip, ip, #0x1
    cmp ip, #0x4
    add r3, r3, #0x14
    add lr, lr, #0x14
    ble .L_d4
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
