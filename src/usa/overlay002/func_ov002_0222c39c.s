; func_ov002_0222c39c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cf0c4
        .extern func_ov002_021de3c0
        .global func_ov002_0222c39c
        .arm
func_ov002_0222c39c:
    stmdb sp!, {r4, lr}
    ldr r2, _LIT0
    ldr r1, [r2, #0x14]
    cmp r1, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r1, [r2, #0x24]
    cmp r1, #0x0
    ldr r1, [r2, #0x4]
    ldr r2, [r2, #0x20]
    beq .L_5bc
    ldr lr, _LIT1
    ldr r3, _LIT2
    and ip, r1, #0x1
    mla lr, ip, r3, lr
    mov r4, #0x14
    mul ip, r2, r4
    ldrh r4, [lr, ip]
    mov r3, #0x0
    strh r3, [lr, ip]
    bl func_ov002_021de3c0
    ldr r1, _LIT0
    ldr r0, _LIT2
    ldr ip, [r1, #0x4]
    ldr r2, [r1, #0x20]
    mov r1, #0x14
    ldr r3, _LIT1
    and ip, ip, #0x1
    mul r1, r2, r1
    mla r0, ip, r0, r3
    strh r4, [r1, r0]
    b .L_5c0
.L_5bc:
    bl func_ov002_021de3c0
.L_5c0:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cd314
_LIT1: .word data_ov002_022cf0c4
_LIT2: .word 0x00000868
