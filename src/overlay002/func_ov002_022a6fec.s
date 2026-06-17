; func_ov002_022a6fec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_ov002_022cd73c
        .global func_ov002_022a6fec
        .arm
func_ov002_022a6fec:
    ldr r0, _LIT0
    ldr r3, _LIT1
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1b
    mov r0, r0, lsr #0x1e
    tst r0, #0x1
    addne r2, r2, #0x18
    sub r2, r2, #0x46
    smull r0, ip, r3, r2
    add ip, r2, ip
    mov r0, r2, lsr #0x1f
    add ip, r0, ip, asr #0x4
    ldr r0, _LIT2
    cmp ip, #0x0
    ldr r0, [r0, #0x4]
    movle ip, #0x0
    cmp ip, #0x4
    movgt ip, #0x4
    eor r0, r0, #0x1
    cmp r1, r0
    rsbeq r0, ip, #0x9
    addne r0, ip, #0x5
    bx lr
_LIT0: .word data_02104f4c
_LIT1: .word 0x92492493
_LIT2: .word data_ov002_022cd73c
