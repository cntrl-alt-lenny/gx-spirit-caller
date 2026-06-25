; func_ov002_02249a08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_0202b86c
        .extern func_0202e1e0
        .extern func_0203176c
        .extern func_ov002_021b8ea0
        .extern func_ov002_021bcf50
        .extern func_ov002_02253370
        .global func_ov002_02249a08
        .arm
func_ov002_02249a08:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    ldr r0, _LIT0
    ldr r1, _LIT1
    and r3, r4, #0x1
    mla r0, r3, r0, r1
    mov r6, r2
    add r0, r0, r6, lsl #0x2
    ldr r0, [r0, #0x120]
    mov r0, r0, lsl #0x13
    mov r5, r0, lsr #0x13
    mov r0, r5
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_324
    mov r0, r5
    bl func_0203176c
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
.L_324:
    mov r0, r5
    bl func_ov002_021b8ea0
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, r4
    bl func_ov002_021bcf50
    cmp r0, #0x0
    bge .L_354
    mov r0, r5
    bl func_0202b86c
    cmp r0, #0x2
    ldmneia sp!, {r4, r5, r6, pc}
.L_354:
    mov r0, r4
    mov r2, r6
    mov r1, #0xb
    bl func_ov002_02253370
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
