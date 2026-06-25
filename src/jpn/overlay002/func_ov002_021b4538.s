; func_ov002_021b4538 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_021b4538
        .arm
func_ov002_021b4538:
    ldr r1, _LIT0
    mov r2, #0x10000
    and r3, r0, r1
    and r1, r0, r1, lsr #0x1
    ldr r0, _LIT1
    add r1, r1, r3, lsr #0x1
    and r3, r1, r0
    and r1, r1, r0, lsr #0x2
    ldr r0, _LIT2
    add r1, r1, r3, lsr #0x2
    and r3, r1, r0
    and r1, r1, r0, lsr #0x4
    ldr r0, _LIT3
    add r3, r1, r3, lsr #0x4
    and r1, r3, r0
    and r0, r3, r0, lsr #0x8
    add r1, r0, r1, lsr #0x8
    rsb r2, r2, #0x0
    mov r0, r1, lsl #0x10
    and r1, r1, r2
    mov r0, r0, lsr #0x10
    add r0, r0, r1, lsr #0x10
    bx lr
_LIT0: .word 0xaaaaaaaa
_LIT1: .word 0xcccccccc
_LIT2: .word 0xf0f0f0f0
_LIT3: .word 0xff00ff00
