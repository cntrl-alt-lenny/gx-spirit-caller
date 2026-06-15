; func_02054b44 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02054b44
        .arm
func_02054b44:
    ldr r1, _LIT0
    ldr r2, _LIT1
    mov r3, r0, lsr #0x10
    and r1, r0, r1
    mul ip, r3, r2
    mul r2, r1, r2
    ldr r0, _LIT2
    mvn r1, #-2147483648
    and r0, ip, r0
    add r0, r2, r0, lsl #0x10
    cmp r0, r1
    bichi r0, r0, #-2147483648
    addhi r0, r0, #0x1
    add r0, r0, ip, lsr #0xf
    mvn r1, #-2147483648
    cmp r0, r1
    bichi r0, r0, #-2147483648
    addhi r0, r0, #0x1
    bx lr
_LIT0: .word 0x0000ffff
_LIT1: .word 0x000041a7
_LIT2: .word 0x00007fff
