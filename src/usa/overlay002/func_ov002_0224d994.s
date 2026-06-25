; func_ov002_0224d994 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_0202df24
        .extern func_ov002_021ca4dc
        .extern func_ov002_02253370
        .global func_ov002_0224d994
        .arm
func_ov002_0224d994:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldr r0, _LIT0
    ldr r1, _LIT1
    and r3, r5, #0x1
    mla r0, r3, r0, r1
    mov r4, r2
    add r6, r0, #0x120
    ldr r0, [r6, r4, lsl #0x2]
    ldr r1, _LIT2
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202df24
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r1, [r6, r4, lsl #0x2]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    bl func_ov002_021ca4dc
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r5
    mov r2, r4
    mov r1, #0xb
    bl func_ov002_02253370
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x000012ec
