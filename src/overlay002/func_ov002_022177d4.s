; func_ov002_022177d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf1a4
        .extern func_ov002_021bb068
        .extern func_ov002_021d63fc
        .extern func_ov002_0223df38
        .global func_ov002_022177d4
        .arm
func_ov002_022177d4:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldrh r0, [r4, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r3, r4, pc}
    ldr r0, _LIT0
    bl func_ov002_021bb068
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r3, r4, pc}
    add r2, sp, #0x0
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_238
    ldr r0, [sp]
    ldr r2, _LIT1
    and r1, r0, #0xff
    ldr r3, _LIT2
    and ip, r1, #0x1
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    mla r3, ip, r2, r3
    and r2, r0, #0xff
    mov r0, #0x14
    smulbb r0, r2, r0
    ldrh r0, [r0, r3]
    cmp r0, #0x0
    beq .L_238
    mov r0, r4
    mov r3, #0x0
    bl func_ov002_021d63fc
.L_238:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
_LIT0: .word 0x0000135d
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf1a4
