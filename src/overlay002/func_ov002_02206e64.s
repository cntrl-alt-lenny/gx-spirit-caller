; func_ov002_02206e64 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .global func_ov002_02206e64
        .arm
func_ov002_02206e64:
    ldrh r1, [r0, #0x2]
    ldr r0, _LIT0
    ldr r2, _LIT1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    and r3, r1, #0x1
    rsb r1, r1, #0x1
    mul ip, r3, r0
    and r1, r1, #0x1
    mul r0, r1, r0
    ldr r1, [r2, ip]
    ldr r0, [r2, r0]
    add r1, r1, #0x7d0
    cmp r1, r0
    movle r0, #0x1
    movgt r0, #0x0
    bx lr
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
