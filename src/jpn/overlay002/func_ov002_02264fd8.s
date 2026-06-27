; func_ov002_02264fd8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021b3fb8
        .extern func_ov002_021df5e4
        .extern func_ov002_021df64c
        .global func_ov002_02264fd8
        .arm
func_ov002_02264fd8:
    stmdb sp!, {r4, lr}
    ldr r2, _LIT0
    mov r1, #0xb
    mov r4, r0
    bl func_ov002_021b3fb8
    cmp r0, #0x0
    beq .L_104
    ldr r1, _LIT0
    mov r0, r4
    bl func_ov002_021df5e4
    ldr r0, _LIT1
    and r1, r4, #0x1
    mul r2, r1, r0
    ldr r0, _LIT2
    ldr r3, _LIT3
    ldr r1, [r0, r2]
    mov r0, r4
    add ip, r1, #0x5
    smull r2, r1, r3, ip
    mov r2, ip, lsr #0x1f
    add r1, r2, r1, asr #0x2
    bl func_ov002_021df64c
.L_104:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word 0x0000143d
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf08c
_LIT3: .word 0x66666667
