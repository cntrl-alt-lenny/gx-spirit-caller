; func_ov002_021ba1b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf09c
        .extern func_0202df24
        .global func_ov002_021ba1b4
        .arm
func_ov002_021ba1b4:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r2, _LIT0
    and r0, r0, #0x1
    mul r2, r0, r2
    ldr r0, _LIT1
    mov r5, r1
    ldr r0, [r0, r2]
    mov r4, #0x0
    cmp r0, #0x0
    bls .L_68
    ldr r0, _LIT2
    add r7, r0, r2
    add r6, r7, #0x260
.L_34:
    ldr r0, [r6]
    mov r1, r5
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202df24
    cmp r0, #0x0
    movne r0, r4
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r7, #0x10]
    add r4, r4, #0x1
    cmp r4, r0
    add r6, r6, #0x4
    bcc .L_34
.L_68:
    mvn r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf09c
_LIT2: .word data_ov002_022cf08c
