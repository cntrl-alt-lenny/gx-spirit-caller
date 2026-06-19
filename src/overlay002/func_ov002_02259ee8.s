; func_ov002_02259ee8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022c819c
        .extern func_ov002_021b40dc
        .extern func_ov002_02259aec
        .global func_ov002_02259ee8
        .arm
func_ov002_02259ee8:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    mov r7, r2
    mov r6, r3
    cmp r1, #0xe
    bne .L_3dc
    ldr r2, _LIT0
    mov r1, #0xb
    bl func_ov002_021b40dc
    cmp r0, #0x0
    beq .L_3dc
    mov r0, r8
    mov r1, r7
    mov r2, r6
    bl func_ov002_02259aec
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_3dc:
    ldr r4, _LIT1
    mov r5, #0x0
.L_3e4:
    ldr r0, [r4, r5, lsl #0x4]
    cmp r7, r0
    bne .L_410
    add r0, r4, r5, lsl #0x4
    ldr r3, [r0, #0xc]
    mov r0, r8
    mov r1, r7
    mov r2, r6
    blx r3
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_410:
    add r5, r5, #0x1
    cmp r5, #0x1b
    bcc .L_3e4
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00001a04
_LIT1: .word data_ov002_022c819c
