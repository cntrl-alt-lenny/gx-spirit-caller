; func_ov002_02217888 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_0223df38
        .global func_ov002_02217888
        .arm
func_ov002_02217888:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    add r2, sp, #0x0
    mov r1, #0x0
    mov r5, r0
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_2b4
    ldr ip, [sp]
    ldr r0, _LIT0
    and r2, ip, #0xff
    ldr r1, _LIT1
    and r3, r2, #0x1
    mla r2, r3, r0, r1
    mov r0, ip, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r1, r0, #0xff
    mov r0, #0x14
    mla r0, r1, r0, r2
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrneh r0, [r5, #0x8]
    strneh r0, [r4, #0x8]
.L_2b4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
