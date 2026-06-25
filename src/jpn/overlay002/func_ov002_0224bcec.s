; func_ov002_0224bcec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021c37e4
        .extern func_ov002_021ca360
        .extern func_ov002_02253370
        .global func_ov002_0224bcec
        .arm
func_ov002_0224bcec:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldr r4, _LIT0
    ldr r1, _LIT1
    and r3, r5, #0x1
    mla r1, r3, r1, r4
    mov r4, r2
    add r1, r1, #0x120
    ldr r2, [r1, r4, lsl #0x2]
    mov r1, r2, lsl #0x2
    mov r3, r2, lsl #0x13
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r6, r3, lsr #0x13
    bl func_ov002_021c37e4
    cmp r0, #0x4
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, r5
    mov r1, r6
    bl func_ov002_021ca360
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r5
    mov r2, r4
    mov r1, #0xb
    bl func_ov002_02253370
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
