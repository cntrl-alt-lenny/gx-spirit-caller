; func_ov002_02249308 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0a0
        .extern func_ov002_02253370
        .global func_ov002_02249308
        .arm
func_ov002_02249308:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r6, r0
    rsb r5, r6, #0x1
    ldr r0, _LIT0
    and r2, r5, #0x1
    mul r1, r2, r0
    ldr r0, _LIT1
    mov r4, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    bls .L_58
    ldr r0, _LIT2
    mov r7, #0xe
    add r8, r0, r1
.L_38:
    mov r0, r5
    mov r1, r7
    mov r2, r4
    bl func_ov002_02253370
    ldr r0, [r8, #0x14]
    add r4, r4, #0x1
    cmp r4, r0
    bcc .L_38
.L_58:
    ldr r0, _LIT0
    and r2, r6, #0x1
    mul r1, r2, r0
    ldr r0, _LIT1
    mov r4, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    ldmlsia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, _LIT2
    mov r5, #0xe
    add r7, r0, r1
.L_84:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_ov002_02253370
    ldr r0, [r7, #0x14]
    add r4, r4, #0x1
    cmp r4, r0
    bcc .L_84
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0a0
_LIT2: .word data_ov002_022cf08c
