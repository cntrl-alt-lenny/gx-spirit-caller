; func_ov004_021d3de4 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0210594c
        .extern data_ov004_02209f88
        .extern data_ov004_0220e500
        .extern func_02051ab0
        .extern func_ov004_021d38b4
        .global func_ov004_021d3de4
        .arm
func_ov004_021d3de4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov004_021d38b4
    ldr r1, _LIT0
    mov r0, r4
    mov r2, #0x1
    bl func_02051ab0
    ldr r1, _LIT1
    ldr r1, [r1, #0xc9c]
    cmp r1, #0x0
    beq .L_38
    cmp r0, #0x3e8
    movge lr, #0x1
    bge .L_3c
.L_38:
    mov lr, #0x0
.L_3c:
    ldr r3, _LIT2
    mov ip, r0
    smull r2, r0, r3, ip
    mov r1, ip, lsr #0x1f
    add r0, r1, r0, asr #0x6
    mov r2, #0x3e8
    smull r0, r1, r2, r0
    sub r0, ip, r0
    cmp lr, #0x0
    movne r0, #0x32
    ldmneia sp!, {r4, pc}
    ldr r1, _LIT3
    ldrh r2, [r1, #0x58]
    mov r1, #0xa
    subs ip, r0, r2
    movpl r3, ip
    rsbmi r3, ip, #0x0
    mul r1, r3, r1
    cmp r0, #0xa
    rsb r0, r1, #0x64
    cmple r2, #0xa
    ldmleia sp!, {r4, pc}
    cmp ip, #0x0
    rsblt ip, ip, #0x0
    cmp ip, #0x5
    movgt r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov004_02209f88
_LIT1: .word data_ov004_0220e500
_LIT2: .word 0x10624dd3
_LIT3: .word data_0210594c
