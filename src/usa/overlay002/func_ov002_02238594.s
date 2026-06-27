; func_ov002_02238594 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021b939c
        .extern func_ov002_021d7c1c
        .global func_ov002_02238594
        .arm
func_ov002_02238594:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x14]
    mov r0, r0, lsl #0x17
    mov r0, r0, lsr #0x17
    bl func_ov002_021b939c
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r2, r0, lsr #0x10
    mov r1, r1, asr #0x8
    mov r2, r2, lsl #0x10
    and r1, r1, #0xff
    cmp r1, #0xe
    and r1, r0, #0xff
    mov ip, r2, lsr #0x10
    bne .L_170
    ldr r3, _LIT0
    ldr r0, _LIT1
    and r2, r1, #0x1
    mla r0, r2, r0, r3
    add r0, r0, #0x18
    add r2, r0, #0x400
    mov r0, r4
    add r2, r2, ip, lsl #0x2
    bl func_ov002_021d7c1c
.L_170:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
