; func_ov011_021cd0cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d325a
        .extern data_ov011_021d34d8
        .extern data_ov011_021d3f20
        .extern func_0201b730
        .global func_ov011_021cd0cc
        .arm
func_ov011_021cd0cc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0201b730
    sub ip, r4, #0x1
    mov r1, #0x72
    mul r2, ip, r1
    ldr r1, _LIT0
    ldr r3, _LIT1
    ldrb r2, [r1, r2]
    ldrb ip, [r3, ip]
    ldr r1, _LIT2
    rsb r2, r2, #0x20
    mvn r3, #0x0
    mov r2, r3, lsr r2
    sub r3, ip, #0x1
    and r2, r2, r0, lsr r3
    ldr r3, [r1, #0x2a8]
    ldr r0, _LIT3
    mov r2, r2, lsl #0x18
    and r0, r3, r0
    orr r0, r0, r2, lsr #0x7
    str r0, [r1, #0x2a8]
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov011_021d325a
_LIT1: .word data_ov011_021d34d8
_LIT2: .word data_ov011_021d3f20
_LIT3: .word 0xfe01ffff
