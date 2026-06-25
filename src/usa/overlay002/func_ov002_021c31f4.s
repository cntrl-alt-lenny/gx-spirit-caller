; func_ov002_021c31f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0a0
        .global func_ov002_021c31f4
        .arm
func_ov002_021c31f4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r2, _LIT0
    and r0, r0, #0x1
    mul r2, r0, r2
    ldr r0, _LIT1
    mov r4, #0x0
    ldr r0, [r0, r2]
    mov r8, r1
    mov r5, r4
    cmp r0, #0x0
    bls .L_68
    ldr r0, _LIT2
    add r7, r0, r2
    add r0, r7, #0x18
    add r6, r0, #0x400
.L_3c:
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    blx r8
    cmp r0, #0x0
    ldr r0, [r7, #0x14]
    add r4, r4, #0x1
    addne r5, r5, #0x1
    cmp r4, r0
    add r6, r6, #0x4
    bcc .L_3c
.L_68:
    mov r0, r5
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0a0
_LIT2: .word data_ov002_022cf08c
