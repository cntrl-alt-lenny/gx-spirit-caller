; func_ov002_0224fd9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern func_0202e1e0
        .extern func_ov002_021c37e4
        .extern func_ov002_021ca360
        .extern func_ov002_02253370
        .global func_ov002_0224fd9c
        .arm
func_ov002_0224fd9c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    ldr r0, _LIT0
    ldr r1, _LIT1
    and r3, r6, #0x1
    mla r0, r3, r0, r1
    mov r5, r2
    add r7, r0, #0x120
    ldr r0, [r7, r5, lsl #0x2]
    mov r0, r0, lsl #0x13
    mov r4, r0, lsr #0x13
    mov r0, r4
    bl func_0202e1e0
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r2, [r7, r5, lsl #0x2]
    mov r0, r6
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    bl func_ov002_021c37e4
    ldr r1, _LIT2
    ldr r1, [r1, #0x48c]
    ldrh r1, [r1, #0xc]
    cmp r1, r0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r6
    mov r1, r4
    bl func_ov002_021ca360
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r6
    mov r2, r5
    mov r1, #0xb
    bl func_ov002_02253370
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022ce1a8
