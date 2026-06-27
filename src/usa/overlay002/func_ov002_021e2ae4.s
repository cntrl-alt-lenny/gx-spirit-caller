; func_ov002_021e2ae4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern func_ov002_021b1490
        .global func_ov002_021e2ae4
        .arm
func_ov002_021e2ae4:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r0, [r0, #0x5d8]
    cmp r0, #0x0
    ldmneia sp!, {r3, pc}
    ldr r0, _LIT1
    ldr r1, [r0, #0xd0c]
    cmp r1, #0x0
    beq .L_38
    ldr r1, [r0, #0xcec]
    ldr r0, _LIT2
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x2
    beq .L_60
.L_38:
    ldr r0, _LIT0
    ldr r2, [r0, #0x5cc]
    add r1, r2, #0x1
    str r1, [r0, #0x5cc]
    cmp r2, #0x0
    ldmneia sp!, {r3, pc}
    ldr r1, [r0, #0x5d0]
    add r1, r1, #0x1
    str r1, [r0, #0x5d0]
    ldmia sp!, {r3, pc}
.L_60:
    mov r0, #0xa
    mov r3, #0x2
    add r2, sp, #0x0
    sub r1, r0, #0xb
    strh r3, [sp]
    bl func_ov002_021b1490
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022d008c
_LIT2: .word data_ov002_022cd664
