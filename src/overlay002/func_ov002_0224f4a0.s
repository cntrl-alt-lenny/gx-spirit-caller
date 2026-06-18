; func_ov002_0224f4a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern func_0202e234
        .extern func_ov002_021c38c4
        .extern func_ov002_021ca5bc
        .extern func_ov002_02253458
        .extern func_ov002_02257ab8
        .global func_ov002_0224f4a0
        .arm
func_ov002_0224f4a0:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldr r3, _LIT0
    ldr r0, _LIT1
    and r1, r5, #0x1
    mla r0, r1, r0, r3
    mov r4, r2
    add r0, r0, #0x120
    ldr r2, [r0, r4, lsl #0x2]
    mov r0, r2, lsl #0x2
    mov r1, r0, lsr #0x18
    mov r0, r2, lsl #0x13
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    mov r0, r0, lsr #0x13
    add r6, r1, r2, lsr #0x1f
    bl func_0202e234
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r6
    bl func_ov002_021ca5bc
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r5
    mov r1, r6
    bl func_ov002_021c38c4
    ldr r2, _LIT2
    mov r1, r5
    ldr r3, [r2, #0x48c]
    strh r0, [r3, #0xc]
    ldr r0, [r2, #0x48c]
    bl func_ov002_02257ab8
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r5
    mov r2, r4
    mov r1, #0xb
    bl func_ov002_02253458
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022ce288
