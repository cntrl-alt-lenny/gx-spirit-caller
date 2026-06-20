; func_ov002_022172f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd420
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_ov002_021de910
        .global func_ov002_022172f0
        .arm
func_ov002_022172f0:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    ldr r3, _LIT1
    ldr r1, [r1, #0xcec]
    mov r2, #0x38
    mla r3, r1, r2, r3
    ldr r1, [r3, #0x2c]
    cmp r1, #0x0
    bne .L_1f4
    ldr r1, [r3]
    ldr lr, _LIT2
    and ip, r1, #0x1
    add r2, r2, #0x830
    mla lr, ip, r2, lr
    ldr r2, [r3, #0x4]
    mov ip, #0x14
    mul ip, r2, ip
    add lr, lr, #0x30
    ldr ip, [lr, ip]
    ldr lr, [r3, #0xc]
    mov r3, ip, lsl #0x2
    mov r3, r3, lsr #0x18
    mov ip, ip, lsl #0x12
    mov r3, r3, lsl #0x1
    add r3, r3, ip, lsr #0x1f
    cmp lr, r3
    bne .L_1f4
    bl func_ov002_021de910
.L_1f4:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word data_ov002_022cd420
_LIT2: .word data_ov002_022cf16c
