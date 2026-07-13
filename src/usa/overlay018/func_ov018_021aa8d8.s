; func_ov018_021aa8d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov018_021ad780
        .extern data_ov018_021ad7c8
        .extern func_ov018_021ad040
        .global func_ov018_021aa8d8
        .arm
func_ov018_021aa8d8:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    ldr ip, _LIT1
    ldr lr, [r1, #0x9cc]
    mov r3, #0x3c
    mov r2, lr, asr #0xc
    smull r1, r4, ip, r2
    add r4, r4, lr, asr #0xc
    mov r1, r2, lsr #0x1f
    add r4, r1, r4, asr #0x5
    smull r1, r2, r3, r4
    rsb r4, r1, lr, asr #0xc
    cmp r4, #0x1e
    mov r1, r0
    rsblt r2, r4, r4, lsl #0x8
    rsbge r0, r4, #0x3c
    rsbge r2, r0, r0, lsl #0x8
    smull r0, r4, ip, r2
    add r4, r2, r4
    mov r0, r2, lsr #0x1f
    add r4, r0, r4, asr #0x4
    mov r0, r4, lsl #0x10
    mov r2, r0, lsr #0x10
    ldr r3, _LIT2
    mov r2, r2, lsl #0x10
    add r0, r3, #0x66
    add r0, r0, #0x900
    orr r2, r2, #0xb
    bl func_ov018_021ad040
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov018_021ad780
_LIT1: .word 0x88888889
_LIT2: .word data_ov018_021ad7c8
